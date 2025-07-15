import 'package:flutter/material.dart';
import 'package:sub_notifier_app/bloc/theme/theme_cubit.dart';
import 'package:sub_notifier_app/icons/sn_icons.dart';
import 'package:sub_notifier_app/locator/di.dart';
import 'package:sub_notifier_app/routes/router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _themeCubit = getIt<ThemeCubit>();
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      router.go('/');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Icon(
          SnIcons.clipboard,
          size: 100,
        ),
      ),
    );
  }
}
