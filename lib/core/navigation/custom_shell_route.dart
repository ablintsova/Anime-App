import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../main/main_scaffold.dart';

/// Use to preserve tab state when navigating
class BottomTabBarShellRoute extends ShellRoute {
  BottomTabBarShellRoute({
    GlobalKey<NavigatorState>? navigatorKey,
    List<RouteBase> routes = const <RouteBase>[],
    Key? scaffoldKey = const ValueKey('ScaffoldWithNavBar'),
  }) : super(
          navigatorKey: navigatorKey,
          routes: routes,
          builder: (context, state, Widget fauxNav) {
            return Stack(
              children: [
                /// Needed to keep the (faux) shell navigator alive
                Offstage(child: fauxNav),
                MainScaffold(
                  key: scaffoldKey,
                  currentNavigator: fauxNav as Navigator,
                  currentRouterState: state,
                  routes: routes,
                ),
              ],
            );
          },
        );
}
