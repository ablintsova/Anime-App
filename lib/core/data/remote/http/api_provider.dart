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
  Future<List<GenreModel>> getGenres() async {
    final response = await _httpClient.get(query: "/genres/anime");
    return List<GenreModel>.from(response.map((x) => GenreModel.fromJson(x)));
  }
}