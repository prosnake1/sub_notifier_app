import 'package:flutter/material.dart';
import 'package:sub_notifier_app/i18n/strings.g.dart';
import 'package:sub_notifier_app/routes/router.dart';
import 'package:sub_notifier_app/theme/theme_colors.dart';
import 'package:sub_notifier_app/widgets/widgets.dart';

class ChangeLanguageScreen extends StatelessWidget {
  const ChangeLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SnAppBar(
        title: t.language,
      ),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
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
          ],
        ),
      ),
    );
  }
}

class LanguageButton extends StatelessWidget {
  const LanguageButton({
    super.key,
    required this.onTap,
    required this.language,
  });
  final Function() onTap;
  final String language;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: (Theme.of(context).brightness == Brightness.dark)
              ? ThemeColors.textIconPrimaryExtraLow
              : ThemeColors.textIconExtraLow,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          language,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}
