import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sub_notifier_app/features/add_subscription/view/add_subscription_screen.dart';
import 'package:sub_notifier_app/features/change_language/view/change_language_screen.dart';
import 'package:sub_notifier_app/features/home/view/home_screen.dart';
import 'package:sub_notifier_app/features/onboarding/view/onboarding_screen.dart';
import 'package:sub_notifier_app/features/settings/view/settings_screen.dart';
import 'package:sub_notifier_app/features/splash/view/splash_screen.dart';
import 'package:sub_notifier_app/features/welcome/view/welcome_screen.dart';
import 'package:sub_notifier_app/features/subscription/view/subscription_screen.dart';
import 'package:sub_notifier_app/locator/di.dart';
import 'package:sub_notifier_app/widgets/sn_navigation_bar.dart';
import 'package:talker_flutter/talker_flutter.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  observers: [TalkerRouteObserver(getIt<Talker>())],
  initialLocation: '/splash',
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
              pageBuilder: (BuildContext context, GoRouterState state) {
                return NoTransitionPage(child: HomeScreen());
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
      path: '/welcome',
      builder: (BuildContext context, GoRouterState state) {
        return WelcomeScreen();
      },
    ),
    // GoRoute(
    //   path: '/onboarding',
    //   builder: (BuildContext context, GoRouterState state) {
    //     return OnboardingScreen();
    //   },
    // ),
    GoRoute(
      path: '/add-subscription',
      builder: (BuildContext context, GoRouterState state) {
        return AddSubscriptionScreen();
      },
    ),
    GoRoute(
      path: '/sub/:id',
      name: 'sub',
      builder: (context, state) {
        return SubscriptionScreen(
          id: state.pathParameters['id']!,
        );
      },
    ),
    GoRoute(
      path: '/language',
      builder: (BuildContext context, GoRouterState state) {
        return ChangeLanguageScreen();
      },
    ),
  ],
);
