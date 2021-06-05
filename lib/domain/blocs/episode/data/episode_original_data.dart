import 'package:breaking_bad_api_flutter/domain/blocs/blocs.dart';
import 'package:breaking_bad_api_flutter/domain/models/models.dart';
import 'package:breaking_bad_api_flutter/ui/strings/strings.dart';
import 'package:breaking_bad_api_flutter/ui/ui.dart';

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
        name: episode.title,
        season: episode.season,
        episode: episode.episode,
        airDate: episode.airDate,
        characters: episode.characters.convertToString(),
        favouritesButtonLabel: isAddedToFavourites == false
            ? AppLabels.AddToFavourites
            : AppLabels.RemoveFromFavourites,
      );
}

extension on List<String> {
  String convertToString() {
    String string = "";
    this.forEach((element) => string += "\n$element");
    return string.trim();
  }
}
