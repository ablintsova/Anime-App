
import 'package:anime_app/core/data/remote/http/api_provider.dart';
import 'package:injectable/injectable.dart';

import '../../models/GenreModel.dart';

@singleton
class MainRepository {
  final ApiProvider _apiProvider;
  List<GenreModel>? genres;
  List? topAnime;

  MainRepository(this._apiProvider);

  Future getInitialData() async {
    await getGenres();
    await getTopRatedAnime();
  }

  Future<List<GenreModel>?> getGenres() async {
    return genres = await _apiProvider.getGenres();
  }

  Future getTopRatedAnime() async {
    return topAnime = await _apiProvider.getTopAnimeList();
  }
}