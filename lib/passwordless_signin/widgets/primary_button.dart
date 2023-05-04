import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum PrimaryButtonState { idle, loading }

class PrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final PrimaryButtonState state;
  const PrimaryButton({
    super.key,
    required this.title,
    this.onPressed,
    this.state = PrimaryButtonState.idle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 336,
      height: 50,
      child: CupertinoButton.filled(
        padding: EdgeInsets.zero,
        borderRadius: BorderRadius.circular(10),
        onPressed: state == PrimaryButtonState.idle ? onPressed : null,
        disabledColor: Theme.of(context).primaryColor.withOpacity(0.4),
        child: state == PrimaryButtonState.idle
            ? Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Colors.white),
              )
            : SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
      ),
    );
  }
}
