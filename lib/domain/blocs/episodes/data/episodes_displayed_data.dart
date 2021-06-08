import 'package:equatable/equatable.dart';

import 'data.dart';

class EpisodesDisplayedData extends Equatable {
  final List<EpisodeToDisplay> episodesToDisplay;

  const EpisodesDisplayedData({
    required this.episodesToDisplay,
  });

  @override
  List<Object?> get props => [episodesToDisplay];
}
