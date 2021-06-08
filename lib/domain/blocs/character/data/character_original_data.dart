import 'package:breaking_bad_api_flutter/domain/blocs/blocs.dart';
import 'package:breaking_bad_api_flutter/domain/models/models.dart';
import 'package:breaking_bad_api_flutter/ui/strings/strings.dart';
import 'package:breaking_bad_api_flutter/ui/ui.dart';
import 'package:equatable/equatable.dart';

class CharacterOriginalData extends Equatable {
  final Character character;
  final bool isAddedToFavourites;

  CharacterOriginalData({
    required this.character,
    required this.isAddedToFavourites,
  });

  CharacterOriginalData.fromCharactersTransferDto(
    CharactersTransferDto charactersTransferDto,
  )   : character = charactersTransferDto.character,
        isAddedToFavourites = charactersTransferDto.isAddedToFavourites;

  CharacterDisplayedData convertToDisplayedData() => CharacterDisplayedData(
        imageUrl: character.img,
        fullName: character.name,
        status: character.status,
        nickName: character.nickname,
        birthday: character.birthday,
        portrayed: character.portrayed,
        favouritesButtonLabel: isAddedToFavourites == false
            ? AppLabels.AddToFavourites
            : AppLabels.RemoveFromFavourites,
      );

  @override
  List<Object?> get props => [
        character,
        isAddedToFavourites,
      ];
}
