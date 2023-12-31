import 'package:flutter/material.dart';
import 'package:passwordless_signin/auth/passwordless_authenticator.dart';
import 'package:passwordless_signin/auth_provider_scope.dart';
import 'package:passwordless_signin/injection.dart';
import 'package:passwordless_signin/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();

  runApp(
    AuthProviderScope(
      authNotifier: AuthNotifier(
        getIt<PasswordlessAuthenticator>(),
      ),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(
      textTheme: Theme.of(context).textTheme.apply(
            bodyColor: const Color(0xFF3B3A41),
            displayColor: const Color(0xFF3B3A41),
          ),
    );

    return MaterialApp.router(
      routerConfig: AppRouter.router,
      theme: theme,
    );
  }
}
