import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sub_notifier_app/features/add_subscription/view/add_subscription_screen.dart';
import 'package:sub_notifier_app/features/home/view/home_screen.dart';
import 'package:sub_notifier_app/features/settings/view/settings_screen.dart';
import 'package:sub_notifier_app/features/splash/view/splash_screen.dart';
import 'package:sub_notifier_app/features/welcome/view/welcome_screen.dart';
import 'package:sub_notifier_app/widgets/sn_navigation_bar.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => SnNavigationBar(
        navigationShell: navigationShell,
      ),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              builder: (BuildContext context, GoRouterState state) {
                return HomeScreen();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/add-subscription',
              builder: (BuildContext context, GoRouterState state) {
                return AddSubscriptionScreen();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/settings',
              builder: (BuildContext context, GoRouterState state) {
                return SettingsScreen();
              },
            ),
          ],
        ),
      ],
    ),
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
  ],
);
