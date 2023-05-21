import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:passwordless_signin/auth/passwordless_authenticator.dart';
import 'package:passwordless_signin/auth_provider_scope.dart';
import 'package:passwordless_signin/home_page.dart';
import 'package:passwordless_signin/injection.dart';
import 'package:passwordless_signin/passwordless_signin/bloc/passwordless_signin_bloc.dart';
import 'package:passwordless_signin/passwordless_signin/email_page.dart';
import 'package:passwordless_signin/passwordless_signin/email_sent_page.dart';
import 'package:passwordless_signin/passwordless_signin/signin_verification_page.dart';

enum Routes {
  home,
  signinVerification,
  emailForm,
  emailSent;

  String get path {
    switch (this) {
      case Routes.home:
        return '/';
      case Routes.signinVerification:
        return '/signinVerification';
      case Routes.emailForm:
        return '/emailForm';
      case Routes.emailSent:
        return 'emailSent';
    }
  }
}

class AppRouter {
  AppRouter._();
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: Routes.home.path,
        builder: (context, state) => HomePage(
          onSignoutRequest: () => getIt<PasswordlessAuthenticator>().signout(),
        ),
      ),
      ShellRoute(
        builder: (context, state, child) {
          return BlocProvider(
            create: (context) =>
                PasswordlessSigninBloc(getIt<PasswordlessAuthenticator>()),
            child: child,
          );
        },
        routes: [
          GoRoute(
            name: Routes.emailForm.name,
            path: Routes.emailForm.path,
            builder: (context, state) => const EmailPage(),
            routes: [
              GoRoute(
                name: Routes.emailSent.name,
                path: Routes.emailSent.path,
                builder: (context, state) => const EmailSentPage(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        name: Routes.signinVerification.name,
        path: Routes.signinVerification.path,
        builder: (context, state) => const SigninVerificationPage(),
      ),
    ],
    redirect: (context, state) {
      final authNotifierProvider = AuthProviderScope.of(context);
      // if user is already signed in
      final isSignedIn = authNotifierProvider.isSignedIn;

      // check if user is in signin flow
      final isInSigninFlow = state.matchedLocation == Routes.emailForm.path ||
          state.matchedLocation ==
              '${Routes.emailForm.path}/${Routes.emailSent.path}';

      final isSigninInProgress = authNotifierProvider.isSigninInProgress ||
          authNotifierProvider.alertIsPresented;
      
      if (isSigninInProgress) {
        return Routes.signinVerification.path;
      } else if (isSignedIn == false) {
        // if user is in signin flow, do nothing otherwise redirect to signin flow entry point
        return isInSigninFlow ? null : Routes.emailForm.path;
      } else if (isSignedIn && (isInSigninFlow ||
          state.matchedLocation == Routes.signinVerification.path)) {
        return Routes.home.path;
      } else {
        // no need to redirect at all
        return null;
      }
    },
  );
}
