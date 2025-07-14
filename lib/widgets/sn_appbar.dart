import 'package:flutter/material.dart';
import 'package:sub_notifier_app/icons/sn_icons.dart';
import 'package:sub_notifier_app/theme/theme_typography.dart';
import 'package:sub_notifier_app/widgets/sn_icon_button.dart';

class SnAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SnAppBar({
    super.key,
    required this.title,
    this.notificationsEnabled = true,
    this.leadingEnabled = false,
  });
  final String title;
  final bool notificationsEnabled;
  final bool leadingEnabled;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: !notificationsEnabled
          ? []
          : [
              SnIconButton(
                icon: Icon(SnIcons.notification),
                onTap: () {},
              ),
            ],
      leading: !leadingEnabled
          ? null
          : SnIconButton(
              icon: Icon(
                SnIcons.chevron_left,
              ),
              onTap: () {},
            ),
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Text(
        title,
        style: ThemeTypography.headlineSmall,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
