import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
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
