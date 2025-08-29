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
          overlayColor: (color == Colors.black) ? Colors.white : Colors.black,
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: (Theme.of(context).brightness == Brightness.dark)
                  ? Colors.white
                  : Colors.black,
              width: 2,
            ),
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
