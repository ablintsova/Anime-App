import 'package:anime_app/core/models/AnimeModel.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../models/GenreModel.dart';
import 'base_http_client.dart';
import 'http_client.dart';

@singleton
class ApiProvider {
  late final BaseHttpClient _httpClient = AppHttpClient();

  Future fetchRequest(RequestOptions request) async {
    final response = await _httpClient.fetch(request: request);
    return response;
  }
}

extension Explore on ApiProvider {
  Future<List<GenreModel>?> getGenres() async {
    final response = await _httpClient.get(query: "/genres/anime");
    return List<GenreModel>.from(response.map((x) => GenreModel.fromJson(x)));
  }

  Future<List<AnimeModel>?> getTopAnimeList({
    int limit = 10,
  }) async {
    final response = await _httpClient.get(
      query: "/top/anime",
      queryParameters: {"limit": limit},
    );
    return List<AnimeModel>.from(response.map((x) => AnimeModel.fromJson(x)));
  }

  Future<List<AnimeModel>?> getAnimeByGenre({
    required int genreId,
    int limit = 10,
  }) async {
    final response = await _httpClient.get(
      query: "/anime",
      queryParameters: {
        "limit": limit,
        "genres": genreId,
      },
    );
    return List<AnimeModel>.from(response.map((x) => AnimeModel.fromJson(x)));
  }
}
