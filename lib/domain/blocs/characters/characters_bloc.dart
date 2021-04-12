import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breaking_bad_api_flutter/domain/domain.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  late final CharactersOriginalData _charactersOriginalData;

  CharactersBloc() : super(CharactersInitial());

  @override
  Stream<CharactersState> mapEventToState(CharactersEvent event) async* {
    if (event is CharactersRefreshCharacters) {
      yield _initial();
      var charactersData = await Character.getAllCharactersData();
      _charactersOriginalData = CharactersOriginalData(
        characters: Character.getCharactersFromCharactersData(charactersData),
      );
      yield _initialFinished();
    } else if (event is CharactersChooseCharacter) {
      yield _chosenCharacter();
      _charactersOriginalData.character = _charactersOriginalData.characters
          .firstWhere((element) => element.id == event.characterId);
      yield _loadedCharacter();
    }
  }

  CharactersInitial _initial() => CharactersInitial();

  CharactersInitialFinished _initialFinished() => CharactersInitialFinished(
        charactersDisplayedData:
            _charactersOriginalData.convertToDisplayedData(),
      );

  CharactersChosenCharacter _chosenCharacter() => CharactersChosenCharacter(
        charactersDisplayedData:
            _charactersOriginalData.convertToDisplayedData(),
      );

  CharactersLoadedCharacter _loadedCharacter() => CharactersLoadedCharacter(
        charactersTransferDto: CharactersTransferDto(
          characters: _charactersOriginalData.characters,
        ),
        charactersDisplayedData:
            _charactersOriginalData.convertToDisplayedData(),
      );
}
