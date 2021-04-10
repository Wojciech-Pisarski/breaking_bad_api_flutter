import 'package:breaking_bad_api_flutter/domain/domain.dart';

class Episode {
  final int id;
  final String title;
  final String season;
  final String episode;
  final String airDate;
  final List<String> characters;
  final String series;
  static const String _WEB_POSTFIX = '/episodes';
  static const String _ID_COLUMN_NAME = 'episode_id';

  const Episode({
    required this.id,
    required this.title,
    required this.season,
    required this.episode,
    required this.airDate,
    required this.characters,
    required this.series,
  });

  factory Episode._fromJson(Map<String, dynamic> json) => Episode(
        id: json['episode_id'],
        title: json['title'],
        season: json['season'],
        episode: json['episode'],
        airDate: json['air_date'],
        characters: List<String>.from(json['characters']),
        series: json['series'],
      );

  static addEpisodeToFavourites(int episodeId) => DatabaseUtility.addValue(
        episodeId,
        DbTables.FAVOURITE_EPISODES_TABLE,
      );

  static removeEpisodeFromFavourites(int episodeId) =>
      DatabaseUtility.removeValue(
        episodeId,
        DbTables.FAVOURITE_EPISODES_TABLE,
      );

  static Future<List<int>> getAllFavouriteEpisodesIds() async =>
      await DatabaseUtility.getValues(
        DbTables.FAVOURITE_EPISODES_TABLE,
      );

  static Future<List<Map<String, dynamic>>> getEpisodesDataForSeasonNumber(
      int seasonNumber) async {
    if (seasonNumber >= Season.firstSeason &&
        seasonNumber <= Season.lastSeason) {
      var episodesData;
      try {
        episodesData = await WebUtility.getCollectionOfData(_WEB_POSTFIX);
      } catch (exception) {
        throw 'Error occurred\n$exception';
      }
      return episodesData
          .where((element) => element['season'] == seasonNumber.toString())
          .toList();
    } else {
      throw 'Wrong season number provided';
    }
  }

  static Future<List<Map<String, dynamic>>> getEpisodesDataForIds(
      List<int> episodesIds) async {
    var episodesData;
    try {
      episodesData = await WebUtility.getCollectionOfDataForIdList(
        episodesIds,
        _ID_COLUMN_NAME,
        _WEB_POSTFIX,
      );
    } catch (exception) {
      throw 'Error occurred\n$exception';
    }
    return episodesData;
  }

  static List<Episode> getEpisodesFromEpisodesData(
      List<Map<String, dynamic>> episodesData) {
    final List<Episode> episodes = [];
    episodesData.forEach((element) => episodes.add(Episode._fromJson(element)));
    return episodes;
  }
}
