import 'data/data.dart';

class CharactersState {
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