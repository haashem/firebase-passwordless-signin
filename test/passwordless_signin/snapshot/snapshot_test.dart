import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:passwordless_signin/auth/models/failure.dart';
import 'package:passwordless_signin/auth/passwordless_authenticator.dart';
import 'package:passwordless_signin/auth_provider_scope.dart';
import 'package:passwordless_signin/passwordless_signin/bloc/passwordless_signin_bloc.dart';
import 'package:passwordless_signin/passwordless_signin/email_page.dart';
import 'package:passwordless_signin/passwordless_signin/email_sent_page.dart';
import 'package:passwordless_signin/passwordless_signin/signin_verification_page.dart';

import '../../routes/routes_test.dart';
import '../bloc/passwordless_signin_bloc_test.dart';
import '../request_signin_link/step/i_enter_in_the_email_field.dart';
import '../request_signin_link/step/i_tap_the_button.dart';
import '../shared/sample_data.dart';

void main() {
  final PasswordlessAuthenticator authenticator =
      MockPasswordlessAuthenticator();

  Widget buildPasswordlessSigninPage(Widget page) {
    final bloc = PasswordlessSigninBloc(authenticator, FakeMailAppLauncher());
    return BlocProvider(
      create: (context) => bloc,
      child: page,
    );
  }

  testGoldens('Email page', (tester) async {
    await loadAppFonts();

    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(
        devices: [Device.phone],
      )
      ..addScenario(
        widget: buildPasswordlessSigninPage(const EmailPage()),
        name: 'email page',
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(tester, 'email_page');
  });

  testGoldens('Alert on the email page', (tester) async {
    await loadAppFonts();
    // Enable shadows
    debugDisableShadows = false;
    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(
        devices: [Device.phone],
      )
      ..addScenario(
        widget: buildPasswordlessSigninPage(const EmailPage()),
        onCreate: (scenarioWidgetKey) async {
          await iEnterInTheEmailField(tester, validEmail);
          when(() => authenticator.sendSignInLinkToEmail(validEmail))
              .thenAnswer((_) async => left(const Failure.unexpectedError()));
          await iTapTheButton(tester, 'Sign in');
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(tester, 'email_page_alert');
    // reset to its default value
    debugDisableShadows = true;
  });

  testGoldens('Email sent page', (tester) async {
    await loadAppFonts();

    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(
        devices: [Device.phone],
      )
      ..addScenario(
        widget: buildPasswordlessSigninPage(const EmailSentPage()),
        name: 'email sent page',
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(tester, 'email_sent_page');
  });

  testGoldens('Sign-in verification page', (tester) async {
    await loadAppFonts();

    when(
      () => authenticator.isLoading,
    ).thenAnswer((_) => Stream.value(false));
    when(
      () => authenticator.authStateChanges(),
    ).thenAnswer((_) => Stream.value(none()));

    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(
        devices: [Device.phone],
      )
      ..addScenario(
        widget: AuthProviderScope(
          authNotifier: AuthNotifier(authenticator),
          child: const SigninVerificationPage(),
        ),
        name: 'sign-in link verification page',
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'link_verification_page',
      customPump: (_) => tester.pump(const Duration(seconds: 2)),
    );
  });
}
