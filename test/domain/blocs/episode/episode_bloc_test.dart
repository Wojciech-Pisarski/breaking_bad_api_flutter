import 'package:breaking_bad_api_flutter/domain/blocs/blocs.dart';
import 'package:breaking_bad_api_flutter/domain/models/episode.dart';
import 'package:breaking_bad_api_flutter/ui/strings/strings.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('EpisodeBloc tests', () {
    late int id;
    late int season;
    late int episodeNumber;
    late String airDate;
    late String title;
    late bool isAddedToFavourites;
    late String favouritesButtonLabel;
    late EpisodesTransferDto episodesTransferDto;
    late EpisodeBloc episodeBloc;
    late Episode episode;
    late EpisodeDisplayedData episodeDisplayedData;

    setUp(() {
      id = -1;
      season = 0;
      episodeNumber = 1;
      airDate = "";
      title = "";
      isAddedToFavourites = false;
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
      episodeDisplayedData = EpisodeDisplayedData(
        name: title,
        season: season.toString(),
        episode: episodeNumber.toString(),
        airDate: airDate,
        characters: "",
        favouritesButtonLabel: favouritesButtonLabel,
      );
      episodesTransferDto = EpisodesTransferDto(
        episode: episode,
        isAddedToFavourites: isAddedToFavourites,
      );
      episodeBloc = EpisodeBloc(episodesTransferDto);
    });

    test(
        'initial state is EpisodeInitial',
        () => expect(episodeBloc.state,
            EpisodeInitial(episodeDisplayedData: episodeDisplayedData)));
  });
}
