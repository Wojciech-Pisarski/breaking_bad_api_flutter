abstract class CharactersEvent {
  const CharactersEvent();
}

class CharactersRefreshCharacters extends CharactersEvent {
  const CharactersRefreshCharacters();
}

class CharactersChangeOrder extends CharactersEvent {
  const CharactersChangeOrder();
}

class CharactersChooseCharacter extends CharactersEvent {
  final int characterId;

  const CharactersChooseCharacter({
    required this.characterId,
  });
}
