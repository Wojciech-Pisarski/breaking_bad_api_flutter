import 'package:equatable/equatable.dart';

class EpisodeToDisplay extends Equatable {
  final int id;
  final String label;

  const EpisodeToDisplay({
    required this.id,
    required this.label,
  });

  @override
  List<Object?> get props => [
        id,
        label,
      ];
}
