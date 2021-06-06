import 'package:breaking_bad_api_flutter/domain/models/models.dart';
import 'data.dart';

class DeathsOriginalData {
  final List<Death> deaths;
  late Death death;

  DeathsOriginalData({
    required this.deaths,
  });

  DeathsOriginalData.fromSeasons({
    required this.deaths,
  });

  DeathsDisplayedData convertToDisplayedData() => DeathsDisplayedData(
        deathsToDisplay: deaths.map(convertDeathToDisplayedDeath).toList(),
      );

  DeathToDisplay convertDeathToDisplayedDeath(Death death) => DeathToDisplay(
        id: death.id,
        death: death.death,
        cause: death.cause,
        responsible: death.responsible,
        lastWords: death.lastWords,
        season: death.season.toString(),
        episode: death.episode.toString(),
        numberOfDeaths: death.numberOfDeaths.toString(),
      );
}
