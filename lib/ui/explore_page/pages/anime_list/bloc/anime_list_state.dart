part of 'anime_list_bloc.dart';

@immutable
abstract class AnimeListState {
  final List<AnimeModel>? animeList;

  const AnimeListState({this.animeList});
}

class ListIsEmpty extends AnimeListState {
  const ListIsEmpty();
}

class ListIsLoading extends AnimeListState {
  const ListIsLoading();
}

class ListHasLoaded extends AnimeListState {
  const ListHasLoaded({required super.animeList});
}
