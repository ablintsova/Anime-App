import 'package:anime_app/core/data/repositories/main_repository.dart';
import 'package:anime_app/core/injector/injector.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'app_initialization_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  injectDependencies(env: Environment.dev);
  try {
    await getIt.get<MainRepository>().getInitialData();
    print("genre: ${getIt.get<MainRepository>().genres?.first.name}");
  } catch (e, trace) {
    print("$e $trace");
  }
  runApp(const AppInitializationWidget());
}