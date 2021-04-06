class Season {
  final int number;
  static const int firstSeason = 1;
  static const int lastSeason = 5;

  const Season({
    required this.number,
  });

  static const List<Season> allSeasons = [
    Season(
      number: 1,
    ),
    Season(
      number: 2,
    ),
    Season(
      number: 3,
    ),
    Season(
      number: 4,
    ),
    Season(
      number: 5,
    ),
  ];
}
