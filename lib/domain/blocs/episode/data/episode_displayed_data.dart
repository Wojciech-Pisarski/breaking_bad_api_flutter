import 'package:flutter/cupertino.dart';

import 'data.dart';

class EpisodeDisplayedData {
  final String name;
  final String season;
  final String episode;
  final String airDate;
  final String characters;
  final String favouritesButtonLabel;

  const EpisodeDisplayedData({
    required this.name,
    required this.season,
    required this.episode,
    required this.airDate,
    required this.characters,
    required this.favouritesButtonLabel,
  });
}
