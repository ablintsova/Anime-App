import 'package:anime_app/ui/explore_page/widgets/genre_widgets.dart';
import 'package:anime_app/ui/explore_page/widgets/top_list_widgets.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TopAnimeListHeader(),
                const SizedBox(height: 15),
                const TopAnimeList(),
                const SizedBox(height: 20),
                Text(
                  "Explore Genres",
                  style: TextStyle(
                    color: Colors.indigo[900],
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 15),
                const GenreList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
