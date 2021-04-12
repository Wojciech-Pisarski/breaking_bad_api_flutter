class SeasonsEvent {
  const SeasonsEvent();
}

class SeasonsChooseSeason extends SeasonsEvent {
  final int seasonNumber;

  const SeasonsChooseSeason({
    required this.seasonNumber,
  });
}
