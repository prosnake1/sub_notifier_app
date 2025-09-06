import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sub_notifier_app/i18n/strings.g.dart';
import 'package:sub_notifier_app/icons/sn_icons.dart';
import 'package:sub_notifier_app/routes/router.dart';
import 'package:sub_notifier_app/theme/theme.dart';

class SnNavigationBar extends StatelessWidget {
  const SnNavigationBar({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    Color getColor(int currentIndex) {
      final isDark = (Theme.of(context).brightness == Brightness.dark);
      if (currentIndex == navigationShell.currentIndex) {
        return isDark ? Colors.white : Colors.black;
      } else {
        return isDark
            ? ThemeColors.textIconPrimaryLow
            : ThemeColors.textIconLow;
      }
    }

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
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      SnIcons.clipboard,
                      size: 35,
                      color: getColor(0),
                    ),
                    Text(
                      t.my_subs,
                      style: ThemeText.bodySmall.copyWith(
                        color: getColor(0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {
                  router.push('/add-subscription');
                },
                style: TextButton.styleFrom(
                  minimumSize: Size(120, 40),
                ),
                child: Text(
                  t.add,
                  style: ThemeText.bodyLarge,
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                enableFeedback: false,
                onTap: () {
                  navigationShell.goBranch(1);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      SnIcons.settings,
                      size: 35,
                      color: getColor(1),
                    ),
                    Text(
                      t.settings,
                      style: ThemeText.bodySmall.copyWith(
                        color: getColor(1),
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
}
