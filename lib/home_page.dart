import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final VoidCallback onSignoutRequest;
  const HomePage({super.key, required this.onSignoutRequest});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [TextButton(onPressed: onSignoutRequest, child: const Text('Signout'))],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 220,
              height: 220,
              child: Image(image: AssetImage('assets/images/diamond.png')),
            ),
            Text(
              'Welcome!',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
