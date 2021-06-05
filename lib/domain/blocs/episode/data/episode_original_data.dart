import 'package:breaking_bad_api_flutter/domain/blocs/blocs.dart';
import 'package:breaking_bad_api_flutter/domain/models/models.dart';
import 'package:breaking_bad_api_flutter/ui/strings/strings.dart';

class EpisodeOriginalData {
  final Episode episode;
  final bool isAddedToFavourites;

  EpisodeOriginalData({
    required this.episode,
    required this.isAddedToFavourites,
  });

  EpisodeOriginalData.fromEpisodesTransferDto(
    EpisodesTransferDto episodesTransferDto,
  )   : episode = episodesTransferDto.episode,
        isAddedToFavourites = episodesTransferDto.isAddedToFavourites;

  EpisodeDisplayedData convertToDisplayedData() => EpisodeDisplayedData(
        episodeDetailsToDisplay: episode
            ._convertEpisodeToDisplayedEpisodeDetails(isAddedToFavourites),
      );
}

extension on Episode {
  EpisodeDetailsToDisplay _convertEpisodeToDisplayedEpisodeDetails(
          bool isAddedToFavourites) =>
      EpisodeDetailsToDisplay(
        name: this.title,
        season: this.season,
        episode: this.episode,
        airDate: this.airDate,
        characters: this.characters,
        favouritesButtonLabel: isAddedToFavourites == true
            ? AppLabels.AddToFavourites
            : AppLabels.RemoveFromFavourites,
      );
}
