import 'package:flutter/material.dart';

class SelectAgeButton extends StatelessWidget {
  const SelectAgeButton({
    required this.onAgeChanged,
    required this.text,
    super.key,
  });

  final VoidCallback onAgeChanged;

  final String text;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => onAgeChanged(),
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        backgroundColor: Colors.blue,
        fixedSize: const Size(200, 60),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}
