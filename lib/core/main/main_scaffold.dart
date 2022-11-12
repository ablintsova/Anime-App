import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../navigation/app_routes.dart';

final GlobalKey<NavigatorState> _exploreNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'exploreTab');
final GlobalKey<NavigatorState> _favoritesNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'favoritesTab');

class BottomNavBarTabItem extends BottomNavigationBarItem {
  final String initialPath;
  final GlobalKey navigatorKey;

  const BottomNavBarTabItem({
    required this.navigatorKey,
    required this.initialPath,
    required super.icon,
    super.label,
  });
}

class MainScaffold extends StatefulWidget {
  /// The navigator for the currently active tab
  final Navigator currentNavigator;
  List<Page<dynamic>> get pagesForCurrentRoute => currentNavigator.pages;
  final GoRouterState currentRouterState;
  final List<RouteBase> routes;

  const MainScaffold({
    Key? key,
    required this.currentNavigator,
    required this.currentRouterState,
    required this.routes,
  }) : super(key: key);

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int get _currentIndex => _locationToTabIndex(GoRouter.of(context).location);
  late final List<_NavBarTabNavigator> _tabs;

  final tabs = [
    BottomNavBarTabItem(
      navigatorKey: _exploreNavigatorKey,
      initialPath: AppRoutes.explore,
      icon: const Icon(Icons.explore),
      label: 'Explore',
    ),
    BottomNavBarTabItem(
      navigatorKey: _favoritesNavigatorKey,
      initialPath: AppRoutes.favorites,
      icon: const Icon(Icons.favorite),
      label: 'Favorites',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabs =
        tabs.map((BottomNavBarTabItem e) => _NavBarTabNavigator(e)).toList();
  }

  @override
  void didUpdateWidget(covariant MainScaffold oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateForCurrentTab();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateForCurrentTab();
  }

  void _updateForCurrentTab() {
    final location = GoRouter.of(context).location;

    final _NavBarTabNavigator tabNav = _tabs[_currentIndex];
    tabNav.pages = widget.pagesForCurrentRoute;
    tabNav.lastLocation = location;
  }

  int _locationToTabIndex(String location) {
    final index = tabs.indexWhere((t) => location.startsWith(t.initialPath));
    return index < 0 ? 0 : index;
  }

  void _onTap(BuildContext context, int tabIndex) {
    if (tabIndex != _currentIndex) {
      context.go(tabs[tabIndex].initialPath);
    }
  }

  Widget _buildBody(BuildContext context) {
    return IndexedStack(
        index: _currentIndex,
        children: _tabs
            .map((_NavBarTabNavigator tab) => tab.buildNavigator(context))
            .toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: _tabs
            .map((_NavBarTabNavigator e) => e.bottomNavigationTab)
            .toList(),
        onTap: (index) => _onTap(context, index),
      ),
    );
  }
}

/// Class representing a tab along with its navigation logic
class _NavBarTabNavigator {
  _NavBarTabNavigator(this.bottomNavigationTab);

  final BottomNavBarTabItem bottomNavigationTab;

  String? lastLocation;

  String get currentLocation =>
      lastLocation != null ? lastLocation! : rootRoutePath;

  String get rootRoutePath => bottomNavigationTab.initialPath;

  Key? get navigatorKey => bottomNavigationTab.navigatorKey;
  List<Page<dynamic>> pages = <Page<dynamic>>[];

  Widget buildNavigator(BuildContext context) {
    if (pages.isNotEmpty) {
      return Navigator(
        key: navigatorKey,
        pages: pages,
        onPopPage: (Route<dynamic> route, dynamic result) {
          if (pages.length == 1 || !route.didPop(result)) {
            return false;
          }
          GoRouter.of(context).pop();
          return true;
        },
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
