import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../navigation/app_routes.dart';

class BottomNavBarTabItem extends BottomNavigationBarItem {
  final String initialPath;

  const BottomNavBarTabItem({
    required this.initialPath,
    required super.icon,
    super.label,
  });
}

class MainScaffold extends StatefulWidget {
  final Widget child;

  const MainScaffold({Key? key, required this.child}) : super(key: key);

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int get _currentIndex => _locationToTabIndex(GoRouter.of(context).location);

  final tabs = [
    const BottomNavBarTabItem(
      initialPath: AppRoutes.explore,
      icon: Icon(Icons.explore),
      label: 'Explore',
    ),
    const BottomNavBarTabItem(
      initialPath: AppRoutes.favorites,
      icon: Icon(Icons.favorite),
      label: 'Favorites',
    ),
  ];

  int _locationToTabIndex(String location) {
    final index = tabs.indexWhere((t) => location.startsWith(t.initialPath));
    return index < 0 ? 0 : index;
  }

  void _onTap(BuildContext context, int tabIndex) {
    if (tabIndex != _currentIndex) {
      context.go(tabs[tabIndex].initialPath);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: tabs,
        onTap: (index) => _onTap(context, index),
      ),
    );
  }
}
