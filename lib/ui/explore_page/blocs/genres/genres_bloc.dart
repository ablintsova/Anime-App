import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/data/repositories/main_repository.dart';
import '../../../../core/models/GenreModel.dart';

part 'genres_event.dart';
part 'genres_state.dart';

@injectable
class GenresBloc extends Bloc<GenresEvent, GenresState> {
  final MainRepository _repo;

  GenresBloc(this._repo) : super(const GenresAreLoading()) {
    on<InitialEvent>(_onInitialEvent);
  }

  void _onInitialEvent(event, emit) async {
    final genres = _repo.genres ?? await _repo.getGenres();
    if (genres?.isEmpty ?? true) {
      emit(const GenresAreEmpty());
    } else {
      emit(GenresHasLoaded(genres: genres));
    }
  }
}
