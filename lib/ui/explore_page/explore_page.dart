import 'package:anime_app/ui/explore_page/pages/top_anime/bloc/top_anime_bloc.dart';
import 'package:anime_app/ui/explore_page/widgets/genre_widgets.dart';
import 'package:anime_app/ui/explore_page/widgets/top_list_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/injector/injector.dart';
import '../../core/localization/l10n.dart';
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
          create: (context) =>
              getIt.get<GenresBloc>()..add(InitialGenresEvent()),
        ),
        BlocProvider(
          create: (context) =>
              getIt.get<TopAnimeBloc>()..add(InitialTopListEvent()),
        ),
      ],
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            Opacity(
              opacity: 0.6,
              child: SvgPicture.asset(
                "assets/images/background_image.svg",
                fit: BoxFit.cover,
              ),
            ),
            SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    const TopAnimeListHeader(),
                    const SizedBox(height: 15),
                    const TopAnimeList(),
                    const SizedBox(height: 20),
                    Text(
                      S.of(context).genresSectionTitle,
                      style: AppTextStyle.s28w600
                          .copyWith(color: AppColors.indigo900),
                    ),
                    const SizedBox(height: 15),
                    const GenreList(),
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
