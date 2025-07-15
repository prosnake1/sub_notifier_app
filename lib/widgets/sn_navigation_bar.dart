import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sub_notifier_app/icons/sn_icons.dart';
import 'package:sub_notifier_app/theme/theme_typography.dart';

class SnNavigationBar extends StatelessWidget {
  const SnNavigationBar({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final colors = changeItemColor();
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomAppBar(
        height: 56,
        padding: EdgeInsets.zero,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: InkWell(
                enableFeedback: false,
                onTap: () {
                  navigationShell.goBranch(0);
                  changeItemColor();
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      SnIcons.clipboard,
                      size: 35,
                      color: colors[0],
                    ),
                    Text(
                      'Мои подписки',
                      style:
                          ThemeTypography.bodySmall.copyWith(color: colors[0]),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {
                  navigationShell.goBranch(1);
                  changeItemColor();
                },
                style: TextButton.styleFrom(
                  minimumSize: Size(120, 40),
                ),
                child: Text(
                  (navigationShell.currentIndex != 1)
                      ? 'Добавить'
                      : 'Сохранить',
                  style: ThemeTypography.bodyLarge,
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                enableFeedback: false,
                onTap: () {
                  navigationShell.goBranch(2);
                  changeItemColor();
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      SnIcons.settings,
                      size: 35,
                      color: colors[2],
                    ),
                    Text(
                      'Настройки',
                      style: ThemeTypography.bodySmall.copyWith(
                        color: colors[2],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool isRouteSelected(int currentIndex) {
    if (currentIndex != navigationShell.currentIndex) {
      return false;
    } else {
      return true;
    }
  }

  Color getItemColor(
    int currentIndex,
  ) {
    return isRouteSelected(currentIndex) ? Colors.black : Colors.grey;
  }

  List<Color> changeItemColor() {
    List<Color> colors = [];
    for (var i = 0; i < 3; i++) {
      Color color = getItemColor(i);
      colors.add(color);
    }
    return colors;
  }
}
