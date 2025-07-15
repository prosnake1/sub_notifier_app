import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sub_notifier_app/bloc/theme/theme_cubit.dart';
import 'package:sub_notifier_app/locator/di.dart';
import 'package:sub_notifier_app/routes/router.dart';
import 'package:sub_notifier_app/theme/theme_data.dart';

class SubNotifierApp extends StatelessWidget {
  const SubNotifierApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      bloc: getIt<ThemeCubit>(),
      builder: (_, theme) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: theme,
          darkTheme: AppTheme.darkTheme,
          routerConfig: router,
        );
      },
    );
  }
}
