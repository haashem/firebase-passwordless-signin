import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:passwordless_signin/auth/email_secure_store.dart';
import 'package:passwordless_signin/auth/models/failure.dart';
import 'package:passwordless_signin/auth/models/sign_in_link_settings.dart';
import 'package:passwordless_signin/auth/models/user.dart' as app_user_model;
import 'package:passwordless_signin/auth/passwordless_authenticator.dart';

import 'mocks/firebase_auth_spy.dart';

class MockFirebaseDynamicLinks extends Mock implements FirebaseDynamicLinks {}

class MockEmailSecureStorage extends Mock implements EmailSecureStore {}

void main() {
  late FirebaseAuthSpy firebaseAuth;
  late FirebaseDynamicLinks firebaseDynamicLinks;
  late EmailSecureStore emailSecureStore;
  late ActionCodeSettings actionCodeSettings;
  late PasswordlessAuthenticator sut;

  const email = 'myid@email.com';
  final signinLinkSettings = SignInLinkSettings(
    url: 'https://a-url.com',
    androidPackageName: 'com.name.android',
    iOSBundleId: 'com.name.ios',
    dynamicLinkDomain: 'subdomian.page.link',
  );

  setUp(() {
    firebaseAuth = FirebaseAuthSpy();
    firebaseDynamicLinks = MockFirebaseDynamicLinks();
    emailSecureStore = MockEmailSecureStorage();
    actionCodeSettings = ActionCodeSettings(
      url: signinLinkSettings.url,
      handleCodeInApp: true,
      androidInstallApp: true,
      androidPackageName: signinLinkSettings.androidPackageName,
      iOSBundleId: signinLinkSettings.iOSBundleId,
      dynamicLinkDomain: signinLinkSettings.dynamicLinkDomain,
    );

    sut = PasswordlessAuthenticator(
      firebaseAuth,
      firebaseDynamicLinks,
      emailSecureStore,
      signinLinkSettings,
    );
  });
  group('sendSignInLinkToEmail', () {
    test(
      'sendSignInLinkToEmail calls FirebaseAuth sendSignInLinkToEmail with right parameters',
      () async {
        when(
          () => emailSecureStore.setEmail(email),
        ).thenAnswer((_) async {});

        sut.sendSignInLinkToEmail(email).then(
          (value) {
            expect(
              firebaseAuth.sendSignInLinkMessages.length,
              1,
            );

            final receivedEmail = firebaseAuth.sendSignInLinkMessages.first.$1;
            final receivedSettings =
                firebaseAuth.sendSignInLinkMessages.first.$2;
            expect(
              receivedEmail,
              email,
            );
            expect(
              receivedSettings.url,
              actionCodeSettings.url,
            );
            expect(
              receivedSettings.androidPackageName,
              actionCodeSettings.androidPackageName,
            );
            expect(
              receivedSettings.iOSBundleId,
              actionCodeSettings.iOSBundleId,
            );
            expect(
              receivedSettings.dynamicLinkDomain,
              actionCodeSettings.dynamicLinkDomain,
            );
            expect(
              receivedSettings.dynamicLinkDomain,
              actionCodeSettings.dynamicLinkDomain,
            );
            expect(receivedSettings.handleCodeInApp, isTrue);
            expect(receivedSettings.androidInstallApp, isTrue);
          },
        );

        firebaseAuth.completeSendLinkWithSuccess();
      },
    );
    test(
      'delivers error on FirebaseAuth error',
      () async {
        // When
        when(
          () => emailSecureStore.setEmail(email),
        ).thenAnswer((_) async {});

        sut.sendSignInLinkToEmail(email).then((result) {
          // Then
          expect(result, left(const Failure.unexpectedError()));
        });
        firebaseAuth
            .completeSendLinkWithFailure(FirebaseAuthException(code: '0'));
      },
    );

    test(
      'delivers error on EmailSecureStore error',
      () async {
        // Given
        when(
          () => emailSecureStore.setEmail(email),
        ).thenThrow(() => Exception());

        sut.sendSignInLinkToEmail(email).then((result) {
          // Then
          expect(result, left(const Failure.unexpectedError()));
        });
        firebaseAuth.completeSendLinkWithSuccess();
      },
    );

    test(
      'delivers success on successful sendSignInLinkToEmail',
      () async {
        // Given
        when(
          () => emailSecureStore.setEmail(email),
        ).thenAnswer((_) async {});
        sut.sendSignInLinkToEmail(email).then((result) {
          // Then
          expect(result, right(unit));
        });
        firebaseAuth.completeSendLinkWithSuccess();
      },
    );
  });

  group('signInWithEmailLink', () {
    final emailLink = Uri.https('a-link.com');

    test(
      'signInWithEmailLink calls FirebaseAuth with right parameters',
      () async {
        when(() => firebaseAuth.currentUser).thenReturn(null);
        when(
          () => emailSecureStore.getEmail(),
        ).thenAnswer((_) async => email);
        when(() => firebaseAuth.isSignInWithEmailLink(emailLink.toString()))
            .thenReturn(true);
        sut.signInWithEmailLink(emailLink).then(
              (_) => expect(
                firebaseAuth.signInMessages,
                equals((email, emailLink)),
              ),
            );
      },
    );

    test(
      "delivers EmailLinkFailure.userAlreadySignedIn when current user is not null",
      () async {
        when(() => firebaseAuth.currentUser).thenReturn(FakeUser());
        final result = await sut.signInWithEmailLink(emailLink);
        expect(
          result,
          left(const EmailLinkFailure.userAlreadySignedIn()),
        );
      },
    );

    test(
      "delivers EmailLinkFailure.emailNotSet when user email is empty",
      () async {
        when(
          () => emailSecureStore.getEmail(),
        ).thenAnswer((_) async => null);

        final result = await sut.signInWithEmailLink(emailLink);
        expect(
          result,
          left(const EmailLinkFailure.emailNotSet()),
        );
      },
    );

    test(
      'delivers EmailLinkFailure.isNotSignInWithEmailLink when the link is not a sign-in link',
      () async {
        when(
          () => emailSecureStore.getEmail(),
        ).thenAnswer((_) async => email);
        when(() => firebaseAuth.isSignInWithEmailLink(emailLink.toString()))
            .thenReturn(false);
        final result = await sut.signInWithEmailLink(emailLink);
        expect(
          result,
          left(const EmailLinkFailure.isNotSignInWithEmailLink()),
        );
      },
    );

    test(
      "delivers EmailLinkFailure.signInFailed when the user email can't be retrieved",
      () async {
        final exception = Exception("email can't be retrieved");
        when(
          () => emailSecureStore.getEmail(),
        ).thenThrow(exception);

        final result = await sut.signInWithEmailLink(emailLink);
        expect(
          result,
          left(EmailLinkFailure.signInFailed(exception.toString())),
        );
      },
    );

    test(
      'delivers EmailLinkFailure.signInFailed on FirebaseAuth error',
      () async {
        final exception =
            FirebaseAuthException(code: '0', message: 'failed to signin');
        when(
          () => emailSecureStore.getEmail(),
        ).thenAnswer((_) async => email);
        when(() => firebaseAuth.isSignInWithEmailLink(emailLink.toString()))
            .thenReturn(true);

        sut.signInWithEmailLink(emailLink).then(
              (result) => expect(
                result,
                left(EmailLinkFailure.signInFailed(exception.message)),
              ),
            );
        firebaseAuth.completeSigninWithLinkWithFailure(exception);
      },
    );

    test(
      'delivers success on successfull sign-in',
      () async {
        when(
          () => emailSecureStore.getEmail(),
        ).thenAnswer((_) async => email);
        when(() => firebaseAuth.isSignInWithEmailLink(emailLink.toString()))
            .thenReturn(true);

        sut.signInWithEmailLink(emailLink).then(
          (result) {
            expect(
              result,
              right(unit),
            );
          },
        );
        expect(sut.authStateChanges(), emits(Some(app_user_model.User('1'))));

        firebaseAuth.completeSigninWithLinkWithSuccess();
      },
    );
  });

  group('checkEmailLink', () {
    final signinLink = Uri.https('sigin-link.com');
    group('getInitialLink', () {
      test('calls onSigninFailure when getInitialLink fails', () async {
        final exception = Exception('an exception message');
        sut.onSigninFailure = (value) {
          expect(value, EmailLinkFailure.linkError(exception.toString()));
        };
        when(() => firebaseDynamicLinks.getInitialLink()).thenThrow(exception);
        when(() => firebaseDynamicLinks.onLink).thenAnswer(
          (_) => StreamController<PendingDynamicLinkData>().stream,
        );
        sut.checkEmailLink();
      });

      test('calls onSigninFailure when signInWithEmailLink fails', () async {
        // Given
        when(() => firebaseDynamicLinks.getInitialLink())
            .thenAnswer((_) async => PendingDynamicLinkData(link: signinLink));
        when(() => firebaseDynamicLinks.onLink).thenAnswer(
          (_) => StreamController<PendingDynamicLinkData>().stream,
        );
        when(
          () => emailSecureStore.getEmail(),
        ).thenAnswer((_) async => null);

        sut.onSigninFailure = (value) {
          // Then
          expect(value, const EmailLinkFailure.emailNotSet());
        };

        // When
        final _ = await sut.checkEmailLink();
      });

      test('emits loading while signInWithEmailLink is in progress', () async {
        final signinLinkStreamController =
            StreamController<PendingDynamicLinkData>();

        when(() => firebaseDynamicLinks.getInitialLink()).thenAnswer(
          (invocation) async => PendingDynamicLinkData(link: signinLink),
        );
        when(() => firebaseDynamicLinks.onLink).thenAnswer(
          (_) => signinLinkStreamController.stream,
        );
        when(
          () => emailSecureStore.getEmail(),
        ).thenAnswer((_) async => null);
        sut.checkEmailLink();

        expect(sut.isLoading, emitsInOrder([true, false]));
      });
    });

    group('onLink', () {
      test('calls onSigninFailure when onLink stream emits failure', () async {
        // Given
        final exception = Exception('an exception message');
        final signinLinkStreamController =
            StreamController<PendingDynamicLinkData>();

        sut.onSigninFailure = (value) {
          // Then
          expect(value, EmailLinkFailure.linkError(exception.toString()));
        };
        when(() => firebaseDynamicLinks.getInitialLink())
            .thenAnswer((invocation) async => null);
        when(() => firebaseDynamicLinks.onLink).thenAnswer(
          (_) => signinLinkStreamController.stream,
        );

        // When
        sut.checkEmailLink();
        signinLinkStreamController.addError(exception);
      });

      test('calls onSigninFailure when signInWithEmailLink fails', () async {
        final signinLinkStreamController =
            StreamController<PendingDynamicLinkData>();
        sut.onSigninFailure = (value) {
          expect(value, const EmailLinkFailure.emailNotSet());
        };
        when(() => firebaseDynamicLinks.getInitialLink())
            .thenAnswer((invocation) async => null);
        when(() => firebaseDynamicLinks.onLink).thenAnswer(
          (_) => signinLinkStreamController.stream,
        );
        when(
          () => emailSecureStore.getEmail(),
        ).thenAnswer((_) async => null);

        sut.checkEmailLink();
        signinLinkStreamController
            .add(PendingDynamicLinkData(link: signinLink));
      });

      test('emits loading while signInWithEmailLink is in progress', () async {
        // Given
        final signinLinkStreamController =
            StreamController<PendingDynamicLinkData>();
        when(() => firebaseDynamicLinks.getInitialLink())
            .thenAnswer((invocation) async => null);
        when(() => firebaseDynamicLinks.onLink).thenAnswer(
          (_) => signinLinkStreamController.stream,
        );
        when(
          () => emailSecureStore.getEmail(),
        ).thenAnswer((_) async => null);

        // When
        sut.checkEmailLink();
        signinLinkStreamController
            .add(PendingDynamicLinkData(link: signinLink));
        
        // Then
        expect(sut.isLoading, emitsInOrder([true, false]));
      });
    });
  });

  test('Signout user', () async {
    await sut.signout();
    expect(sut.authStateChanges(), emits(none()));
    expect(firebaseAuth.signoutCalled, isTrue);
  });
}
