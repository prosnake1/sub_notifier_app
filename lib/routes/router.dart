import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sub_notifier_app/features/home/view/home_screen.dart';
import 'package:sub_notifier_app/features/splash/view/splash_screen.dart';
import 'package:sub_notifier_app/features/welcome/view/welcome_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/splash',
      builder: (BuildContext context, GoRouterState state) {
        return SplashScreen();
      },
    ),
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return WelcomeScreen();
      },
    ),
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return HomeScreen();
      },
    ),
  ],
);
