import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breaking_bad_api_flutter/domain/domain.dart';

class EpisodeBloc extends Bloc<EpisodeEvent, EpisodeState> {
  EpisodeOriginalData _episodeOriginalData;
  bool _shouldRefreshFavouriteEpisodes;
  bool get shouldRefreshFavouriteEpisodes => _shouldRefreshFavouriteEpisodes;

  EpisodeBloc(EpisodesTransferDto episodesTransferDto)
      : _shouldRefreshFavouriteEpisodes = false,
        _episodeOriginalData =
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
    if (event is EpisodeAddOrRemoveFromFavourites) {
      yield _processing();
      _shouldRefreshFavouriteEpisodes = !_shouldRefreshFavouriteEpisodes;
      final int episodeId = _episodeOriginalData.episode.id;
      final bool isSavedInFavourites =
          await Episode.checkIfEpisodeInFavourites(episodeId);
      isSavedInFavourites
          ? await Episode.removeEpisodeFromFavourites(episodeId)
          : await Episode.addEpisodeToFavourites(episodeId);
      _episodeOriginalData = EpisodeOriginalData(
        episode: _episodeOriginalData.episode,
        isAddedToFavourites: !isSavedInFavourites,
      );
      yield isSavedInFavourites
          ? _removedFromFavouritesEpisode()
          : _addedToFavouritesEpisode();
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
