import 'package:breaking_bad_api_flutter/domain/blocs/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breaking_bad_api_flutter/domain/domain.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  late CharactersOriginalData _charactersOriginalData;
  bool _showOnlyFavourites;

  CharactersBloc({
    FavouritesTransferDto? favouritesTransferDto,
  })  : _showOnlyFavourites = favouritesTransferDto != null,
        _charactersOriginalData =
            CharactersOriginalData.fromFavouritesTransferDto(
                favouritesTransferDto),
        super(_emitInitialState(favouritesTransferDto));

  static CharactersState _emitInitialState(
          FavouritesTransferDto? favouritesTransferDto) =>
      favouritesTransferDto != null
          ? CharactersInitialFromFavouritesDto(
              charactersDisplayedData:
                  CharactersOriginalData.fromFavouritesTransferDto(
                          favouritesTransferDto)
                      .convertToDisplayedData())
          : CharactersInitial();

  @override
  Stream<CharactersState> mapEventToState(CharactersEvent event) async* {
    if (event is CharactersRefreshCharacters) {
      if (_showOnlyFavourites) {
        final List<int> favCharactersIds =
            await Character.getAllFavouriteCharactersIds();
        final List<Map<String, dynamic>> favCharactersData =
            await Character.getCharactersDataFromIds(favCharactersIds);
        final List<Character> favCharacters =
            Character.getCharactersFromCharactersData(favCharactersData);
        _charactersOriginalData =
            CharactersOriginalData(characters: favCharacters);
      } else {
        yield _initial();
        var charactersData = await Character.getAllCharactersData();
        _charactersOriginalData = CharactersOriginalData(
          characters: Character.getCharactersFromCharactersData(charactersData),
        );
        yield _initialFinished();
      }
    } else if (event is CharactersChooseCharacter) {
      yield _chosenCharacter();
      _charactersOriginalData.character = _charactersOriginalData.characters
          .firstWhere((element) => element.id == event.characterId);
      final bool isAddedToFavourites =
          await Character.checkIfCharacterInFavourites(event.characterId);
      yield _loadedCharacter(isAddedToFavourites);
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

  CharactersLoadedCharacter _loadedCharacter(bool isAddedToFavourites) =>
      CharactersLoadedCharacter(
        charactersTransferDto: CharactersTransferDto(
          character: _charactersOriginalData.character,
          isAddedToFavourites: isAddedToFavourites,
        ),
        charactersDisplayedData:
            _charactersOriginalData.convertToDisplayedData(),
      );
}
