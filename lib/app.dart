import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
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
        final locale =
            WidgetsBinding.instance.platformDispatcher.locale.toString();

        final supportedLocale = Intl.verifiedLocale(
          locale,
          (locale) => true,
          onFailure: (_) => 'en_US',
        );

        initializeDateFormatting(supportedLocale);

        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: theme,
          themeMode: ThemeMode.system,
          darkTheme: AppTheme.darkTheme,
          routerConfig: router,
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            const Locale('en'),
            const Locale('fr'),
            const Locale('ru'),
          ],
        );
      },
    );
  }
}
