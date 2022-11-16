import 'package:anime_app/core/data/repositories/main_repository.dart';
import 'package:flutter/material.dart';

import '../../core/injector/injector.dart';
import '../../core/models/AnimeModel.dart';
import '../../core/themes/app_colors.dart';

class LikeButton extends StatefulWidget {
  final AnimeModel anime;

  const LikeButton({super.key, required this.anime});

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  late bool isFavorite;
  late MainRepository repo;

  @override
  initState() {
    repo = getIt.get<MainRepository>();
    isFavorite = repo.checkIfFavorite(animeId: widget.anime.malId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isFavorite = !isFavorite;
          repo.changeFavoriteStatus(anime: widget.anime);
        });
      },
      child: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: AppColors.purple300,
        size: 35,
      ),
    );
  }
}
