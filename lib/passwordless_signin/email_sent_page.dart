import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:passwordless_signin/passwordless_signin/widgets/primary_button.dart';

import 'package:passwordless_signin/routes/routes.dart';

class EmailSentPage extends StatelessWidget {
  const EmailSentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => context.goNamed(Routes.emailForm.name),
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            const SizedBox(
              width: 220,
              height: 220,
              child: Image(image: AssetImage('assets/images/mailbox.png')),
            ),
            Text(
              'Check your email!',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              "We sent an email to  with a magic link that'll log you in.",
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            PrimaryButton(
              title: 'Open email app',
              onPressed: () {},
            ),
            const SizedBox(
              height: 32,
            )
          ],
        ),
      ),
    );
  }
}
