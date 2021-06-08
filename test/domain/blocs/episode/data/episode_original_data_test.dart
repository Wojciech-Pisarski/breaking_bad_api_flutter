import 'package:breaking_bad_api_flutter/domain/blocs/blocs.dart';
import 'package:breaking_bad_api_flutter/domain/models/models.dart';
import 'package:breaking_bad_api_flutter/ui/strings/strings.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("EpisodeOriginalData tests", () {
    late int id;
    late int season;
    late int episodeNumber;
    late bool isAddedToFavourites;
    late String airDate;
    late String title;
    late String favouritesButtonLabel;
    late Episode episode;
    late EpisodesTransferDto episodesTransferDto;
    late EpisodeDisplayedData episodeDisplayedData;
    late EpisodeOriginalData episodeOriginalData;

    setUp(() {
      id = -1;
      season = 0;
      episodeNumber = 1;
      isAddedToFavourites = false;
      airDate = "";
      title = "";
      favouritesButtonLabel = isAddedToFavourites == false
          ? AppLabels.AddToFavourites
          : AppLabels.RemoveFromFavourites;
      episode = Episode(
        id: id,
        airDate: airDate,
        characters: <String>[],
        series: season.toString(),
        season: season.toString(),
        episode: episodeNumber.toString(),
        title: title,
      );
      episodesTransferDto = EpisodesTransferDto(
        episode: episode,
        isAddedToFavourites: isAddedToFavourites,
      );
      episodeDisplayedData = EpisodeDisplayedData(
        name: title,
        season: season.toString(),
        episode: episodeNumber.toString(),
        airDate: airDate,
        characters: "",
        favouritesButtonLabel: favouritesButtonLabel,
      );
      episodeOriginalData = EpisodeOriginalData(
        episode: episode,
        isAddedToFavourites: isAddedToFavourites,
      );
    });

    test("Convert mock EpisodeOriginalData to EpisodeDisplayedData", () {
      EpisodeDisplayedData episodeDisplayedDataTest =
          episodeOriginalData.convertToDisplayedData();
      expect(episodeDisplayedData, episodeDisplayedDataTest);
    });

    test("Convert a given mock episodesTransferDto to EpisodeOriginalData", () {
      EpisodeOriginalData episodeOriginalDataTest =
          EpisodeOriginalData.fromEpisodesTransferDto(episodesTransferDto);
      expect(episodeOriginalData, episodeOriginalDataTest);
    });
  });
}
