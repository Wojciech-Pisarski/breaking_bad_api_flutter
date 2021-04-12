class CharactersEvent {
  const CharactersEvent();
}

class CharactersRefreshCharacters extends CharactersEvent {
  const CharactersRefreshCharacters();
}

class CharactersChooseCharacter extends CharactersEvent {
  final int characterId;

  const CharactersChooseCharacter({
    required this.characterId,
  });
}
