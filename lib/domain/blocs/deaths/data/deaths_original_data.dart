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
        deathsToDisplay:
            deaths.map(_convertDeathToDisplayedDeath).toList(),
      );

  DeathToDisplay _convertDeathToDisplayedDeath(
          Death death) =>
      DeathToDisplay(
        id: death.id,
        label: '${death.death}',
      );
}
