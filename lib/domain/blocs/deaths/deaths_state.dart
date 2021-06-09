import 'package:equatable/equatable.dart';

import 'data/data.dart';

abstract class DeathsState extends Equatable {
  final DeathsDisplayedData deathsDisplayedData;

  const DeathsState({
    required this.deathsDisplayedData,
  });

  @override
  List<Object?> get props => [deathsDisplayedData];
}

class DeathsInitial extends DeathsState {
  const DeathsInitial()
      : super(
          deathsDisplayedData: const DeathsDisplayedData(
            deathsToDisplay: <DeathToDisplay>[],
          ),
        );
}

class DeathsInitialFinished extends DeathsState {
  const DeathsInitialFinished({
    required DeathsDisplayedData deathsDisplayedData,
  }) : super(
          deathsDisplayedData: deathsDisplayedData,
        );
}

class DeathsChosenDeath extends DeathsState {
  const DeathsChosenDeath({
    required DeathsDisplayedData deathsDisplayedData,
  }) : super(
          deathsDisplayedData: deathsDisplayedData,
        );
}

class DeathsLoadedDeath extends DeathsState {
  final DeathsTransferDto deathsTransferDto;
  final DeathToDisplay deathToDisplay;

  const DeathsLoadedDeath({
    required this.deathsTransferDto,
    required this.deathToDisplay,
    required DeathsDisplayedData deathsDisplayedData,
  }) : super(
          deathsDisplayedData: deathsDisplayedData,
        );
}
