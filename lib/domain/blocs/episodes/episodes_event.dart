class EpisodesEvent {
  const EpisodesEvent();
}

class EpisodesChooseEpisode extends EpisodesEvent {
  final int episodeId;

  const EpisodesChooseEpisode({
    required this.episodeId,
  });
}
