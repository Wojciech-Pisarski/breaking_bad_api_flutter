import 'package:breaking_bad_api_flutter/domain/blocs/blocs.dart';
import 'package:breaking_bad_api_flutter/domain/blocs/seasons/data/data.dart';
import 'package:breaking_bad_api_flutter/domain/models/models.dart';
import 'data.dart';

class EpisodesOriginalData {
  final List<Episode> episodes;
  late Episode episode;

  EpisodesOriginalData({
    required this.episodes,
  });

  EpisodesOriginalData.fromSeasonsTransferDto(
    SeasonsTransferDto seasonsTransferDto,
  ) : episodes = seasonsTransferDto.episodes;

  EpisodesOriginalData.fromFavouritesTransferDto(
    FavouritesTransferDto favouritesTransferDto,
  ) : episodes = favouritesTransferDto.episodes!;

  EpisodesDisplayedData convertToDisplayedData() => EpisodesDisplayedData(
        episodesToDisplay:
            episodes.map(_convertEpisodeToDisplayedEpisode).toList(),
      );

  EpisodeToDisplay _convertEpisodeToDisplayedEpisode(Episode episode) =>
      EpisodeToDisplay(
        id: episode.id,
        label: episode.title,
      );
}
