import 'data/data.dart';

abstract class SeasonsState {
  final SeasonsDisplayedData seasonsDisplayedData;

  const SeasonsState({
    required this.seasonsDisplayedData,
  });
}

class SeasonsInitial extends SeasonsState {
  const SeasonsInitial({
    required SeasonsDisplayedData seasonsDisplayedData,
  }) : super(
          seasonsDisplayedData: seasonsDisplayedData,
        );
}

class SeasonsChosenSeason extends SeasonsState {
  const SeasonsChosenSeason({
    required SeasonsDisplayedData seasonsDisplayedData,
  }) : super(
          seasonsDisplayedData: seasonsDisplayedData,
        );
}

class SeasonsLoadedEpisodes extends SeasonsState {
  final SeasonsTransferDto seasonsTransferDto;

  const SeasonsLoadedEpisodes({
    required this.seasonsTransferDto,
    required SeasonsDisplayedData seasonsDisplayedData,
  }) : super(
          seasonsDisplayedData: seasonsDisplayedData,
        );
}
