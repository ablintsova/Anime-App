import 'package:anime_app/core/navigation/app_routes.dart';
import 'package:anime_app/core/themes/app_colors.dart';
import 'package:anime_app/core/themes/app_text_style.dart';
import 'package:anime_app/ui/explore_page/widgets/anime_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/injector/injector.dart';
import '../../core/localization/l10n.dart';
import 'bloc/favorites_bloc.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<FavoritesBloc>()..add(InitFavorites()),
      child: BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (context, state) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/background_favorites.jpeg"),
                  fit: BoxFit.cover,
                  opacity: 0.5,
                ),
              ),
              child: state is FavoritesAreLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : state is FavoritesAreEmpty
                      ? _EmptyView()
                      : CustomScrollView(
                          slivers: [
                            const SliverToBoxAdapter(
                              child: SizedBox(height: 40),
                            ),
                            SliverToBoxAdapter(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                  S
                                      .of(context)
                                      .favoritesCount(state.list!.length),
                                  style: AppTextStyle.s18w600
                                      .copyWith(color: AppColors.purple400),
                                ),
                              ),
                            ),
                            SliverPadding(
                              padding: const EdgeInsets.all(20.0),
                              sliver: SliverList(
                                delegate: SliverChildBuilderDelegate(
                                  childCount: state.list!.length,
                                  (context, index) => AnimeListItem(
                                    anime: state.list![index],
                                    rootPath: AppRoutes.favorites,
                                  ),
                                ),
                              ),
                            ),
                            const SliverToBoxAdapter(
                              child: SizedBox(height: 70),
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

class _EmptyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        width: 300,
        decoration: BoxDecoration(
          color: AppColors.white.withOpacity(0.7),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              S.of(context).emptyFavorites,
              textAlign: TextAlign.center,
              style: AppTextStyle.s18w600.copyWith(color: AppColors.purple300),
            ),
            const SizedBox(height: 6),
            const Icon(Icons.catching_pokemon, size: 30),
          ],
        ),
      ),
    );
  }
}
