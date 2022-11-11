import 'package:anime_app/core/models/GenreModel.dart';
import 'package:anime_app/core/themes/app_colors.dart';
import 'package:anime_app/core/themes/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/genres/genres_bloc.dart';

class GenreList extends StatelessWidget {
  const GenreList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenresBloc, GenresState>(
      builder: (context, state) {
        return state is GenresAreLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : state is GenresAreEmpty
                ? Center(
                    child: Text(
                      "Hmm, I guess, anime is it's own genre...",
                      style: AppTextStyle.s20w600.copyWith(
                        color: AppColors.purple500,
                      ),
                    ),
                  )
                : CustomScrollView(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    slivers: [
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) => Column(
                            children: [
                              GenreCard(genre: state.genres![index]),
                              if (index != state.genres!.length - 1)
                                const Divider(),
                            ],
                          ),
                          childCount: state.genres!.length,
                        ),
                      ),
                    ],
                  );
      },
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
              style:
                  AppTextStyle.s20w600.copyWith(color: AppColors.purple300),
            ),
          ],
        ),
      ),
    );
  }
}
