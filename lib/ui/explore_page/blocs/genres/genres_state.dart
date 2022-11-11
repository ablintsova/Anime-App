part of 'genres_bloc.dart';

@immutable
abstract class GenresState {
  final List<GenreModel>? genres;

  const GenresState({this.genres});
}

class GenresAreEmpty extends GenresState {
  const GenresAreEmpty();
}

class GenresAreLoading extends GenresState {
  const GenresAreLoading();
}

class GenresHasLoaded extends GenresState {
  const GenresHasLoaded({required super.genres});
}
