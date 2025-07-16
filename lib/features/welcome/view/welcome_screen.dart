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
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 1,
              left: 1,
              child: SnIconButton(
                icon: Icon(SnIcons.language),
                onTap: () {},
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 1,
              child: Column(
                children: [
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
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
