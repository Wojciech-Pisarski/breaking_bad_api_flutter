import 'package:breaking_bad_api_flutter/domain/domain.dart';

class Episode {
  final int id;
  final String title;
  final String season;
  final String episode;
  final String airDate;
  final List<String> characters;
  final String series;

  const Episode({
    required this.id,
    required this.title,
    required this.season,
    required this.episode,
    required this.airDate,
    required this.characters,
    required this.series,
  });

  factory Episode.fromJson(Map<String, dynamic> json) => Episode(
        id: json['episode_id'],
        title: json['title'],
        season: json['season'],
        episode: json['episode'],
        airDate: json['air_date'],
        characters: List<String>.from(json['characters']),
        series: json['series'],
      );

  static Future<Episode> getEpisodeById(int episodeId) async =>
      await WebUtility.getEpisodeById(episodeId);

  static Future<List<Episode>> getAllEpisodesForSeasonNumber(
      int seasonNumber) async {
    if (seasonNumber >= Season.firstSeason &&
        seasonNumber <= Season.lastSeason) {
      return await WebUtility.getAllEpisodesForSeasonNumber(seasonNumber);
    } else {
      throw 'Incorrent season number provided: $seasonNumber';
    }
  }
}
