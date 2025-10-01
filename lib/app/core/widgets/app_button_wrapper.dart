import 'package:flutter/material.dart';

class AppButtonWrapper extends StatelessWidget {
  final void Function()? onPressed;
  final Widget child;

  const AppButtonWrapper({
    super.key,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        visualDensity: VisualDensity(horizontal: -4, vertical: -4),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
