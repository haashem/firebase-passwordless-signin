import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:passwordless_signin/passwordless_signin/widgets/primary_button.dart';

import 'package:passwordless_signin/routes/routes.dart';

class EmailPage extends StatelessWidget {
  const EmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
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
            ),
            const SizedBox(height: 33),
            PrimaryButton(
              title: 'Sign in',
              onPressed: () {
                context.goNamed(
                  Routes.emailSent.name,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
