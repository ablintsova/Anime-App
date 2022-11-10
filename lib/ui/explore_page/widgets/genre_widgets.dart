import 'package:flutter/material.dart';

class GenreList extends StatelessWidget {
  const GenreList({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => Column(
              children: [
                GenreCard(title: "Genre $index"),
                if (index != 13) const Divider(),
              ],
            ),
            childCount: 14,
          ),
        ),
      ],
    );
  }
}

class GenreCard extends StatelessWidget {
  final String title;

  const GenreCard({super.key, required this.title});

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
              title,
              style: TextStyle(
                color: Colors.indigo[700],
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            const Text(
              "(37)",
              style: TextStyle(
                color: Colors.black26,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
