import 'package:flutter/material.dart';
import 'package:sub_notifier_app/theme/theme.dart';

class SnTextField extends StatelessWidget {
  const SnTextField({
    super.key,
    this.controller,
    this.onTap,
    this.initialValue,
    this.labelText = '',
    this.hintText,
    this.readOnly = false,
    this.icon,
    this.iconEnabled = false,
    this.maxLines = 1,
    this.maxLength = 50,
  });
  final TextEditingController? controller;
  final Function()? onTap;
  final String? initialValue;
  final String labelText;
  final String? hintText;
  final bool readOnly;
  final IconData? icon;
  final bool iconEnabled;
  final int maxLines;
  final int maxLength;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          TextFormField(
            initialValue: initialValue,
            onTap: onTap,
            maxLines: maxLines,
            controller: controller,
            maxLength: maxLength,
            readOnly: readOnly,
            decoration: InputDecoration(
              hintText: hintText,
              counterText: '',
              prefixIcon: iconEnabled
                  ? Align(
                      alignment: Alignment.center,
                      child: Icon(
                        icon,
                        size: 24,
                        color: (Theme.of(context).brightness == Brightness.dark)
                            ? Colors.white
                            : Colors.black,
                      ),
                    )
                  : null,
            ),
            style: ThemeText.bodyLarge.copyWith(
              fontFamily: 'Roboto',
            ),
          ),
        ],
      ),
    );
  }
}
