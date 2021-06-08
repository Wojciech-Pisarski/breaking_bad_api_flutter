import 'package:breaking_bad_api_flutter/domain/blocs/blocs.dart';
import 'package:breaking_bad_api_flutter/domain/models/death.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("DeathsOriginalData tests", () {
    late int id;
    late int season;
    late int episode;
    late int numberOfDeaths;
    late String cause;
    late String name;
    late String lastWords;
    late String responsible;
    late Death death;
    late DeathToDisplay deathToDisplay;
    late DeathsDisplayedData deathsDisplayedData;
    late DeathsOriginalData deathsOriginalData;

    setUp(() {
      id = -1;
      season = 0;
      episode = 0;
      numberOfDeaths = 0;
      cause = "";
      name = "";
      lastWords = "";
      responsible = "";
      death = Death(
        id: id,
        season: season,
        episode: episode,
        numberOfDeaths: numberOfDeaths,
        cause: cause,
        death: name,
        lastWords: lastWords,
        responsible: responsible,
      );
      deathToDisplay = DeathToDisplay(
        id: id,
        death: name,
        cause: cause,
        responsible: responsible,
        lastWords: lastWords,
        season: season.toString(),
        episode: episode.toString(),
        numberOfDeaths: numberOfDeaths.toString(),
      );
      deathsDisplayedData = DeathsDisplayedData(
        deathsToDisplay: [deathToDisplay],
      );
      deathsOriginalData = DeathsOriginalData(
        deaths: [death],
      );
    });

    test("Convert mock deaths to DeathsDisplayedData", () {
      DeathsDisplayedData deathsDisplayedDataTest =
          deathsOriginalData.convertToDisplayedData();
      expect(deathsDisplayedData, deathsDisplayedDataTest);
    });

    test("Convert a given mock death to DeathToDisplay", () {
      DeathToDisplay deathToDisplayTest =
          deathsOriginalData.convertDeathToDisplayedDeath(death);
      expect(deathToDisplay, deathToDisplayTest);
    });
  });
}
