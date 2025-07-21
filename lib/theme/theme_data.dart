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
  titleLarge: ThemeTypography.titleLarge,
  bodyLarge: ThemeTypography.bodyLarge,
  bodySmall: ThemeTypography.bodySmall,
  labelLarge: ThemeTypography.labelLarge,
  labelSmall: ThemeTypography.labelSmall,
);

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.white,
        brightness: Brightness.light,
      ),
      fontFamily: 'Arial',
      textTheme: _textTheme,
      useMaterial3: true,
      scaffoldBackgroundColor: ThemeColors.white,
      switchTheme: _switchTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
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
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: ThemeColors.textIconExtraLow,
        isDense: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.black,
            width: 3,
          ),
        ),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.black,
        textTheme: ButtonTextTheme.accent,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
          ),
          textStyle: ThemeTypography.bodyLarge.copyWith(
            color: Colors.white,
          ),
          foregroundColor: Colors.white,
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.black,
        brightness: Brightness.dark,
      ),
      fontFamily: 'Arial',
      textTheme: _textTheme.apply(
        bodyColor: Colors.white,
        displayColor: Colors.white,
        decorationColor: Colors.white,
      ),
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
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
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: ThemeColors.textIconPrimaryExtraLow,
        isDense: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.white,
            width: 3,
          ),
        ),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.white,
        textTheme: ButtonTextTheme.accent,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
          ),
          textStyle: ThemeTypography.bodyLarge.copyWith(
            color: Colors.black,
          ),
          foregroundColor: Colors.black,
        ),
      ),
    );
  }
}
