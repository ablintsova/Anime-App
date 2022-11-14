import 'dart:async';

import 'package:anime_app/core/models/AnimeModel.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/data/repositories/main_repository.dart';

part 'anime_list_event.dart';

part 'anime_list_state.dart';

@injectable
class AnimeListBloc extends Bloc<AnimeListEvent, AnimeListState> {
  final MainRepository _repo;

  AnimeListBloc(this._repo) : super(const ListIsLoading()) {
    on<GetTopAnime>(_onGetTopAnime);
    on<GetAnimeByGenre>(_onGetAnimeByGenre);

  }

  void _onGetTopAnime(event, emit) async {
    final list = _repo.topAnime ?? await _repo.getTopRatedAnime();
    if (list?.isEmpty ?? true) {
      emit(const ListIsEmpty());
    } else {
      emit(ListHasLoaded(animeList: list));
    }
  }

  void _onGetAnimeByGenre(event, emit) async {
    final animeList = await _repo.getAnimeByGenre(genreId: event.genreId);
    if (animeList?.isEmpty ?? true) {
      emit(const ListIsEmpty());
    } else {
      emit(ListHasLoaded(animeList: animeList));
    }
  }
}
