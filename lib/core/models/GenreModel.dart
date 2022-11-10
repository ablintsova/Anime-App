
class GenreModel {
  GenreModel({
    required this.malId,
    required this.name,
    required this.url,
    required this.count,
  });

  final int malId;
  final String name;
  final String url;
  final int count;

  factory GenreModel.fromJson(Map<String, dynamic> json) => GenreModel(
    malId: json["mal_id"],
    name: json["name"],
    url: json["url"],
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "mal_id": malId,
    "name": name,
    "url": url,
    "count": count,
  };
}
