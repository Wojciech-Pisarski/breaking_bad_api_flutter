import 'package:equatable/equatable.dart';

class DeathToDisplay extends Equatable {
  final int id;
  final String death;
  final String cause;
  final String responsible;
  final String lastWords;
  final String season;
  final String episode;
  final String numberOfDeaths;

  const DeathToDisplay({
    required this.id,
    required this.death,
    required this.cause,
    required this.responsible,
    required this.lastWords,
    required this.season,
    required this.episode,
    required this.numberOfDeaths,
  });

  @override
  List<Object?> get props => [
        id,
        death,
        cause,
        responsible,
        lastWords,
        season,
        episode,
        numberOfDeaths,
      ];
}
