import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:passwordless_signin/passwordless_signin/bloc/passwordless_signin_bloc.dart';
import 'package:passwordless_signin/passwordless_signin/widgets/dialogs/generic_dialog.dart';
import 'package:passwordless_signin/passwordless_signin/widgets/primary_button.dart';
import 'package:passwordless_signin/routes/routes.dart';

class EmailPage extends StatelessWidget {
  const EmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<PasswordlessSigninBloc, PasswordlessSigninState>(
          listener: (context, state) {
            state.failureOrSuccessOption.fold(
              () => null,
              (a) => a.fold(
                (message) => showGenericDialog(
                  context: context,
                  title: 'Error',
                  message: message,
                  optionsBuilder: () => {'OK': true},
                ),
                (r) => context.goNamed(Routes.emailSent.name),
              ),
            );
          },
          builder: (context, state) {
            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const SizedBox(
                  height: 80,
                ),
                const SizedBox(
                  width: 220,
                  height: 220,
                  child: Image(image: AssetImage('assets/images/sparkles.png')),
                ),
                Text(
                  'Log in without a password!',
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  "We'll send you an email with a magic link that'll log you in right away.",
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email),
                    hintText: 'Email',
                    errorText: state.emailAddress.validationError,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                  autocorrect: false,
                  enableSuggestions: false,
                  onChanged: (value) => context
                      .read<PasswordlessSigninBloc>()
                      .add(PasswordlessSigninEvent.emailChanged(value)),
                ),
                const SizedBox(height: 33),
                PrimaryButton(
                  title: 'Sign in',
                  state: state.isSubmitting
                      ? PrimaryButtonState.loading
                      : PrimaryButtonState.idle,
                  onPressed: () {
                    context
                        .read<PasswordlessSigninBloc>()
                        .add(const PasswordlessSigninEvent.sendMagicLink());
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
