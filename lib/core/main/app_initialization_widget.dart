import 'package:anime_app/core/themes/app_themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../localization/l10n.dart';
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
      theme: appTheme,
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
