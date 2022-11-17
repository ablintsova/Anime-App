import 'dart:convert';

import 'package:anime_app/ui/anime_info_page/anime_info_page.dart';
import 'package:anime_app/ui/explore_page/explore_page.dart';
import 'package:anime_app/ui/favorites_page/favorites_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../ui/explore_page/pages/anime_list/anime_list_page.dart';
import '../models/AnimeModel.dart';
import '../models/GenreModel.dart';
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
        GoRoute(
          name: AppRoutes.animeInfoPage,
          path: AppRoutes.animeInfoPage,
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            child: AnimeInfoPage(
              previousPath: state.queryParams["path"] as String,
              previousExtra: state.queryParams["genre"] == null
                  ? null
                  : json.decode(state.queryParams["genre"]!),
              anime: state.extra as AnimeModel,
            ),
          ),
        ),
        BottomTabBarShellRoute(
          navigatorKey: _shellNavigatorKey,
          routes: [
            GoRoute(
              path: AppRoutes.explore,
              pageBuilder: (context, state) => NoTransitionPage(
                key: state.pageKey,
                child: const ExplorePage(),
              ),
              routes: [
                GoRoute(
                  path: AppRoutes.animeListPage,
                  builder: (context, state) => AnimeListPage(
                    key: state.pageKey,
                    rootPath: state.location,
                    genre: state.extra as GenreModel?,
                  ),
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
