import 'package:breaking_bad_api_flutter/domain/models/models.dart';
import 'data.dart';
import 'package:breaking_bad_api_flutter/domain/blocs/blocs.dart';

class CharactersOriginalData {
  final List<Character> characters;
  late Character character;

  CharactersOriginalData({
    required this.characters,
  });

  CharactersOriginalData.fromFavouritesTransferDto(
    FavouritesTransferDto? favouritesTransferDto,
  ) : characters = favouritesTransferDto?.characters ?? [];

  CharactersDisplayedData convertToDisplayedData() => CharactersDisplayedData(
        charactersToDisplay:
            characters.map(_convertCharacterToDisplayedCharacter).toList(),
      );

  CharacterToDisplay _convertCharacterToDisplayedCharacter(
          Character character) =>
      CharacterToDisplay(
        id: character.id,
        label: '${character.name}',
      );
}
