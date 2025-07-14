import 'package:flutter/material.dart';
import 'package:sub_notifier_app/domain/repositories/user/user_repository.dart';
import 'package:sub_notifier_app/features/settings/widgets/widgets.dart';
import 'package:sub_notifier_app/icons/sn_icons.dart';
import 'package:sub_notifier_app/locator/di.dart';
import 'package:sub_notifier_app/widgets/widgets.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SnAppBar(title: 'Настройки'),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        padding: EdgeInsets.all(40),
        children: [
          SettingsButton(
            preferenceKey: 'isDarkMode',
            icon: SnIcons.sun,
            disabledIcon: SnIcons.moon,
            text: 'тема',
            onTap: () {
              getIt.get<UserRepository>().setDarkMode(false);
              setState(() {});
            },
          ),
          SettingsButton(
            preferenceKey: '',
            icon: SnIcons.notification,
            text: 'уведомления',
            disabledIcon: SnIcons.notification_off,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
