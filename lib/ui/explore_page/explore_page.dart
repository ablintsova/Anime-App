import 'package:anime_app/ui/explore_page/blocs/top_anime/top_anime_bloc.dart';
import 'package:anime_app/ui/explore_page/widgets/genre_widgets.dart';
import 'package:anime_app/ui/explore_page/widgets/top_list_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/injector/injector.dart';
import '../../core/themes/app_colors.dart';
import '../../core/themes/app_text_style.dart';
import 'blocs/genres/genres_bloc.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt.get<GenresBloc>()..add(InitialEvent()),
        ),
        BlocProvider(
          create: (context) => getIt.get<TopAnimeBloc>(),
        ),
      ],
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const TopAnimeListHeader(),
                  const SizedBox(height: 15),
                  const TopAnimeList(),
                  const SizedBox(height: 20),
                  Text(
                    "Explore Genres",
                    style: AppTextStyle.s28w600
                        .copyWith(color: AppColors.indigo900),
                  ),
                  const SizedBox(height: 15),
                  const GenreList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
