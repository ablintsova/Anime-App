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
          appBar: AppBar(
            title: Text(S.of(context).topAnimeSectionTitle),
          ),
          body: state is ListIsLoading
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
                        SliverPadding(
                          padding: const EdgeInsets.all(16.0),
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
        );
      }),
    );
  }
}
