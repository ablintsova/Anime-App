// To parse this JSON data, do
//
//     final animeModel = animeModelFromJson(jsonString);

import 'dart:convert';

AnimeModel animeModelFromJson(String str) =>
    AnimeModel.fromJson(json.decode(str));

String animeModelToJson(AnimeModel data) => json.encode(data.toJson());

class AnimeModel {
  AnimeModel({
    required this.malId,
    required this.url,
    required this.jpgImage,
    this.trailer,
    required this.approved,
    required this.titles,
    required this.title,
    required this.titleEnglish,
    required this.titleJapanese,
    required this.titleSynonyms,
    required this.type,
    required this.source,
    required this.episodes,
    required this.status,
    required this.airing,
    required this.aired,
    required this.duration,
    required this.rating,
    required this.score,
    required this.scoredBy,
    required this.rank,
    required this.popularity,
    required this.members,
    required this.favorites,
    required this.synopsis,
    required this.background,
    this.season,
    required this.year,
    required this.broadcast,
    required this.producers,
    required this.licensors,
    required this.studios,
    required this.genres,
    required this.explicitGenres,
    required this.themes,
    required this.demographics,
    required this.relations,
    required this.theme,
    required this.animeModelExternal,
    required this.streaming,
  });

  final int malId;
  final String? url;
  final JpgImage? jpgImage;
  final Trailer? trailer;
  final bool? approved;
  final List<Title> titles;
  final String title;
  final String? titleEnglish;
  final String? titleJapanese;
  final List<String>? titleSynonyms;
  final String? type;
  final String? source;
  final int? episodes;
  final String? status;
  final bool? airing;
  final Aired? aired;
  final String? duration;
  final String? rating;
  final double? score;
  final int? scoredBy;
  final int? rank;
  final int? popularity;
  final int? members;
  final int? favorites;
  final String? synopsis;
  final String? background;
  final String? season;
  final int? year;
  final Broadcast? broadcast;
  final List<Demographic>? producers;
  final List<Demographic>? licensors;
  final List<Demographic>? studios;
  final List<Demographic>? genres;
  final List<Demographic>? explicitGenres;
  final List<Demographic>? themes;
  final List<Demographic>? demographics;
  final List<Relation>? relations;
  final Theme? theme;
  final List<External>? animeModelExternal;
  final List<External>? streaming;

  factory AnimeModel.fromJson(Map<String, dynamic> json) => AnimeModel(
        malId: json["mal_id"],
        url: json["url"],
        jpgImage: json["images"] == null
            ? null
            : json["images"]["jpg"] == null
                ? null
                : JpgImage.fromJson(json["images"]["jpg"]),
        trailer:
            json["trailer"] == null ? null : Trailer.fromJson(json["trailer"]),
        approved: json["approved"],
        titles: json["titles"] == null
            ? []
            : List<Title>.from(json["titles"].map((x) => Title.fromJson(x))),
        title: json["title"],
        titleEnglish: json["title_english"],
        titleJapanese: json["title_japanese"],
        titleSynonyms: json["title_synonyms"] == null
            ? null
            : List<String>.from(json["title_synonyms"].map((x) => x)),
        type: json["type"],
        source: json["source"],
        episodes: json["episodes"],
        status: json["status"],
        airing: json["airing"],
        aired: json["aired"] == null ? null : Aired.fromJson(json["aired"]),
        duration: json["duration"],
        rating: json["rating"],
        score: json["score"],
        scoredBy: json["scored_by"],
        rank: json["rank"],
        popularity: json["popularity"],
        members: json["members"],
        favorites: json["favorites"],
        synopsis: json["synopsis"],
        background: json["background"],
        season: json["season"],
        year: json["year"],
        broadcast: json["broadcast"] == null
            ? null
            : Broadcast.fromJson(json["broadcast"]),
        producers: json["producers"] == null
            ? null
            : List<Demographic>.from(
                json["producers"].map((x) => Demographic.fromJson(x))),
        licensors: json["licensors"] == null
            ? null
            : List<Demographic>.from(
                json["licensors"].map((x) => Demographic.fromJson(x))),
        studios: json["studios"] == null
            ? null
            : List<Demographic>.from(
                json["studios"].map((x) => Demographic.fromJson(x))),
        genres: json["genres"] == null
            ? null
            : List<Demographic>.from(
                json["genres"].map((x) => Demographic.fromJson(x))),
        explicitGenres: json["explicit_genres"] == null
            ? null
            : List<Demographic>.from(
                json["explicit_genres"].map((x) => Demographic.fromJson(x))),
        themes: json["themes"] == null
            ? null
            : List<Demographic>.from(
                json["themes"].map((x) => Demographic.fromJson(x))),
        demographics: json["demographics"] == null
            ? null
            : List<Demographic>.from(
                json["demographics"].map((x) => Demographic.fromJson(x))),
        relations: json["relations"] == null
            ? null
            : List<Relation>.from(
                json["relations"].map((x) => Relation.fromJson(x))),
        theme: json["theme"] == null ? null : Theme.fromJson(json["theme"]),
        animeModelExternal: json["external"] == null
            ? null
            : List<External>.from(
                json["external"].map((x) => External.fromJson(x))),
        streaming: json["streaming"] == null
            ? null
            : List<External>.from(
                json["streaming"].map((x) => External.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "mal_id": malId,
        "url": url,
        "images": jpgImage?.toJson(),
        "trailer": trailer?.toJson(),
        "approved": approved,
        "titles": List<dynamic>.from(titles.map((x) => x.toJson())),
        "title": title,
        "title_english": titleEnglish,
        "title_japanese": titleJapanese,
        "title_synonyms": List<dynamic>.from(titleSynonyms ?? [].map((x) => x)),
        "type": type,
        "source": source,
        "episodes": episodes,
        "status": status,
        "airing": airing,
        "aired": aired?.toJson(),
        "duration": duration,
        "rating": rating,
        "score": score,
        "scored_by": scoredBy,
        "rank": rank,
        "popularity": popularity,
        "members": members,
        "favorites": favorites,
        "synopsis": synopsis,
        "background": background,
        "season": season,
        "year": year,
        "broadcast": broadcast?.toJson(),
        "producers": List<dynamic>.from(producers ?? [].map((x) => x.toJson())),
        "licensors": List<dynamic>.from(licensors ?? [].map((x) => x.toJson())),
        "studios": List<dynamic>.from(studios ?? [].map((x) => x.toJson())),
        "genres": List<dynamic>.from(genres ?? [].map((x) => x.toJson())),
        "explicit_genres":
            List<dynamic>.from(explicitGenres ?? [].map((x) => x.toJson())),
        "themes": List<dynamic>.from(themes ?? [].map((x) => x.toJson())),
        "demographics":
            List<dynamic>.from(demographics ?? [].map((x) => x.toJson())),
        "relations": List<dynamic>.from(relations ?? [].map((x) => x.toJson())),
        "theme": theme?.toJson(),
        "external":
            List<dynamic>.from(animeModelExternal ?? [].map((x) => x.toJson())),
        "streaming": List<dynamic>.from(streaming ?? [].map((x) => x.toJson())),
      };
}

class Aired {
  Aired({
    this.from,
    this.to,
    this.prop,
  });

  String? from;
  String? to;
  Prop? prop;

  factory Aired.fromJson(Map<String, dynamic> json) => Aired(
        from: json["from"],
        to: json["to"],
        prop: Prop.fromJson(json["prop"]),
      );

  Map<String, dynamic> toJson() => {
        "from": from,
        "to": to,
        "prop": prop?.toJson(),
      };
}

class Prop {
  Prop({
    required this.from,
    required this.to,
    required this.string,
  });

  From from;
  From to;
  String? string;

  factory Prop.fromJson(Map<String, dynamic> json) => Prop(
        from: From.fromJson(json["from"]),
        to: From.fromJson(json["to"]),
        string: json["string"],
      );

  Map<String, dynamic> toJson() => {
        "from": from.toJson(),
        "to": to.toJson(),
        "string": string,
      };
}

class From {
  From({
    this.day,
    this.month,
    this.year,
  });

  int? day;
  int? month;
  int? year;

  factory From.fromJson(Map<String, dynamic> json) => From(
        day: json["day"],
        month: json["month"],
        year: json["year"],
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "month": month,
        "year": year,
      };
}

class External {
  External({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory External.fromJson(Map<String, dynamic> json) => External(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class Broadcast {
  Broadcast({
    required this.day,
    required this.time,
    required this.timezone,
    required this.string,
  });

  String? day;
  String? time;
  String? timezone;
  String? string;

  factory Broadcast.fromJson(Map<String, dynamic> json) => Broadcast(
        day: json["day"],
        time: json["time"],
        timezone: json["timezone"],
        string: json["string"],
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "time": time,
        "timezone": timezone,
        "string": string,
      };
}

class Demographic {
  Demographic({
    required this.malId,
    required this.type,
    required this.name,
    required this.url,
  });

  int malId;
  String type;
  String name;
  String url;

  factory Demographic.fromJson(Map<String, dynamic> json) => Demographic(
        malId: json["mal_id"],
        type: json["type"],
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "mal_id": malId,
        "type": type,
        "name": name,
        "url": url,
      };
}

class JpgImage {
  JpgImage({
    required this.imageUrl,
    required this.smallImageUrl,
    required this.largeImageUrl,
  });

  String imageUrl;
  String smallImageUrl;
  String largeImageUrl;

  factory JpgImage.fromJson(Map<String, dynamic> json) => JpgImage(
        imageUrl: json["image_url"],
        smallImageUrl: json["small_image_url"],
        largeImageUrl: json["large_image_url"],
      );

  Map<String, dynamic> toJson() => {
        "image_url": imageUrl,
        "small_image_url": smallImageUrl,
        "large_image_url": largeImageUrl,
      };
}

class Relation {
  Relation({
    required this.relation,
    required this.entry,
  });

  String relation;
  List<Demographic> entry;

  factory Relation.fromJson(Map<String, dynamic> json) => Relation(
        relation: json["relation"],
        entry: List<Demographic>.from(
            json["entry"].map((x) => Demographic.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "relation": relation,
        "entry": List<dynamic>.from(entry.map((x) => x.toJson())),
      };
}

class Theme {
  Theme({
    required this.openings,
    required this.endings,
  });

  List<String> openings;
  List<String> endings;

  factory Theme.fromJson(Map<String, dynamic> json) => Theme(
        openings: List<String>.from(json["openings"].map((x) => x)),
        endings: List<String>.from(json["endings"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "openings": List<dynamic>.from(openings.map((x) => x)),
        "endings": List<dynamic>.from(endings.map((x) => x)),
      };
}

class Title {
  Title({
    required this.type,
    required this.title,
  });

  String type;
  String title;

  factory Title.fromJson(Map<String, dynamic> json) => Title(
        type: json["type"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "title": title,
      };
}

class Trailer {
  Trailer({
    this.youtubeId,
    required this.url,
    required this.embedUrl,
  });

  String? youtubeId;
  String? url;
  String? embedUrl;

  factory Trailer.fromJson(Map<String, dynamic> json) => Trailer(
        youtubeId: json["youtube_id"],
        url: json["url"],
        embedUrl: json["embed_url"],
      );

  Map<String, dynamic> toJson() => {
        "youtube_id": youtubeId,
        "url": url,
        "embed_url": embedUrl,
      };
}
