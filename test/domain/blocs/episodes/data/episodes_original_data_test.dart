import 'package:breaking_bad_api_flutter/domain/blocs/blocs.dart';
import 'package:breaking_bad_api_flutter/domain/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("EpisodesOriginalData tests", () {
    late int id;
    late int season;
    late int episodeNumber;
    late String airDate;
    late String title;
    late Episode episode;
    late EpisodeToDisplay episodeToDisplay;
    late EpisodesDisplayedData episodesDisplayedData;
    late EpisodesOriginalData episodesOriginalData;

    setUp(() {
      id = -1;
      season = 0;
      episodeNumber = 1;
      airDate = "";
      title = "";
      episode = Episode(
        id: id,
        airDate: airDate,
        characters: <String>[],
        series: season.toString(),
        season: season.toString(),
        episode: episodeNumber.toString(),
        title: title,
      );
      episodeToDisplay = EpisodeToDisplay(
        id: id,
        label: title,
      );
      episodesDisplayedData = EpisodesDisplayedData(
        episodesToDisplay: [episodeToDisplay],
      );
      episodesOriginalData = EpisodesOriginalData(
        episodes: [episode],
      );
    });

    test("Convert mock EpisodesOriginalData to EpisodesDisplayedData", () {
      EpisodesDisplayedData episodesDisplayedDataTest =
          episodesOriginalData.convertToDisplayedData();
      expect(episodesDisplayedData, episodesDisplayedDataTest);
    });
  });
}
