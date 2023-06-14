import 'package:flutter/material.dart';
import 'package:passwordless_signin/auth_provider_scope.dart';
import 'package:passwordless_signin/passwordless_signin/widgets/dialogs/generic_dialog.dart';

class SigninVerificationPage extends StatelessWidget {
  const SigninVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authNotifier = AuthProviderScope.of(context);

    authNotifier.onError = (value) {
      authNotifier.alertIsPresented = true;
      showGenericDialog(
        context: context,
        title: 'Signin failure',
        message: "Couldn't sign in with the link",
        optionsBuilder: () => {'OK': true},
      ).then((value) {
        authNotifier.alertIsPresented = false;
      });
    };

    return Material(
      child: Center(
        child: Transform.scale(
          scale: 1.5,
          child: const CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }
}
