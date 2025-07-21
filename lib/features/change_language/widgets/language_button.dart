import 'package:flutter/material.dart';
import 'package:sub_notifier_app/theme/theme_colors.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({
    super.key,
    required this.onTap,
    required this.language,
  });
  final Function() onTap;
  final String language;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: (Theme.of(context).brightness == Brightness.dark)
              ? ThemeColors.textIconPrimaryExtraLow
              : ThemeColors.textIconExtraLow,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          language,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}
