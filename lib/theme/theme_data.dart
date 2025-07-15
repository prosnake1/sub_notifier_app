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
        seedColor: Colors.white,
        secondary: Colors.black,
      ),
      fontFamily: 'Arial',
      textTheme: _textTheme,
      useMaterial3: true,
      scaffoldBackgroundColor: ThemeColors.white,
      switchTheme: _switchTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        titleTextStyle: ThemeTypography.headlineSmall.copyWith(
          color: (Colors.black),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: Colors.black,
      ),
      bottomAppBarTheme: BottomAppBarTheme(
        color: Colors.white,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          enableFeedback: false,
        ),
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.black,
        secondary: Colors.white,
      ),
      fontFamily: 'Arial',
      textTheme: _textTheme,
      useMaterial3: true,
      scaffoldBackgroundColor: ThemeColors.textIconDefault,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.black,
        titleTextStyle: ThemeTypography.headlineSmall.copyWith(
          color: Colors.white,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: Colors.white,
      ),
      bottomAppBarTheme: BottomAppBarTheme(
        color: Colors.black,
      ),
      switchTheme: _switchTheme,
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          enableFeedback: false,
        ),
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    );
  }
}
