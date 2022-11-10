import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../navigation/router.dart';

class AppInitializationWidget extends StatefulWidget {
  const AppInitializationWidget({Key? key}) : super(key: key);

  @override
  State<AppInitializationWidget> createState() =>
      _AppInitializationWidgetState();
}

class _AppInitializationWidgetState extends State<AppInitializationWidget> {
  GoRouterWrapper? _routerWrapper;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _routerWrapper ??= GoRouterWrapper();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: _routerWrapper!.goRouter.routerDelegate,
      routeInformationParser: _routerWrapper!.goRouter.routeInformationParser,
      routeInformationProvider:
      _routerWrapper!.goRouter.routeInformationProvider,
      title: 'Anime app',
      //theme: AppThemes.lightTheme,
      //darkTheme: AppThemes.darkTheme,
    );
  }
}
