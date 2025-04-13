import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../pages/home_page/widgets/home_page.dart';
import '../pages/home_page/widgets/tabs/profile_tab/profile_tab.dart';
import '../pages/home_page/widgets/tabs/schedule_tab/schedule_tab.dart';
import 'app_routes_paths.dart';

final GlobalKey<StatefulNavigationShellState> homeKey =
    GlobalKey<StatefulNavigationShellState>();

final GoRouter initRouter = GoRouter(
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      key: homeKey,

      builder: (context, state, navigationShell) {
        return HomePage(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutesPaths.scheduleRoute,
              name: AppRoutesPaths.scheduleRoute,
              builder: (context, state) {
                return  ScheduleTab();
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
                return  ProfileTab();
              },
            ),
          ],
        ),
      ],
    ),
    // GoRoute(
    //   path: AppRoutesPaths.initialLoaderRoute,
    //   name: AppRoutesPaths.initialLoaderRoute,
    //   builder: (context, state) {
    //     return const InitialLoaderPage();
    //   },
    // ),
    // GoRoute(
    //   path: AppRoutesPaths.welcomeNewUserRoute,
    //   name: AppRoutesPaths.welcomeNewUserRoute,
    //   builder: (context, state) {
    //     return const WelcomeNewUserPage();
    //   },
    //   routes: [
    //     GoRoute(
    //       path: AppRoutesPaths.registerBeginRoute,
    //       name: AppRoutesPaths.registerBeginRoute,
    //       builder: (context, state) {
    //         return const RegisterBeginPage();
    //       },
    //       routes: [
    //         GoRoute(
    //           path: AppRoutesPaths.registerConfirmNumberRoute,
    //           name: AppRoutesPaths.registerConfirmNumberRoute,
    //           builder: (context, state) {
    //             return const RegisterConfirmNumberPage();
    //           },
    //           routes: [
    //             GoRoute(
    //               path: AppRoutesPaths.registerEndRoute,
    //               name: AppRoutesPaths.registerEndRoute,
    //               builder: (context, state) {
    //                 return const RegisterEndPage();
    //               },
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //   ],
    // ),
    // GoRoute(
    //   path: AppRoutesPaths.welcomeAuthorizedUserRoute,
    //   name: AppRoutesPaths.welcomeAuthorizedUserRoute,
    //   builder: (context, state) {
    //     return const WelcomeAuthorizedUserPage();
    //   },
    //   // routes: []
    // ),
  ],
);
