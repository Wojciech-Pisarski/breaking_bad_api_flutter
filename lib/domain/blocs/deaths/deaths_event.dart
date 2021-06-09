abstract class DeathsEvent {
  const DeathsEvent();
}

class DeathsRefreshDeaths extends DeathsEvent {
  const DeathsRefreshDeaths();
}

class DeathsChooseDeath extends DeathsEvent {
  final int deathId;

  const DeathsChooseDeath({
    required this.deathId,
  });
}
