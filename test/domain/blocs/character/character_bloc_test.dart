import 'package:breaking_bad_api_flutter/domain/blocs/blocs.dart';
import 'package:breaking_bad_api_flutter/domain/models/character.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CharacterBloc tests', () {
    late Character character;
    late int id;
    late List<int> appearance;
    late String name;
    late String birthday;
    late String img;
    late String status;
    late String nickname;
    late String portrayed;
    late List<String> occupation;
    late bool isAddedToFavourites;
    late CharactersTransferDto charactersTransferDto;
    late CharacterBloc characterBloc;
    late CharacterOriginalData characterOriginalData;
    late CharacterDisplayedData characterDisplayedData;

    setUp(() {
      id = 0;
      appearance = [0];
      name = "";
      birthday = "";
      img = "";
      status = "";
      nickname = "";
      portrayed = "";
      occupation = [""];
      isAddedToFavourites = false;
      character = Character(
        id: id,
        appearance: appearance,
        name: name,
        birthday: birthday,
        img: img,
        status: status,
        nickname: nickname,
        portrayed: portrayed,
        occupation: occupation,
      );
      charactersTransferDto = CharactersTransferDto(
        character: character,
        isAddedToFavourites: isAddedToFavourites,
      );
      characterBloc = CharacterBloc(charactersTransferDto);
      characterOriginalData = CharacterOriginalData.fromCharactersTransferDto(
          charactersTransferDto);
      characterDisplayedData = characterOriginalData.convertToDisplayedData();
    });

    test(
        'initial state is CharacterInitial',
        () => expect(characterBloc.state,
            CharacterInitial(characterDisplayedData: characterDisplayedData)));
  });
}
