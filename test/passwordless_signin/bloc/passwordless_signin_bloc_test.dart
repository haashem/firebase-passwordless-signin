import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:passwordless_signin/auth/models/failure.dart';
import 'package:passwordless_signin/auth/passwordless_authenticator.dart';
import 'package:passwordless_signin/passwordless_signin/bloc/passwordless_signin_bloc.dart';
import 'package:passwordless_signin/utilities/mailapp_launcher.dart';

class MockPasswordlessAuthenticator extends Mock
    implements PasswordlessAuthenticator {}

class MockMailAppLauncher extends Mock implements MailAppLauncher {}

void main() {
  late PasswordlessAuthenticator authenticator;
  late MailAppLauncher mailAppLauncher;
  const validEmail = 'myid@email.com';

  setUp(() {
    authenticator = MockPasswordlessAuthenticator();
    mailAppLauncher = MockMailAppLauncher();
  });

  PasswordlessSigninBloc makeSut() =>
      PasswordlessSigninBloc(authenticator, mailAppLauncher);
  test('Initial state should be Initial', () {
    expect(
      makeSut().state,
      PasswordlessSigninState.initial(),
    );
  });

  blocTest<PasswordlessSigninBloc, PasswordlessSigninState>(
    'On email change, email should not be validated',
    build: () => makeSut(),
    act: (bloc) =>
        bloc.add(const PasswordlessSigninEvent.emailChanged('email')),
    expect: () => [
      PasswordlessSigninState(
        emailAddress: some(right('email')),
        isSubmitting: false,
        failureOrSuccessOption: none(),
      )
    ],
  );

  blocTest<PasswordlessSigninBloc, PasswordlessSigninState>(
    'ON invalid email '
    'WHEN sign-in link requested '
    'THEN email gets validated '
    'AND validation message will be emitted',
    build: () => makeSut(),
    act: (bloc) {
      bloc.add(const PasswordlessSigninEvent.emailChanged('invalidEmail'));
      bloc.add(const PasswordlessSigninEvent.sendMagicLink());
    },
    skip: 1,
    expect: () => [
      PasswordlessSigninState(
        emailAddress: some(left('Enter valid email')),
        isSubmitting: false,
        failureOrSuccessOption: none(),
      )
    ],
  );

  blocTest<PasswordlessSigninBloc, PasswordlessSigninState>(
    'ON valid email '
    'WHEN sign-in link requested '
    'AND api returns failure '
    'THEN error message should be emitted',
    build: () => makeSut(),
    setUp: () {
      when(
        () => authenticator.sendSignInLinkToEmail(validEmail),
      ).thenAnswer(
        (_) async =>
            left(const Failure.unexpectedError('failed to email the link')),
      );
    },
    act: (bloc) {
      bloc.add(const PasswordlessSigninEvent.emailChanged(validEmail));
      bloc.add(const PasswordlessSigninEvent.sendMagicLink());
    },
    skip: 1,
    expect: () => [
      PasswordlessSigninState(
        emailAddress: some(right(validEmail)),
        isSubmitting: true,
        failureOrSuccessOption: none(),
      ),
      PasswordlessSigninState(
        emailAddress: some(right(validEmail)),
        isSubmitting: false,
        failureOrSuccessOption: some(
          left('failed to email the link'),
        ),
      )
    ],
  );

  blocTest<PasswordlessSigninBloc, PasswordlessSigninState>(
    'ON valid email '
    'WHEN sign-in link requested '
    'AND api returns success '
    'THEN success should be emitted',
    build: () => makeSut(),
    setUp: () {
      when(
        () => authenticator.sendSignInLinkToEmail(validEmail),
      ).thenAnswer(
        (_) async => right(unit),
      );
    },
    act: (bloc) {
      bloc.add(const PasswordlessSigninEvent.emailChanged('myid@email.com'));
      bloc.add(const PasswordlessSigninEvent.sendMagicLink());
    },
    skip: 1,
    expect: () => [
      PasswordlessSigninState(
        emailAddress: some(right(validEmail)),
        isSubmitting: true,
        failureOrSuccessOption: none(),
      ),
      PasswordlessSigninState(
        emailAddress: some(right(validEmail)),
        isSubmitting: false,
        failureOrSuccessOption: some(
          right(unit),
        ),
      )
    ],
  );

  blocTest<PasswordlessSigninBloc, PasswordlessSigninState>(
    'WHEN open mail app requested '
    'THEN mail app launcher should be called',
    build: () => makeSut(),
    setUp: () {
      when(
        () => mailAppLauncher.launch(),
      ).thenAnswer((_) async => {});
    },
    act: (bloc) {
      bloc.add(const PasswordlessSigninEvent.openMailApp());
    },
    verify: (_) => verify(mailAppLauncher.launch).called(1),
  );
}
