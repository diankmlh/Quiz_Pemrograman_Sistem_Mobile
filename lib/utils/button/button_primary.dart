import 'package:flutter/material.dart';

class ButtonPrimary extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ButtonPrimary({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}