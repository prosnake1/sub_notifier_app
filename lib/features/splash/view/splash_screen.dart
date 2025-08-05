import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sub_notifier_app/bloc/theme/theme_cubit.dart';
import 'package:sub_notifier_app/domain/repositories/user/user_repository.dart';
import 'package:sub_notifier_app/locator/di.dart';
import 'package:sub_notifier_app/routes/router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _themeCubit = getIt<ThemeCubit>();
  final _userRepository = getIt<UserRepository>();
  @override
  void initState() {
    _themeCubit.enableTheme();
    Future.delayed(const Duration(seconds: 2), () {
      router.go(_userRepository.isViewed ? '/home' : '/welcome');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LottieBuilder.asset(
          (Theme.of(context).brightness == Brightness.dark)
              ? 'assets/lottie/SplashLight.json'
              : 'assets/lottie/SplashDark.json',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
