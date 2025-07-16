import 'package:flutter/material.dart';
import 'package:sub_notifier_app/theme/theme.dart';

class SnTextField extends StatelessWidget {
  const SnTextField({
    super.key,
    required this.labelText,
    this.readOnly = false,
  });
  final String labelText;
  final bool readOnly;

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
            readOnly: readOnly,
            style: ThemeTypography.bodyLarge.copyWith(
              fontFamily: 'Roboto',
            ),
          ),
        ],
      ),
    );
  }
}
