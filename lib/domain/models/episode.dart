import 'package:breaking_bad_api_flutter/domain/domain.dart';
import 'package:equatable/equatable.dart';

class Episode extends Equatable {
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

  static Future<void> addEpisodeToFavourites(int episodeId) async =>
      await DatabaseUtility.addValue(
        episodeId,
        DbTables.FAVOURITE_EPISODES_TABLE,
      );

  static Future<void> removeEpisodeFromFavourites(int episodeId) async =>
      await DatabaseUtility.removeValue(
        episodeId,
        DbTables.FAVOURITE_EPISODES_TABLE,
      );

  static Future<bool> checkIfEpisodeInFavourites(int episodeId) async =>
      await DatabaseUtility.checkIfValueInFavourites(
          episodeId, DbTables.FAVOURITE_EPISODES_TABLE);

  static Future<List<int>> getAllFavouriteEpisodesIds() async =>
      await DatabaseUtility.getValues(
        DbTables.FAVOURITE_EPISODES_TABLE,
      );

  static Future<List<Map<String, dynamic>>> _getEpisodesDataForSeasonNumber(
    int seasonNumber,
  ) async {
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
    List<int> episodesIds,
  ) async {
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

  static Future<List<Episode>> getEpisodesFromSeasonNumber(
    int seasonNumber,
  ) async {
    var episodesData =
        await Episode._getEpisodesDataForSeasonNumber(seasonNumber);
    final List<Episode> episodes = [];
    for (var episode in episodesData) {
      episodes.add(Episode._fromJson(episode));
    }
    return episodes;
  }

  static getEpisodesFromEpisodesDataList(
      List<Map<String, dynamic>> episodesDataList) {
    var episodesList = <Episode>[];
    for (var episodeData in episodesDataList) {
      episodesList.add(Episode._fromJson(episodeData));
    }
    return episodesList;
  }

  @override
  List<Object?> get props => [
        id,
        title,
        season,
        episode,
        airDate,
        characters,
        series,
      ];
}
