import 'package:flutter/material.dart';
import 'package:sub_notifier_app/theme/theme.dart';

final _switchTheme = SwitchThemeData(
  thumbColor: WidgetStateProperty.all(
    ThemeColors.textIconDefault,
  ),
  trackColor: WidgetStateProperty.all(
    ThemeColors.textIconPrimaryMed,
  ),
  trackOutlineWidth: WidgetStateProperty.all(0),
);

final _textTheme = TextTheme(
  displaySmall: ThemeTypography.displaySmall,
  headlineLarge: ThemeTypography.headlineLarge,
  headlineSmall: ThemeTypography.headlineSmall,
  bodyLarge: ThemeTypography.bodyLarge,
  bodySmall: ThemeTypography.bodySmall,
  labelLarge: ThemeTypography.labelLarge,
  labelSmall: ThemeTypography.labelSmall,
);

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: ThemeColors.textIconDefault,
      ),
      fontFamily: 'Arial',
      textTheme: _textTheme,
      useMaterial3: true,
      scaffoldBackgroundColor: ThemeColors.white,
      switchTheme: _switchTheme,
    );
  }
}
