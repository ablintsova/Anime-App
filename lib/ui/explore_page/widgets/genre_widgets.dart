import 'package:anime_app/core/models/GenreModel.dart';
import 'package:anime_app/core/themes/app_colors.dart';
import 'package:anime_app/core/themes/app_text_style.dart';
import 'package:flutter/material.dart';

class GenreList extends StatelessWidget {
  const GenreList({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => Column(
              children: [
                GenreCard(
                    genre: GenreModel(
                        name: "Genre $index",
                        malId: 0,
                        url: "",
                        count: index * 2)),
                if (index != 13) const Divider(),
              ],
            ),
            childCount: 14,
          ),
        ),
      ],
    );
  }
}

class GenreCard extends StatelessWidget {
  final GenreModel genre;

  const GenreCard({super.key, required this.genre});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: go to anime list of this genre
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Row(
          children: [
            Text(
              genre.name,
              style: AppTextStyle.s22w600.copyWith(color: AppColors.indigo800),
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              "(${genre.count})",
              style: AppTextStyle.s20w600.copyWith(color: AppColors.black700),
            ),
          ],
        ),
      ),
    );
  }
}
