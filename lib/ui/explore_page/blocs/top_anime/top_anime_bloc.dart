import 'dart:async';

import 'package:anime_app/core/models/AnimeModel.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/data/repositories/main_repository.dart';

part 'top_anime_event.dart';
part 'top_anime_state.dart';

@injectable
class TopAnimeBloc extends Bloc<TopAnimeEvent, TopAnimeState> {
  final MainRepository _repo;
  TopAnimeBloc(this._repo) : super(const ListIsLoading()) {
    on<InitialTopListEvent>(_onInitialEvent);
  }

  void _onInitialEvent(event, emit) async {
    final list = _repo.topAnime ?? await _repo.getTopRatedAnime();
    if (list?.isEmpty ?? true) {
      emit(const ListIsEmpty());
    } else {
      emit(ListHasLoaded(topAnimeList: list));
    }
  }
}
