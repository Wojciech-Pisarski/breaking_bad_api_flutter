import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breaking_bad_api_flutter/domain/domain.dart';

class SeasonsBloc extends Bloc<SeasonsEvent, SeasonsState> {
  final SeasonsOriginalData _seasonsOriginalData;

  SeasonsBloc()
      : _seasonsOriginalData = SeasonsOriginalData.fromSeasons(
          seasons: Season.allSeasons,
        ),
        super(_emitInitialState());

  static SeasonsInitial _emitInitialState() => SeasonsInitial(
        seasonsDisplayedData: SeasonsOriginalData.fromSeasons(
          seasons: Season.allSeasons,
        ).convertToDisplayedData(),
      );

  @override
  Stream<SeasonsState> mapEventToState(SeasonsEvent event) async* {
    if (event is SeasonsChooseSeason) {
      yield _chosenSeason();
      _seasonsOriginalData.episodes =
          await Episode.getEpisodesFromEpisodesData(event.seasonNumber);
      yield _loadedEpisodes();
    }
  }

  SeasonsChosenSeason _chosenSeason() => SeasonsChosenSeason(
        seasonsDisplayedData: _seasonsOriginalData.convertToDisplayedData(),
      );

  SeasonsLoadedEpisodes _loadedEpisodes() => SeasonsLoadedEpisodes(
        seasonsTransferDto: SeasonsTransferDto(
          episodes: _seasonsOriginalData.episodes,
        ),
        seasonsDisplayedData: _seasonsOriginalData.convertToDisplayedData(),
      );
}
