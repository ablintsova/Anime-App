part of 'favorites_bloc.dart';

@immutable
abstract class FavoritesEvent {}

class InitFavorites extends FavoritesEvent {}

class UpdateFavorites extends FavoritesEvent {
  final List<AnimeModel>? updatedList;

  UpdateFavorites({required this.updatedList});
}