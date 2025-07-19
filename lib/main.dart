import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sub_notifier_app/app.dart';
import 'package:sub_notifier_app/i18n/strings.g.dart';
import 'package:sub_notifier_app/locator/di.dart';
import 'package:sub_notifier_app/services/services.dart';

void main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      LocaleSettings.useDeviceLocale();

      final SharedPreferences preferences =
          await SharedPreferences.getInstance();

      await HiveService.init();

      setupLocator(preferences: preferences);
      runApp(TranslationProvider(child: const SubNotifierApp()));
    },
    (error, stack) {
      talker.handle(error, stack);
    },
  );
}
