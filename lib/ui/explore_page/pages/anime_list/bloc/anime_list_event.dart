part of 'anime_list_bloc.dart';

@immutable
abstract class AnimeListEvent {}

class GetTopAnime extends AnimeListEvent {}

class GetAnimeByGenre extends AnimeListEvent {
  final int genreId;

  GetAnimeByGenre({required this.genreId});
}