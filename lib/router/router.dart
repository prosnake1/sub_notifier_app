import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sub_notifier_app/features/welcome/view/welcome_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return WelcomeScreen();
      },
    ),
  ],
);
