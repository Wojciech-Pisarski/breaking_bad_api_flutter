import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breaking_bad_api_flutter/domain/domain.dart';

class EpisodeBloc extends Bloc<EpisodeEvent, EpisodeState> {
  EpisodeOriginalData _episodeOriginalData;

  EpisodeBloc(EpisodesTransferDto episodesTransferDto)
      : _episodeOriginalData =
            EpisodeOriginalData.fromEpisodesTransferDto(episodesTransferDto),
        super(_emitInitialState(episodesTransferDto));

  static EpisodeInitial _emitInitialState(
          EpisodesTransferDto episodesTransferDto) =>
      EpisodeInitial(
        episodeDisplayedData:
            EpisodeOriginalData.fromEpisodesTransferDto(episodesTransferDto)
                .convertToDisplayedData(),
      );

  @override
  Stream<EpisodeState> mapEventToState(EpisodeEvent event) async* {
    if (event is EpisodeAddToFavourites) {
      yield _processing();
      await Episode.addEpisodeToFavourites(_episodeOriginalData.episode.id);
      _episodeOriginalData = EpisodeOriginalData(
        episode: _episodeOriginalData.episode,
        isAddedToFavourites: true,
      );
      yield _addedToFavouritesEpisode();
    } else if (event is EpisodeRemoveFromFavourites) {
      yield _processing();
      await Episode.removeEpisodeFromFavourites(
          _episodeOriginalData.episode.id);
      _episodeOriginalData = EpisodeOriginalData(
        episode: _episodeOriginalData.episode,
        isAddedToFavourites: false,
      );
      yield _removedFromFavouritesEpisode();
    }
  }

  EpisodeProcessing _processing() => EpisodeProcessing(
      episodeDisplayedData: _episodeOriginalData.convertToDisplayedData());

  EpisodeAddedToFavourites _addedToFavouritesEpisode() =>
      EpisodeAddedToFavourites(
        episodeDisplayedData: _episodeOriginalData.convertToDisplayedData(),
      );

  EpisodeRemovedFromFavourites _removedFromFavouritesEpisode() =>
      EpisodeRemovedFromFavourites(
        episodeDisplayedData: _episodeOriginalData.convertToDisplayedData(),
      );
}
