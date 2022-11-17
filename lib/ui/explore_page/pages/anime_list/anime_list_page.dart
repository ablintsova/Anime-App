import 'dart:io';

import 'package:anime_app/ui/explore_page/pages/anime_list/bloc/anime_list_bloc.dart';
import 'package:anime_app/ui/explore_page/widgets/anime_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/injector/injector.dart';
import '../../../../core/localization/l10n.dart';
import '../../../../core/models/GenreModel.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_text_style.dart';

class AnimeListPage extends StatelessWidget {
  final String rootPath;
  final GenreModel? genre;

  const AnimeListPage({super.key, required this.rootPath, this.genre});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final event = genre != null
            ? GetAnimeByGenre(genreId: genre!.malId)
            : GetTopAnime();
        return getIt.get<AnimeListBloc>()..add(event);
      },
      child: BlocBuilder<AnimeListBloc, AnimeListState>(
        builder: (context, state) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              title: genre != null
                  ? Text(genre!.name)
                  : Text(S.of(context).topAnimeSectionTitle),
            ),
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/background_image_2.png"),
                  fit: BoxFit.cover,
                  opacity: 0.9,
                ),
              ),
              child: state is ListIsLoading
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
                      : CustomScrollView(
                          slivers: [
                            if (Platform.isIOS)
                              const SliverToBoxAdapter(
                                child: SizedBox(height: 20),
                              ),
                            SliverPadding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 90.0,
                                horizontal: 20,
                              ),
                              sliver: SliverList(
                                delegate: SliverChildBuilderDelegate(
                                  (context, index) => AnimeListItem(
                                    rootPath: rootPath,
                                    genre: genre?.toJson(),
                                    anime: state.animeList![index],
                                  ),
                                  childCount: state.animeList!.length,
                                ),
                              ),
                            ),
                          ],
                        ),
            ),
          );
        },
      ),
    );
  }
}
