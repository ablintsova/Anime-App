import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../core/data/repositories/main_repository.dart';
import '../../../core/models/AnimeModel.dart';

part 'favorites_event.dart';

part 'favorites_state.dart';

@injectable
class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final MainRepository _repo;

  FavoritesBloc(this._repo) : super(const FavoritesAreLoading()) {
    _setFavoritesListener();
    on<InitFavorites>(_onInitFavorites);
  }


  void _onInitFavorites(event, emit) async {
    final list = await _repo.favorites;
    if (list?.isEmpty ?? true) {
      emit(const FavoritesAreEmpty());
    } else {
      emit(FavoritesHaveLoaded(list: list));
    }
  }

  void _setFavoritesListener() {
    if (!_repo.favoritesStream.isClosed) {
      _repo.favoritesStream.stream.listen((fromFavorites) {
        if (!isClosed && !fromFavorites) {
          add(InitFavorites());
        }
      });
    }
  }
}
