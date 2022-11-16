part of 'favorites_bloc.dart';

@immutable
abstract class FavoritesState {
  final List<AnimeModel>? list;

  const FavoritesState({this.list});
}

class FavoritesAreEmpty extends FavoritesState {
  const FavoritesAreEmpty();
}

class FavoritesAreLoading extends FavoritesState {
  const FavoritesAreLoading();
}

class FavoritesHaveLoaded extends FavoritesState {
  const FavoritesHaveLoaded({required super.list});
}
