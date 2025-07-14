import 'package:flutter/material.dart';
import 'package:sub_notifier_app/domain/repositories/user/user_repository.dart';
import 'package:sub_notifier_app/locator/di.dart';
import 'package:sub_notifier_app/routes/router.dart';
import 'package:sub_notifier_app/theme/theme_data.dart';

class SubNotifierApp extends StatelessWidget {
  const SubNotifierApp({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = getIt<UserRepository>().isDark;
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: !isDarkMode ? AppTheme.lightTheme : AppTheme.darkTheme,
      darkTheme: AppTheme.darkTheme,
      routerConfig: router,
    );
  }
}
