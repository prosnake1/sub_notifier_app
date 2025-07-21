import 'package:flutter/material.dart';
import 'package:sub_notifier_app/domain/repositories/user/user_repository.dart';
import 'package:sub_notifier_app/extensions/extensions.dart';
import 'package:sub_notifier_app/icons/sn_icons.dart';
import 'package:sub_notifier_app/locator/di.dart';
import 'package:sub_notifier_app/routes/router.dart';
import 'package:sub_notifier_app/widgets/sn_icon_button.dart';
import 'package:url_launcher/url_launcher.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: 1.ph,
            ),
            Text(
              'добро пожаловать',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Text(
              'следить за подписками теперь куда проще',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            20.ph,
            ElevatedButton(
              onPressed: () {
                getIt.get<UserRepository>().setWelcomeViewed(true);
                router.go('/home');
              },
              child: Text(
                'Вперед',
              ),
            ),
            Expanded(
              child: 1.ph,
            ),
            SnIconButton(
              icon: Icon(SnIcons.github),
              onTap: () async {
                final url = Uri.parse("https://github.com/prosnake1");

                await launchUrl(url);
              },
            ),
            Text(
              'v1.0',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
      ),
    );
  }
}
