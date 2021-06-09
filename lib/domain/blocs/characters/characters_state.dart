import 'package:breaking_bad_api_flutter/domain/blocs/blocs.dart';

import 'data/data.dart';

abstract class CharactersState {
  final CharactersDisplayedData charactersDisplayedData;

  const CharactersState({
    required this.charactersDisplayedData,
  });
}

class CharactersInitial extends CharactersState {
  const CharactersInitial()
      : super(
          charactersDisplayedData: const CharactersDisplayedData(
            charactersToDisplay: <CharacterToDisplay>[],
          ),
        );
}

class CharactersProcessing extends CharactersState {
  const CharactersProcessing({
    required CharactersDisplayedData charactersDisplayedData,
  }) : super(
          charactersDisplayedData: charactersDisplayedData,
        );
}

class CharactersFinishedProcessing extends CharactersState {
  const CharactersFinishedProcessing({
    required CharactersDisplayedData charactersDisplayedData,
  }) : super(
          charactersDisplayedData: charactersDisplayedData,
        );
}

class CharactersInitialFromFavouritesDto extends CharactersState {
  const CharactersInitialFromFavouritesDto({
    required CharactersDisplayedData charactersDisplayedData,
  }) : super(
          charactersDisplayedData: charactersDisplayedData,
        );
}

class CharactersInitialFinished extends CharactersState {
  const CharactersInitialFinished({
    required CharactersDisplayedData charactersDisplayedData,
  }) : super(
          charactersDisplayedData: charactersDisplayedData,
        );
}

class CharactersChosenCharacter extends CharactersState {
  const CharactersChosenCharacter({
    required CharactersDisplayedData charactersDisplayedData,
  }) : super(
          charactersDisplayedData: charactersDisplayedData,
        );
}

class CharactersLoadedCharacter extends CharactersState {
  final CharactersTransferDto charactersTransferDto;

  const CharactersLoadedCharacter({
    required this.charactersTransferDto,
    required CharactersDisplayedData charactersDisplayedData,
  }) : super(
          charactersDisplayedData: charactersDisplayedData,
        );
}
