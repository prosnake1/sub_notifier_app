import 'package:flutter/material.dart';
import 'package:sub_notifier_app/domain/repositories/user/user_repository.dart';
import 'package:sub_notifier_app/extensions/extensions.dart';
import 'package:sub_notifier_app/locator/di.dart';
import 'package:sub_notifier_app/theme/theme_colors.dart';
import 'package:sub_notifier_app/theme/theme_typography.dart';

class SettingsButton extends StatefulWidget {
  const SettingsButton({
    super.key,
    required this.preferenceKey,
    required this.icon,
    this.disabledIcon,
    required this.text,
    required this.onTap,
  });

  final String preferenceKey;
  final IconData icon;
  final IconData? disabledIcon;
  final String text;
  final Function() onTap;

  @override
  State<SettingsButton> createState() => _SettingsButtonState();
}

class _SettingsButtonState extends State<SettingsButton> {
  bool isActive = true;

  @override
  void initState() {
    _getStatus();
    super.initState();
  }

  Future<void> _getStatus() async {
    final prefs = getIt<UserRepository>().preferences;
    setState(() {
      isActive = prefs.getBool(widget.preferenceKey) ?? false;
    });
  }

  Future<void> _saveStatus(bool value) async {
    final prefs = getIt<UserRepository>().preferences;
    await prefs.setBool(widget.preferenceKey, value);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isActive = !isActive;
          _saveStatus(isActive);
        });
      },
      borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: BoxDecoration(
          color: ThemeColors.textIconExtraLow,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            20.ph,
            Icon(
              !isActive ? widget.icon : widget.disabledIcon,
              size: 40,
            ),
            Text(
              widget.text,
              style: ThemeTypography.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
