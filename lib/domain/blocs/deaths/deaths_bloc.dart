import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breaking_bad_api_flutter/domain/domain.dart';

class DeathsBloc extends Bloc<DeathsEvent, DeathsState> {
  late final DeathsOriginalData _deathsOriginalData;

  DeathsBloc() : super(DeathsInitial());

  @override
  Stream<DeathsState> mapEventToState(DeathsEvent event) async* {
    if (event is DeathsRefreshDeaths) {
      yield _initial();
      var deathsData = await Death.getAllDeathsData();
      _deathsOriginalData = DeathsOriginalData(
        deaths: Death.getDeathsFromDeathsData(deathsData),
      );
      yield _initialFinished();
    } else if (event is DeathsChooseDeath) {
      yield _chosenDeath();
      _deathsOriginalData.death = _deathsOriginalData.deaths
          .firstWhere((element) => element.id == event.deathId);
      yield _loadedDeath();
    }
  }

  DeathsInitial _initial() => DeathsInitial();

  DeathsInitialFinished _initialFinished() => DeathsInitialFinished(
        deathsDisplayedData: _deathsOriginalData.convertToDisplayedData(),
      );

  DeathsChosenDeath _chosenDeath() => DeathsChosenDeath(
        deathsDisplayedData: _deathsOriginalData.convertToDisplayedData(),
      );

  DeathsLoadedDeath _loadedDeath() => DeathsLoadedDeath(
        deathsTransferDto: DeathsTransferDto(
          deathsDisplayedData: _deathsOriginalData.convertToDisplayedData(),
        ),
        deathToDisplay: _deathsOriginalData
            .convertDeathToDisplayedDeath(_deathsOriginalData.death),
        deathsDisplayedData: _deathsOriginalData.convertToDisplayedData(),
      );
}
