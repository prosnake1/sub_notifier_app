import 'package:flutter/material.dart';
import 'package:sub_notifier_app/features/change_language/widgets/widgets.dart';
import 'package:sub_notifier_app/i18n/strings.g.dart';
import 'package:sub_notifier_app/routes/router.dart';
import 'package:sub_notifier_app/widgets/widgets.dart';

class ChangeLanguageScreen extends StatelessWidget {
  const ChangeLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SnAppBar(
        title: Text(t.language),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            LanguageButton(
              onTap: () {
                LocaleSettings.setLocale(AppLocale.ru);
                router.go('/splash');
              },
              language: 'Русский',
            ),
            LanguageButton(
              onTap: () {
                LocaleSettings.setLocale(AppLocale.en);
                router.go('/splash');
              },
              language: 'English',
            ),
            LanguageButton(
              onTap: () {
                LocaleSettings.setLocale(AppLocale.fr);
                router.go('/splash');
              },
              language: 'Français',
            ),
          ],
        ),
      ),
    );
  }
}
