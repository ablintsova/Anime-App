import 'dart:io';

import 'package:anime_app/core/models/GenreModel.dart';
import 'package:anime_app/core/themes/app_colors.dart';
import 'package:anime_app/core/themes/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/localization/l10n.dart';
import '../../core/models/AnimeModel.dart';
import '../widgets/like_button.dart';

class AnimeInfoPage extends StatelessWidget {
  final String previousPath;
  final Map<String, dynamic>? previousExtra;

  final AnimeModel anime;

  const AnimeInfoPage({
    required this.previousPath,
    required this.anime,
    this.previousExtra,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        context.go(
          previousPath,
          extra: previousExtra == null
              ? null
              : GenreModel.fromJson(previousExtra!),
        );
        return Future.value(false);
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: _AppBar(
          title: anime.title,
          onBackArrowTap: () => context.go(
            previousPath,
            extra: previousExtra == null
                ? null
                : GenreModel.fromJson(previousExtra!),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background_image_3.jpeg"),
              fit: BoxFit.cover,
              opacity: 0.3,
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  if (Platform.isIOS) const SizedBox(height: 20),
                  const SizedBox(height: 70),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        anime.images!.imageUrl,
                        scale: 1.5,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InfoTile(
                              title: S.of(context).year,
                              info: anime.year.toString(),
                            ),
                            InfoTile(
                              title: S.of(context).title,
                              info: anime.title,
                            ),
                            InfoTile(
                              title: S.of(context).japaneseTitle,
                              info: anime.titleJapanese,
                            ),
                            InfoTile(
                              title: S.of(context).episodes,
                              info: anime.episodes.toString(),
                            ),
                            InfoTile(
                              title: S.of(context).score,
                              info: anime.score.toString(),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Divider(height: 1, thickness: 2),
                  const SizedBox(height: 15),
                  InfoTile(
                    title: S.of(context).synopsis,
                    info: anime.synopsis,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final void Function() onBackArrowTap;

  const _AppBar({required this.onBackArrowTap, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      leading: GestureDetector(
        onTap: onBackArrowTap,
        child: Icon(
          Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Transform.scale(
            scale: 0.8,
            child: const LikeButton(),
          ),
        )
      ],
    );
  }
}

class InfoTile extends StatelessWidget {
  final String title;
  final String? info;

  const InfoTile({
    required this.title,
    required this.info,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return info == null
        ? const SizedBox()
        : Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: Wrap(
              children: [
                Text(
                  "$title:",
                  style:
                      AppTextStyle.s18w600.copyWith(color: AppColors.purple500),
                ),
                const SizedBox(width: 4),
                Text(
                  info!,
                  style:
                      AppTextStyle.s18w500.copyWith(color: AppColors.indigo900),
                ),
              ],
            ),
          );
  }
}
