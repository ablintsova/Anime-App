import 'package:flutter/material.dart';

class TopAnimeListHeader extends StatelessWidget {
  const TopAnimeListHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Top Rated Anime",
          style: TextStyle(
            color: Colors.indigo[900],
            fontSize: 28,
            fontWeight: FontWeight.w700,
          ),
        ),
        GestureDetector(
          onTap: () {
            // TODO: go to full list
          },
          child: Text(
            "See all",
            style: TextStyle(
              color: Colors.indigo[900],
              fontSize: 18,
            ),
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
    return SizedBox(
      height: 240,
      child: CustomScrollView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => TopAnimeCard(title: "Anime Title $index"),
              childCount: 8,
            ),
          ),
        ],
      ),
    );
  }
}

class TopAnimeCard extends StatelessWidget {
  final String title;

  const TopAnimeCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: go to anime page
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Container(
            height: 150,
            width: 95,
            color: Colors.purple[200],
          ),
          const SizedBox(height: 6),
          Expanded(
            child: SizedBox(
              width: 95,
              child: Text(
                title.length < 25 ? title : "${title.substring(0, 20)}...",
                style: TextStyle(
                  color: Colors.indigo[700],
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
