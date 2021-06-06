import 'package:breaking_bad_api_flutter/domain/domain.dart';

class CharactersTransferDto {
  final Character character;
  final bool isAddedToFavourites;

  const CharactersTransferDto({
    required this.character,
    required this.isAddedToFavourites,
  });
}
