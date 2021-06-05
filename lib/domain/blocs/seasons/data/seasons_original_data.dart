import 'package:breaking_bad_api_flutter/domain/models/models.dart';
import 'package:breaking_bad_api_flutter/ui/strings/strings.dart';
import 'data.dart';

class SeasonsOriginalData {
  final List<Season> seasons;
  late List<Episode> episodes;

  SeasonsOriginalData({
    required this.seasons,
  });

  SeasonsOriginalData.fromSeasons({
    required this.seasons,
  });

  SeasonsDisplayedData convertToDisplayedData() => SeasonsDisplayedData(
        seasonsToDisplay: seasons.map(_convertSeasonToDisplayedSeason).toList(),
      );

  SeasonToDisplay _convertSeasonToDisplayedSeason(Season season) =>
      SeasonToDisplay(
        id: season.number,
        label: '${AppLabels.Season} ${season.number}',
      );
}
