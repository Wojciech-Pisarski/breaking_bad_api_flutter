import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breaking_bad_api_flutter/domain/domain.dart';

class EpisodesBloc extends Bloc<EpisodesEvent, EpisodesState> {
  final EpisodesOriginalData _episodesOriginalData;

  EpisodesBloc({
    required SeasonsTransferDto seasonsTransferDto,
  })   : _episodesOriginalData =
            EpisodesOriginalData.fromSeasonsTransferDto(seasonsTransferDto),
        super(_emitInitialState(seasonsTransferDto));

  static EpisodesInitial _emitInitialState(
          SeasonsTransferDto seasonsTransferDto) =>
      EpisodesInitial(
        episodesDisplayedData:
            EpisodesOriginalData.fromSeasonsTransferDto(seasonsTransferDto)
                .convertToDisplayedData(),
      );

  @override
  Stream<EpisodesState> mapEventToState(EpisodesEvent event) async* {
    if (event is EpisodesChooseEpisode) {
      yield _chosenEpisode();
      _episodesOriginalData.episode = _episodesOriginalData.episodes
          .firstWhere((element) => element.id == event.episodeId);
      yield _loadedEpisode();
    }
  }

  EpisodesChosenEpisode _chosenEpisode() => EpisodesChosenEpisode(
        episodesDisplayedData: _episodesOriginalData.convertToDisplayedData(),
      );

  EpisodesLoadedEpisode _loadedEpisode() => EpisodesLoadedEpisode(
        episodesTransferDto: EpisodesTransferDto(
          episode: _episodesOriginalData.episode,
        ),
        episodesDisplayedData: _episodesOriginalData.convertToDisplayedData(),
      );
}
