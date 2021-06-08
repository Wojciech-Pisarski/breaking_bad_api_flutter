import 'package:breaking_bad_api_flutter/domain/blocs/blocs.dart';
import 'package:breaking_bad_api_flutter/domain/models/character.dart';
import 'package:breaking_bad_api_flutter/ui/ui.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("CharacterOriginalData tests", () {
    late bool isAddedToFavourites;
    late String name;
    late String nickName;
    late String status;
    late String portrayed;
    late String birthday;
    late String imgUrl;
    late String favouritesButtonLabel;
    late int id;
    late List<String> occupation;
    late List<int> appearance;
    late Character character;
    late CharacterDisplayedData characterDisplayedData;
    late CharactersTransferDto charactersTransferDto;
    late CharacterOriginalData characterOriginalData;

    setUp(() {
      isAddedToFavourites = false;
      name = "";
      nickName = "";
      status = "";
      portrayed = "";
      birthday = "";
      imgUrl = "";
      favouritesButtonLabel = isAddedToFavourites == false
          ? AppLabels.AddToFavourites
          : AppLabels.RemoveFromFavourites;
      id = -1;
      occupation = [];
      appearance = [];
      character = Character(
        name: name,
        nickname: nickName,
        status: status,
        portrayed: portrayed,
        birthday: birthday,
        img: imgUrl,
        id: id,
        occupation: occupation,
        appearance: appearance,
      );
      characterDisplayedData = CharacterDisplayedData(
        fullName: name,
        nickName: nickName,
        status: status,
        portrayed: portrayed,
        birthday: birthday,
        imageUrl: imgUrl,
        favouritesButtonLabel: favouritesButtonLabel,
      );
      charactersTransferDto = CharactersTransferDto(
        character: character,
        isAddedToFavourites: isAddedToFavourites,
      );
      characterOriginalData = CharacterOriginalData(
        character: character,
        isAddedToFavourites: isAddedToFavourites,
      );
    });

    test("Convert mock character to CharacterDisplayedData", () {
      CharacterDisplayedData characterDisplayedDataTest =
          characterOriginalData.convertToDisplayedData();
      expect(characterDisplayedData, characterDisplayedDataTest);
    });

    test("Convert CharactersTransferDto to CharacterOriginalData", () {
      CharacterOriginalData characterOriginalDataTest =
          CharacterOriginalData.fromCharactersTransferDto(
              charactersTransferDto);
      expect(characterOriginalData, characterOriginalDataTest);
    });
  });
}
