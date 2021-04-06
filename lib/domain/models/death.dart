import 'package:breaking_bad_api_flutter/domain/domain.dart';

class Death {
  final int id;
  final String death;
  final String cause;
  final String responsible;
  final String lastWords;
  final int season;
  final int episode;
  final int numberOfDeaths;

  const Death({
    required this.id,
    required this.death,
    required this.cause,
    required this.responsible,
    required this.lastWords,
    required this.season,
    required this.episode,
    required this.numberOfDeaths,
  });

  factory Death.fromJson(Map<String, dynamic> json) => Death(
        id: json['death_id'],
        death: json['death'],
        cause: json['cause'],
        responsible: json['responsible'],
        lastWords: json['last_words'],
        season: json['season'],
        episode: json['episode'],
        numberOfDeaths: json['number_of_deaths'],
      );

  static Future<Death> getDeathForNameAndSurname(
          String name, String surname) async =>
      await WebUtility.getDeathForNameAndSurname(name, surname);

  static Future<List<Death>> getAllDeaths() async =>
      await WebUtility.getAllDeaths();
}
