import 'package:equatable/equatable.dart';

import 'data.dart';

class DeathsDisplayedData extends Equatable {
  final List<DeathToDisplay> deathsToDisplay;

  const DeathsDisplayedData({
    required this.deathsToDisplay,
  });

  @override
  List<Object?> get props => [deathsToDisplay];
}
