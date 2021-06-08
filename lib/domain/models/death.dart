import 'package:breaking_bad_api_flutter/domain/domain.dart';
import 'package:equatable/equatable.dart';

class Death extends Equatable {
  final int id;
  final String death;
  final String cause;
  final String responsible;
  final String lastWords;
  final int season;
  final int episode;
  final int numberOfDeaths;
  static const String _WEB_POSTFIX = '/death';

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

  factory Death._fromJson(Map<String, dynamic> json) => Death(
        id: json['death_id'],
        death: json['death'],
        cause: json['cause'],
        responsible: json['responsible'],
        lastWords: json['last_words'],
        season: json['season'],
        episode: json['episode'],
        numberOfDeaths: json['number_of_deaths'],
      );

  static Future<List<Map<String, dynamic>>> getAllDeathsData() async {
    var deathsData;
    try {
      deathsData = await WebUtility.getCollectionOfData(_WEB_POSTFIX);
    } catch (exception) {
      throw 'Error occurred\n$exception';
    }
    return deathsData;
  }

  static List<Death> getDeathsFromDeathsData(
      List<Map<String, dynamic>> deathsData) {
    final List<Death> deaths = [];
    deathsData.forEach((element) => deaths.add(Death._fromJson(element)));
    return deaths;
  }

  @override
  List<Object?> get props => [
        id,
        death,
        cause,
        responsible,
        lastWords,
        season,
        episode,
        numberOfDeaths,
      ];
}
