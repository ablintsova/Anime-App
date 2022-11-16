import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../../models/AnimeModel.dart';

@singleton
class LocalStorage {
  static const String favoritesKey = "favorites";

  read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) == null
        ? null
        : json.decode(prefs.getString(key)!);
  }

  save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  Future<List<AnimeModel>?> loadFavorites() async {
    final json = await read(LocalStorage.favoritesKey);
    return json == null
        ? null
        : List.from(json.map((e) => AnimeModel.fromJson(e)));
  }

  Future saveFavorites(List<AnimeModel>? list) async {
    await save(LocalStorage.favoritesKey, list);
  }

  Future<List<AnimeModel>?> changeFavoriteStatus(AnimeModel anime) async {
    List<AnimeModel>? favorites = await loadFavorites();
    if (favorites == null) {
      favorites = [anime];
    } else {
      if (favorites.map((e) => e.malId).contains(anime.malId)) {
        favorites.removeWhere((e) => e.malId == anime.malId);
      } else {
        favorites.add(anime);
      }
    }
    await save(LocalStorage.favoritesKey, favorites.toSet().toList());
    return favorites.toSet().toList();
  }
}
