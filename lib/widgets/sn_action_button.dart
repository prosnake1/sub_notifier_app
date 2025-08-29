import 'package:flutter/material.dart';

class SnActionButton extends StatelessWidget {
  const SnActionButton({
    super.key,
    required this.text,
    required this.onTap,
    this.color,
    this.textColor,
  });

  final String text;
  final Function() onTap;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
