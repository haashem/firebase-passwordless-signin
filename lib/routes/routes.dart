import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:passwordless_signin/auth/passwordless_authenticator.dart';
import 'package:passwordless_signin/home_page.dart';
import 'package:passwordless_signin/injection.dart';
import 'package:passwordless_signin/passwordless_signin/bloc/passwordless_signin_bloc.dart';
import 'package:passwordless_signin/passwordless_signin/email_page.dart';
import 'package:passwordless_signin/passwordless_signin/email_sent_page.dart';

enum Routes {
  home,
  emailForm,
  emailSent;

  String get path {
    switch (this) {
      case Routes.home:
        return '/';
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
        builder: (context, state) => const HomePage(),
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
    ],
    redirect: (context, state) {
      // check if user is in signin flow
      final isInSigninFlow = state.matchedLocation == Routes.emailForm.path ||
          state.matchedLocation ==
              '${Routes.emailForm.path}/${Routes.emailSent.path}';

      // if user is in signin flow, do nothing otherwise redirect to signin flow entry point
      return isInSigninFlow ? null : Routes.emailForm.path;
    },
  );
}
