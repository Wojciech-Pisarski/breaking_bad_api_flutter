class Season {
  final int number;

  const Season({
    required this.number,
  });

  static List<Season> getAllSeasons() => [
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
