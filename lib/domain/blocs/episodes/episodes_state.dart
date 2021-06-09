import 'package:equatable/equatable.dart';

import 'data/data.dart';

abstract class EpisodesState extends Equatable {
  final EpisodesDisplayedData episodesDisplayedData;

  const EpisodesState({
    required this.episodesDisplayedData,
  });

  @override
  List<Object?> get props => [episodesDisplayedData];
}

class EpisodesInitial extends EpisodesState {
  const EpisodesInitial({
    required EpisodesDisplayedData episodesDisplayedData,
  }) : super(
          episodesDisplayedData: episodesDisplayedData,
        );
}

class EpisodesChosenEpisode extends EpisodesState {
  const EpisodesChosenEpisode({
    required EpisodesDisplayedData episodesDisplayedData,
  }) : super(
          episodesDisplayedData: episodesDisplayedData,
        );
}

class EpisodesProcessing extends EpisodesState {
  const EpisodesProcessing({
    required EpisodesDisplayedData episodesDisplayedData,
  }) : super(
          episodesDisplayedData: episodesDisplayedData,
        );
}

class EpisodesFinishedProcessing extends EpisodesState {
  const EpisodesFinishedProcessing({
    required EpisodesDisplayedData episodesDisplayedData,
  }) : super(
          episodesDisplayedData: episodesDisplayedData,
        );
}

class EpisodesLoadedEpisode extends EpisodesState {
  final EpisodesTransferDto episodesTransferDto;

  const EpisodesLoadedEpisode({
    required this.episodesTransferDto,
    required EpisodesDisplayedData episodesDisplayedData,
  }) : super(
          episodesDisplayedData: episodesDisplayedData,
        );
}
