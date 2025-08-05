import 'package:flutter/material.dart';

class SnAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SnAppBar({
    super.key,
    required this.title,
    this.notificationsEnabled = true,
    this.leading,
  });
  final Widget title;
  final bool notificationsEnabled;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      centerTitle: true,
      title: title,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
