import 'package:anime_app/ui/explore_page/explore_page.dart';
import 'package:anime_app/ui/favorites_page/favorites_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../main/main_scaffold.dart';
import 'app_routes.dart';

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
        ShellRoute(
            navigatorKey: _shellNavigatorKey,
            builder: (context, state, child) => MainScaffold(child: child),
            routes: [
              GoRoute(
                path: AppRoutes.explore,
                pageBuilder: (context, state) =>
                    NoTransitionPage(key: state.pageKey, child: ExplorePage()),
                routes: const [],
              ),
              GoRoute(
                path: AppRoutes.favorites,
                pageBuilder: (context, state) =>
                    NoTransitionPage(key: state.pageKey, child: FavoritesPage()),
              ),
            ]),
      ],
    );
  }
}
