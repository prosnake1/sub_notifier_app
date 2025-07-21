import 'package:flutter/material.dart';
import 'package:sub_notifier_app/domain/repositories/user/user_repository.dart';
import 'package:sub_notifier_app/extensions/extensions.dart';
import 'package:sub_notifier_app/locator/di.dart';
import 'package:sub_notifier_app/theme/theme.dart';
import 'package:sub_notifier_app/theme/theme_colors.dart';

class SettingsButton extends StatefulWidget {
  const SettingsButton({
    super.key,
    this.preferenceKey = '',
    required this.icon,
    this.disabledIcon,
    required this.text,
    required this.onTap,
  });

  final String preferenceKey;
  final IconData icon;
  final IconData? disabledIcon;
  final String text;
  final Function onTap;

  @override
  State<SettingsButton> createState() => _SettingsButtonState();
}

class _SettingsButtonState extends State<SettingsButton> {
  final _userRepository = getIt<UserRepository>();
  bool? isActive;

  @override
  void initState() {
    _getStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap();
        if (isActive != null) {
          isActive = !isActive!;
          _saveStatus(isActive!);
          setState(() {});
        }
      },
      borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: BoxDecoration(
          color: (Theme.of(context).brightness == Brightness.dark)
              ? ThemeColors.textIconPrimaryExtraLow
              : ThemeColors.textIconExtraLow,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            20.ph,
            Icon(
              (isActive == null || isActive == false)
                  ? widget.icon
                  : widget.disabledIcon,
              size: 40,
            ),
            Text(
              widget.text,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _getStatus() async {
    final prefs = _userRepository.preferences;

    final value = prefs.getBool(widget.preferenceKey) ?? false;
    if (widget.disabledIcon != null) {
      setState(() {
        isActive = value;
      });
    }
  }

  Future<void> _saveStatus(bool value) async {
    final prefs = _userRepository.preferences;
    await prefs.setBool(widget.preferenceKey, value);
  }
}
