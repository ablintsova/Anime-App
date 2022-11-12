part of 'top_anime_bloc.dart';

@immutable
abstract class TopAnimeState {
  final List<AnimeModel>? topAnimeList;

  const TopAnimeState({this.topAnimeList});
}

class ListIsEmpty extends TopAnimeState {
  const ListIsEmpty();
}

class ListIsLoading extends TopAnimeState {
  const ListIsLoading();
}

class ListHasLoaded extends TopAnimeState {
  const ListHasLoaded({required super.topAnimeList});
}
