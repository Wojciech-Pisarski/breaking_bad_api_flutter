import 'data/data.dart';

class EpisodeState {
  final EpisodeDisplayedData episodeDisplayedData;

  const EpisodeState({
    required this.episodeDisplayedData,
  });
}

class EpisodeProcessing extends EpisodeState {
  const EpisodeProcessing({
    required EpisodeDisplayedData episodeDisplayedData,
  }) : super(
          episodeDisplayedData: episodeDisplayedData,
        );
}

class EpisodeInitial extends EpisodeState {
  const EpisodeInitial({
    required EpisodeDisplayedData episodeDisplayedData,
  }) : super(
          episodeDisplayedData: episodeDisplayedData,
        );
}

class EpisodeAddedToFavourites extends EpisodeState {
  const EpisodeAddedToFavourites({
    required EpisodeDisplayedData episodeDisplayedData,
  }) : super(
          episodeDisplayedData: episodeDisplayedData,
        );
}

class EpisodeRemovedFromFavourites extends EpisodeState {
  const EpisodeRemovedFromFavourites({
    required EpisodeDisplayedData episodeDisplayedData,
  }) : super(
          episodeDisplayedData: episodeDisplayedData,
        );
}