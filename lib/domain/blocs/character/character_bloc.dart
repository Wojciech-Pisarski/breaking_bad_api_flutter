import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breaking_bad_api_flutter/domain/domain.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  CharacterOriginalData _characterOriginalData;
  bool _shouldRefreshFavouriteEpisodes;
  bool get shouldRefreshFavouriteEpisodes => _shouldRefreshFavouriteEpisodes;

  CharacterBloc(CharactersTransferDto charactersTransferDto)
      : _shouldRefreshFavouriteEpisodes = false,
        _characterOriginalData =
            CharacterOriginalData.fromCharactersTransferDto(
                charactersTransferDto),
        super(_emitInitialState(charactersTransferDto));

  static CharacterInitial _emitInitialState(
          CharactersTransferDto charactersTransferDto) =>
      CharacterInitial(
        characterDisplayedData: CharacterOriginalData.fromCharactersTransferDto(
                charactersTransferDto)
            .convertToDisplayedData(),
      );

  @override
  Stream<CharacterState> mapEventToState(CharacterEvent event) async* {
    if (event is CharacterAddOrRemoveFromFavourites) {
      yield _processing();
      _shouldRefreshFavouriteEpisodes = !_shouldRefreshFavouriteEpisodes;
      final int characterId = _characterOriginalData.character.id;
      final bool isSavedInFavourites =
          await Character.checkIfCharacterInFavourites(characterId);
      isSavedInFavourites
          ? await Character.removeCharacterFromFavourites(characterId)
          : await Character.addCharacterToFavourites(characterId);
      _characterOriginalData = CharacterOriginalData(
        character: _characterOriginalData.character,
        isAddedToFavourites: !isSavedInFavourites,
      );
      yield isSavedInFavourites
          ? _removedFromFavouritesEpisode()
          : _addedToFavouritesEpisode();
    }
  }

  CharacterProcessing _processing() => CharacterProcessing(
      characterDisplayedData: _characterOriginalData.convertToDisplayedData());

  CharacterAddedToFavourites _addedToFavouritesEpisode() =>
      CharacterAddedToFavourites(
        characterDisplayedData: _characterOriginalData.convertToDisplayedData(),
      );

  CharacterRemovedFromFavourites _removedFromFavouritesEpisode() =>
      CharacterRemovedFromFavourites(
        characterDisplayedData: _characterOriginalData.convertToDisplayedData(),
      );
}
