import 'package:anime_app/ui/explore_page/explore_page.dart';
import 'package:anime_app/ui/explore_page/pages/top_anime/top_anime_page.dart';
import 'package:anime_app/ui/favorites_page/favorites_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app_routes.dart';
import 'custom_shell_route.dart';

class GoRouterWrapper {
  late final GoRouter _routerInstance;

  final _rootNavigatorKey = GlobalKey<NavigatorState>();
  final _shellNavigatorKey = GlobalKey<NavigatorState>();

  GoRouter get goRouter => _routerInstance;

  GoRouterWrapper() {
    _routerInstance = GoRouter(
      initialLocation: AppRoutes.explore,
      navigatorKey: _rootNavigatorKey,
      routes: [
        BottomTabBarShellRoute(
          navigatorKey: _shellNavigatorKey,
          routes: [
            GoRoute(
              path: AppRoutes.explore,
              pageBuilder: (context, state) => NoTransitionPage(
                  key: state.pageKey, child: const ExplorePage()),
              routes: [
                GoRoute(
                  path: AppRoutes.topAnimePage,
                  builder: (context, state) => const TopAnimePage(),
                ),
              ],
            ),
            GoRoute(
              path: AppRoutes.favorites,
              pageBuilder: (context, state) =>
                  NoTransitionPage(key: state.pageKey, child: FavoritesPage()),
            ),
          ],
        ),
      ],
    );
  }
}
