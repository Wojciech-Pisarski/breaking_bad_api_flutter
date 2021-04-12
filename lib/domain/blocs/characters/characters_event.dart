class CharactersEvent {
  const CharactersEvent();
}

class CharactersChooseCharacter extends CharactersEvent {
  final int characterId;

  const CharactersChooseCharacter({
    required this.characterId,
  });
}
