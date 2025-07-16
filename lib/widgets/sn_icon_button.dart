import 'package:flutter/material.dart';

enum IconButtonType { small, medium }

class SnIconButton extends StatelessWidget {
  const SnIconButton({
    super.key,
    required this.icon,
    this.color = Colors.black,
    required this.onTap,
    this.type = IconButtonType.medium,
  });

  final Icon icon;
  final Color color;
  final Function() onTap;
  final IconButtonType type;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      onPressed: onTap,
      iconSize: _getIconSize(),
    );
  }

  double _getIconSize() {
    switch (type) {
      case IconButtonType.small:
        return 20;
      case IconButtonType.medium:
        return 35;
    }
  }
}
