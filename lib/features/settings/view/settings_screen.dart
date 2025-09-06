import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sub_notifier_app/bloc/theme/theme_cubit.dart';
import 'package:sub_notifier_app/domain/repositories/user/user_repository.dart';
import 'package:sub_notifier_app/features/settings/widgets/widgets.dart';
import 'package:sub_notifier_app/i18n/strings.g.dart';
import 'package:sub_notifier_app/icons/sn_icons.dart';
import 'package:sub_notifier_app/locator/di.dart';
import 'package:sub_notifier_app/routes/router.dart';
import 'package:sub_notifier_app/widgets/widgets.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _userRepository = getIt<UserRepository>();
  final _themeCubit = getIt<ThemeCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SnAppBar(title: Text(t.settings)),
      body: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        padding: EdgeInsets.all(40),
        children: [
          SettingsButton(
            preferenceKey: 'isDarkMode',
            icon: SnIcons.sun,
            disabledIcon: SnIcons.moon,
            text: t.theme,
            onTap: () {
              _userRepository.setDarkMode(!_userRepository.isDark);
              _themeCubit.enableTheme();
            },
          ),
          SettingsButton(
            icon: SnIcons.language,
            text: t.language,
            onTap: () => router.push('/language'),
          ),
          SettingsButton(
            icon: SnIcons.circle_information,
            text: 'Version',
            onTap: () async {
              PackageInfo packageInfo = await PackageInfo.fromPlatform();
              String version = packageInfo.version;

              Fluttertoast.showToast(msg: version);
            },
          ),
        ],
      ),
    );
  }
}
