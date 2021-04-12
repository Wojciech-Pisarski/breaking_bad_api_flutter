import 'data/data.dart';

class EpisodesState {
  final EpisodesDisplayedData episodesDisplayedData;

  const EpisodesState({
    required this.episodesDisplayedData,
  });
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

class EpisodesLoadedEpisode extends EpisodesState {
  final EpisodesTransferDto episodesTransferDto;

  const EpisodesLoadedEpisode({
    required this.episodesTransferDto,
    required EpisodesDisplayedData episodesDisplayedData,
  }) : super(
          episodesDisplayedData: episodesDisplayedData,
        );
}
