import 'package:flutter/material.dart';
import 'package:sub_notifier_app/icons/sn_icons.dart';
import 'package:sub_notifier_app/theme/theme_typography.dart';
import 'package:sub_notifier_app/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          SnIconButton(
            icon: Icon(SnIcons.notification),
            onTap: () {},
          ),
        ],
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Мои подписки',
          style: ThemeTypography.headlineLarge,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            label: 'Подписки',
            icon: SnIconButton(
              icon: Icon(SnIcons.clipboard),
              onTap: () {},
            ),
          ),
          BottomNavigationBarItem(
            label: 'Настройки',
            icon: SnIconButton(
              icon: Icon(SnIcons.settings),
              onTap: () {},
            ),
          )
        ],
      ),
    );
  }
}
