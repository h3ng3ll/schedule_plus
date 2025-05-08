import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../pages/auth/pages/login_page/login_page.dart';
import '../pages/auth/pages/register_page/register_page.dart';
import '../pages/home_page/pages/notifications_page/notifications_page.dart';
import '../pages/home_page/root_home.dart';
import '../pages/home_page/widgets/home_page.dart';
import '../pages/home_page/widgets/tabs/profile_tab/profile_tab.dart';
import '../pages/home_page/widgets/tabs/schedule_tab/schedule_tab.dart';
import '../pages/welcome_page/welcome_page.dart';
import 'app_routes_paths.dart';

final GlobalKey<StatefulNavigationShellState> homeKey =
    GlobalKey<StatefulNavigationShellState>();

final GoRouter initRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: AppRoutesPaths.welcomeRouter,
      name: AppRoutesPaths.welcomeRouter,
      builder: (context, state) {
        return WelcomePage();
      },
      routes: [
        GoRoute(
          path: AppRoutesPaths.registerRouter,
          name: AppRoutesPaths.registerRouter,
          builder: (context, state) {
            return RegisterPage();
          },
        ), GoRoute(
          path: AppRoutesPaths.loginRouter,
          name: AppRoutesPaths.loginRouter,
          builder: (context, state) {
            return LoginPage();
          },
        ),
      ],
    ),
    StatefulShellRoute.indexedStack(
      branches: [
        StatefulShellBranch(
          routes: [
            StatefulShellRoute.indexedStack(
              key: homeKey,
              builder: (context, state, navigationShell) {
                return HomePage(
                  navigationShell: navigationShell,
                );
              },
              branches: [
                StatefulShellBranch(
                  routes: [
                    GoRoute(
                      path: AppRoutesPaths.scheduleRoute,
                      name: AppRoutesPaths.scheduleRoute,
                      builder: (context, state) {
                        return ScheduleTab();
                      },
                    ),
                  ],
                ),
                StatefulShellBranch(
                  routes: [
                    GoRoute(
                      path: AppRoutesPaths.profileRoute,
                      name: AppRoutesPaths.profileRoute,
                      builder: (context, state) {
                        return ProfileTab();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutesPaths.notificationRoute,
              name: AppRoutesPaths.notificationRoute,
              builder: (context, state) {
                return NotificationsPage();
              },
            ),
          ],
        ),
      ],
      builder: (context, state, navigationShell) {
        return RootHome(
          navigationShell: navigationShell,
        );
      },
    ),
  ],
);
