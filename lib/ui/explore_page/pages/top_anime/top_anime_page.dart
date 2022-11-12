import 'dart:io';

import 'package:anime_app/ui/explore_page/widgets/anime_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/injector/injector.dart';
import '../../../../core/localization/l10n.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_text_style.dart';
import 'bloc/top_anime_bloc.dart';

class TopAnimePage extends StatelessWidget {
  const TopAnimePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt.get<TopAnimeBloc>()..add(InitialTopListEvent()),
      child:
          BlocBuilder<TopAnimeBloc, TopAnimeState>(builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            title: Text(S.of(context).topAnimeSectionTitle),
          ),
          body: Container(
            //padding: const EdgeInsets.all(20.0),
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
                            padding: const EdgeInsets.only(
                                top: 90.0, left: 20, right: 20),
                            sliver: SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (context, index) => AnimeListItem(
                                    anime: state.topAnimeList![index]),
                                childCount: state.topAnimeList!.length,
                              ),
                            ),
                          ),
                        ],
                      ),
          ),
        );
      }),
    );
  }
}
