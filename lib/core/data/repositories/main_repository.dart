import 'package:anime_app/core/data/remote/http/api_provider.dart';
import 'package:anime_app/core/models/AnimeModel.dart';
import 'package:injectable/injectable.dart';

import '../../models/GenreModel.dart';
import '../local/local_storage.dart';

@singleton
class MainRepository {
  final ApiProvider _apiProvider;
  final LocalStorage _storage;

  List<GenreModel>? genres;
  List<AnimeModel>? topAnime;
  List<AnimeModel>? favoritesSync;

  Future<List<AnimeModel>?> get favorites async =>
      favoritesSync = await _storage.loadFavorites();

  MainRepository(this._apiProvider, this._storage);

  Future getInitialData() async {
    await favorites;
    await getGenres();
    await getTopRatedAnime();
  }

  Future<List<GenreModel>?> getGenres() async =>
      genres = await _apiProvider.getGenres();

  Future getTopRatedAnime() async =>
      topAnime = await _apiProvider.getTopAnimeList();

  Future getAnimeByGenre({required int genreId}) async =>
      await _apiProvider.getAnimeByGenre(genreId: genreId);

  bool checkIfFavorite({required int animeId}) =>
      favoritesSync?.map((anime) => anime.malId).contains(animeId) ?? false;

  Future changeFavoriteStatus({required AnimeModel anime}) async =>
      favoritesSync = await _storage.changeFavoriteStatus(anime);
}
