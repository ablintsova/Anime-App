import 'package:anime_app/core/models/GenreModel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/models/AnimeModel.dart';

class AnimeInfoPage extends StatelessWidget {
  final String previousPath;
  final Map<String, dynamic>? previousExtra;

  final AnimeModel anime;

  const AnimeInfoPage({
    required this.previousPath,
    required this.anime,
    this.previousExtra,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        context.go(
          previousPath,
          extra: previousExtra == null
              ? null
              : GenreModel.fromJson(previousExtra!),
        );
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () => context.go(
              previousPath,
              extra: previousExtra == null
                  ? null
                  : GenreModel.fromJson(previousExtra!),
            ),
            child: Icon(Icons.arrow_back_ios),
          ),
          title: Text(anime.title),
        ),
        body: Center(
          child: Text("hello"),
        ),
      ),
    );
  }
}
