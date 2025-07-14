import 'package:flutter/material.dart';
import 'package:sub_notifier_app/features/settings/widgets/widgets.dart';
import 'package:sub_notifier_app/icons/sn_icons.dart';
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
            icon: SnIcons.sun,
            text: 'белая тема',
          ),
          SettingsButton(
            icon: SnIcons.notification,
            text: 'уведомления',
          ),
        ],
      ),
      // body: GridView.builder(
      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 2,
      //     mainAxisSpacing: 20,
      //     crossAxisSpacing: 20,
      //   ),
      //   itemCount: _settingsButtons.length,
      //   padding: EdgeInsets.all(40),
      //   itemBuilder: (context, i) {
      //     final button = _settingsButtons[i];
      //     IconData icon = button.icon;
      //     String text = button.name;
      //     return InkWell(
      //       onTap: () {
      //         text = 'уведомления: выключены';
      //       },
      //       borderRadius: BorderRadius.circular(15),
      //       child: Container(
      //         decoration: BoxDecoration(
      //           color: ThemeColors.textIconExtraLow,
      //           borderRadius: BorderRadius.circular(15),
      //         ),
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             20.ph,
      //             Icon(
      //               icon,
      //               size: 40,
      //             ),
      //             Text(
      //               text,
      //               style: ThemeTypography.bodyLarge,
      //             ),
      //           ],
      //         ),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
