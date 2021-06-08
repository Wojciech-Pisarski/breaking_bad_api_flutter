import 'package:breaking_bad_api_flutter/domain/blocs/blocs.dart';
import 'package:breaking_bad_api_flutter/domain/models/episode.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('EpisodesBlocs tests', () {
    late int id;
    late int season;
    late int episodeNumber;
    late String airDate;
    late String title;
    late Episode episode;
    late EpisodeToDisplay episodeToDisplay;
    late EpisodesDisplayedData episodesDisplayedData;
    late SeasonsTransferDto seasonsTransferDto;
    late FavouritesTransferDto favouritesTransferDto;
    late EpisodesBloc episodesBlocFromSeasonsTransferDto;
    late EpisodesBloc episodesBlocFromFavouritesTransferDto;

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
      seasonsTransferDto = SeasonsTransferDto(
        episodes: [episode],
      );
      favouritesTransferDto = FavouritesTransferDto(
        episodes: [episode],
      );
      episodesBlocFromSeasonsTransferDto =
          EpisodesBloc(seasonsTransferDto: seasonsTransferDto);
      episodesBlocFromFavouritesTransferDto =
          EpisodesBloc(favouritesTransferDto: favouritesTransferDto);
    });

    test(
        'initial state of an EpisodesBloc built using SeasonsTransferDto is EpisodeInitial',
        () => expect(episodesBlocFromSeasonsTransferDto.state,
            EpisodesInitial(episodesDisplayedData: episodesDisplayedData)));

    test(
        'initial state of an EpisodesBloc built using FavouritesTransferDto is EpisodeInitial',
        () => expect(episodesBlocFromFavouritesTransferDto.state,
            EpisodesInitial(episodesDisplayedData: episodesDisplayedData)));
  });
}
