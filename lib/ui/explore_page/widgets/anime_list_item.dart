import 'package:anime_app/core/models/AnimeModel.dart';
import 'package:anime_app/core/themes/app_colors.dart';
import 'package:anime_app/core/themes/app_text_style.dart';
import 'package:anime_app/ui/widgets/like_button.dart';
import 'package:flutter/material.dart';

class AnimeListItem extends StatelessWidget {
  final AnimeModel anime;

  const AnimeListItem({required this.anime, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.only(bottom: 10.0),
      height: 125,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.indigo400!.withOpacity(0.2),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.topLeft,
            width: 65,
            child: Image.network(
              anime.images!.smallImageUrl,
              scale: 0.8,
            ),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    anime.title,
                    style: AppTextStyle.s18w600
                        .copyWith(color: AppColors.black800),
                  ),
                ),
                if (anime.score != null) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.star, color: AppColors.purple300),
                      const SizedBox(width: 4),
                      Text(
                        anime.score.toString(),
                        style: AppTextStyle.s16w600
                            .copyWith(color: AppColors.indigo800),
                      )
                    ],
                  ),
                ],
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: LikeButton(),
          ),
        ],
      ),
    );
  }
}
