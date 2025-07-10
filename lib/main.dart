import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sub_notifier_app/app.dart';
import 'package:sub_notifier_app/i18n/strings.g.dart';
import 'package:sub_notifier_app/locator/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale();
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  setupLocator(preferences: preferences);
  runApp(TranslationProvider(child: const SubNotifierApp()));
}
