import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sub_notifier_app/app.dart';
import 'package:sub_notifier_app/i18n/strings.g.dart';
import 'package:sub_notifier_app/locator/di.dart';
import 'package:sub_notifier_app/services/services.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';

void main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      LocaleSettings.useDeviceLocale();
      NotiService().init();

      final SharedPreferences preferences =
          await SharedPreferences.getInstance();

      await HiveService.init();

      setupLocator(preferences: preferences);

      Bloc.observer = TalkerBlocObserver(
          settings: TalkerBlocLoggerSettings(
        printStateFullData: true,
      ));

      await Permission.notification.isDenied.then((value) {
        if (value) {
          Permission.notification.request();
        }
      });
      runApp(TranslationProvider(child: const SubNotifierApp()));
    },
    (error, stack) {
      talker.handle(error, stack);
    },
  );
}
