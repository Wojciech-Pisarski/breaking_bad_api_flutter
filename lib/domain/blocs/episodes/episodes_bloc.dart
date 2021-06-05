import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breaking_bad_api_flutter/domain/domain.dart';

class EpisodesBloc extends Bloc<EpisodesEvent, EpisodesState> {
  EpisodesOriginalData _episodesOriginalData;
  bool _showOnlyFavourites;

  EpisodesBloc({
    SeasonsTransferDto? seasonsTransferDto,
    FavouritesTransferDto? favouritesTransferDto,
  })  : assert(seasonsTransferDto != null && favouritesTransferDto == null ||
            seasonsTransferDto == null && favouritesTransferDto != null),
        _showOnlyFavourites = favouritesTransferDto != null,
        _episodesOriginalData = seasonsTransferDto == null
            ? EpisodesOriginalData.fromFavouritesTransferDto(
                favouritesTransferDto!)
            : EpisodesOriginalData.fromSeasonsTransferDto(seasonsTransferDto),
        super(_emitInitialState(seasonsTransferDto, favouritesTransferDto));

  static EpisodesInitial _emitInitialState(
          SeasonsTransferDto? seasonsTransferDto,
          FavouritesTransferDto? favouritesTransferDto) =>
      EpisodesInitial(
        episodesDisplayedData: seasonsTransferDto == null
            ? EpisodesOriginalData.fromFavouritesTransferDto(
                    favouritesTransferDto!)
                .convertToDisplayedData()
            : EpisodesOriginalData.fromSeasonsTransferDto(seasonsTransferDto)
                .convertToDisplayedData(),
      );

  @override
  Stream<EpisodesState> mapEventToState(EpisodesEvent event) async* {
    if (event is EpisodesRefreshFavouriteEpisodes && _showOnlyFavourites) {
      final List<int> favEpisodesIds =
          await Episode.getAllFavouriteEpisodesIds();
      final List<Map<String, dynamic>> favEpisodesData =
          await Episode.getEpisodesDataForIds(favEpisodesIds);
      final List<Episode> favEpisodes =
          await Episode.getEpisodesFromEpisodesDataList(favEpisodesData);
      _episodesOriginalData = EpisodesOriginalData(episodes: favEpisodes);
    } else if (event is EpisodesChooseEpisode) {
      yield _chosenEpisode();
      _episodesOriginalData.episode = _episodesOriginalData.episodes
          .firstWhere((element) => element.id == event.episodeId);
      final bool isAddedToFavourites =
          await Episode.checkIfEpisodeInFavourites(event.episodeId);
      yield _loadedEpisode(isAddedToFavourites);
    }
  }

  EpisodesChosenEpisode _chosenEpisode() => EpisodesChosenEpisode(
        episodesDisplayedData: _episodesOriginalData.convertToDisplayedData(),
      );

  EpisodesLoadedEpisode _loadedEpisode(bool isAddedToFavourites) =>
      EpisodesLoadedEpisode(
        episodesTransferDto: EpisodesTransferDto(
          episode: _episodesOriginalData.episode,
          isAddedToFavourites: isAddedToFavourites,
        ),
        episodesDisplayedData: _episodesOriginalData.convertToDisplayedData(),
      );
}
