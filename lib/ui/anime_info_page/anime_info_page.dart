
import 'package:flutter/material.dart';

import '../../core/models/AnimeModel.dart';

class AnimeInfoPage extends StatelessWidget {
  final AnimeModel anime;

  const AnimeInfoPage({required this.anime, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(anime.title),),
      body: Center(child: Text("hello"),),
    );
  }

}