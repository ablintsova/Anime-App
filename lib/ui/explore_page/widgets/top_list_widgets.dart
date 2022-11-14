import 'package:anime_app/core/navigation/app_routes.dart';
import 'package:anime_app/core/themes/app_colors.dart';
import 'package:anime_app/core/themes/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/localization/l10n.dart';
import '../../../core/models/AnimeModel.dart';
import '../pages/anime_list/bloc/anime_list_bloc.dart';

class TopAnimeListHeader extends StatelessWidget {
  const TopAnimeListHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.of(context).topAnimeSectionTitle,
          style: AppTextStyle.s28w600.copyWith(color: AppColors.indigo900),
        ),
        GestureDetector(
          onTap: () {
            GoRouter.of(context)
                .go("${AppRoutes.explore}/${AppRoutes.animeListPage}");
          },
          child: Text(
            S.of(context).seeAllButtonText,
            style: AppTextStyle.s18w500.copyWith(color: AppColors.indigo900),
          ),
        ),
      ],
    );
  }
}

class TopAnimeList extends StatelessWidget {
  const TopAnimeList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimeListBloc, AnimeListState>(
      builder: (context, state) {
        return state is ListIsLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : state is ListIsEmpty
                ? Center(
                    child: Text(
                      S.of(context).emptyTopAnimeListMessage,
                      style: AppTextStyle.s20w600.copyWith(
                        color: AppColors.purple500,
                      ),
                    ),
                  )
                : SizedBox(
                    height: 290,
                    child: CustomScrollView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      slivers: [
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) =>
                                TopAnimeCard(anime: state.animeList![index]),
                            childCount: state.animeList!.length,
                          ),
                        ),
                      ],
                    ),
                  );
      },
    );
  }
}

class TopAnimeCard extends StatelessWidget {
  final AnimeModel anime;

  const TopAnimeCard({super.key, required this.anime});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: go to anime page
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Image.network(
            anime.images!.imageUrl,
            scale: 1.5,
          ),
          const SizedBox(height: 6),
          Expanded(
              child: SizedBox(
            width: 150,
            child: Text(
              anime.title.length < 25
                  ? anime.title
                  : "${anime.title.substring(0, 20)}...",
              style: AppTextStyle.s18w600.copyWith(color: AppColors.indigo800),
            ),
          ))
        ]),
      ),
    );
  }
}
