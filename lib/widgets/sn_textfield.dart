import 'package:flutter/material.dart';
import 'package:sub_notifier_app/theme/theme.dart';

class SnTextField extends StatelessWidget {
  const SnTextField({
    super.key,
    this.controller,
    required this.labelText,
    this.readOnly = false,
    this.icon,
    this.borderEnabled = false,
    this.iconEnabled = false,
  });
  final TextEditingController? controller;
  final String labelText;
  final bool readOnly;
  final IconData? icon;
  final bool borderEnabled;
  final bool iconEnabled;

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
            controller: controller,
            readOnly: readOnly,
            decoration: InputDecoration(
              fillColor: readOnly ? Colors.transparent : null,
              enabledBorder: borderEnabled
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        width: 4,
                        color: (Theme.of(context).brightness == Brightness.dark)
                            ? Colors.white
                            : Colors.black,
                      ),
                    )
                  : null,
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
            style: ThemeTypography.bodyLarge.copyWith(
              fontFamily: 'Roboto',
            ),
          ),
        ],
      ),
    );
  }
}
