// AnimeModel class represents the structure of anime data.
import 'package:flutter/material.dart';

class AnimeModel {
  final int malId; // Unique ID of the anime.
  final String title; // Title of the anime.
  final Images images;
  final String titleJapanese;
  final String type;
  final int episodes;
  final String? status;
  final String? rating;
  final double score;
  final int? scoredBy;
  final int? rank;
  final int popularity;
  final int members;
  final String? synopsis;
  final String? background;
  final String? season;
  final int? year;
  final List<Demographic>? genres;
  final List<Demographic>? studios;
  final List<Demographic>? producers;

  AnimeModel(
      {this.id,
      required this.malId,
      required this.title,
      required this.images,
      required this.titleJapanese,
      required this.type,
      required this.episodes,
      required this.status,
      required this.rating,
      required this.score,
      required this.scoredBy,
      required this.rank,
      required this.popularity,
      required this.members,
      required this.synopsis,
      required this.background,
      required this.season,
      required this.year,
      required this.genres,
      required this.producers,
      required this.studios});
  UniqueKey? id = UniqueKey();

  // Factory method to create AnimeModel object from JSON data.
  factory AnimeModel.fromJson(Map<String, dynamic> json) {
    return AnimeModel(
      malId: json['mal_id'],
      title: json['title'],
      images: Images.fromJson(json['images']),
      titleJapanese: json['title_japanese'],
      type: json['type'],
      episodes: json['episodes'],
      status: json['status'],
      rating: json['rating'],
      score: json['score'].toDouble(),
      scoredBy: json['scored_by'],
      rank: json['rank'],
      popularity: json['popularity'],
      members: json['members'],
      synopsis: json['synopsis'],
      background: json['background'],
      season: json['season'],
      year: json['year'],
      genres: List<Demographic>.from(
          json['genres'].map((x) => Demographic.fromJson(x))),
      producers: List<Demographic>.from(
          json['producers'].map((x) => Demographic.fromJson(x))),
      studios: List<Demographic>.from(
          json['studios'].map((x) => Demographic.fromJson(x))),
      // List<AnimeModel>.from(jsonDecode(response.body)['data']
      //       .map((x) => AnimeModel.fromJson(x)))
    );
  }
}

class Images {
  final Jpg jpg;
  final Map<String, dynamic> webp;

  Images({required this.jpg, required this.webp});

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      jpg: Jpg.fromJson(json['jpg']),
      webp: json['webp'],
    );
  }
}

class Jpg {
  final String imageUrl;
  final String smallImageUrl;
  final String largeImageUrl;

  Jpg(
      {required this.imageUrl,
      required this.smallImageUrl,
      required this.largeImageUrl});

  factory Jpg.fromJson(Map<String, dynamic> json) {
    return Jpg(
      imageUrl: json['image_url'],
      smallImageUrl: json['small_image_url'],
      largeImageUrl: json['large_image_url'],
    );
  }
}

class Demographic {
  int malId;
  String type;
  String name;
  String url;

  Demographic({
    required this.malId,
    required this.type,
    required this.name,
    required this.url,
  });

  factory Demographic.fromJson(Map<String, dynamic> json) {
    return Demographic(
      malId: json['mal_id'],
      type: json['type'],
      name: json['name'],
      url: json['url'],
    );
  }
}
