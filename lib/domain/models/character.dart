import 'package:breaking_bad_api_flutter/domain/domain.dart';

class Character {
  final int id;
  final String name;
  final String birthday;
  final List<String> occupation;
  final String img;
  final String status;
  final String nickname;
  final List<int> appearance;
  final String portrayed;
  static const String _WEB_POSTFIX = '/characters';
  static const String _ID_COLUMN_NAME = 'char_id';

  const Character({
    required this.id,
    required this.name,
    required this.birthday,
    required this.occupation,
    required this.img,
    required this.status,
    required this.nickname,
    required this.appearance,
    required this.portrayed,
  });

  factory Character._fromJson(Map<String, dynamic> json) => Character(
        id: json['char_id'],
        name: json['name'],
        birthday: json['birthday'],
        occupation: List<String>.from(json['occupation']),
        img: json['img'],
        status: json['status'],
        nickname: json['nickname'],
        appearance: List<int>.from(json['appearance']),
        portrayed: json['portrayed'],
      );

  static addCharacterToFavourites(int characterId) async =>
      await DatabaseUtility.addValue(
        characterId,
        DbTables.FAVOURITE_CHARACTERS_TABLE,
      );

  static removeCharacterFromFavourites(int characterId) async =>
      await DatabaseUtility.removeValue(
        characterId,
        DbTables.FAVOURITE_CHARACTERS_TABLE,
      );

  static Future<List<int>> getAllFavouriteCharactersIds() async =>
      await DatabaseUtility.getValues(
        DbTables.FAVOURITE_CHARACTERS_TABLE,
      );

  static Future<List<Map<String, dynamic>>> getAllCharactersData() async {
    var charactersData;
    try {
      charactersData = await WebUtility.getCollectionOfData(_WEB_POSTFIX);
    } catch (exception) {
      throw 'Error occurred\n$exception';
    }
    return charactersData;
  }

  static Future<List<Map<String, dynamic>>> getCharactersDataFromIds(
      List<int> charactersIds) async {
    var charactersData;
    try {
      charactersData = await WebUtility.getCollectionOfDataForIdList(
        charactersIds,
        _ID_COLUMN_NAME,
        _WEB_POSTFIX,
      );
    } catch (exception) {
      throw 'Error occurred\n$exception';
    }
    return charactersData;
  }

  static List<Character> getCharactersFromCharactersData(
      List<Map<String, dynamic>> charactersData) {
    final List<Character> characters = [];
    charactersData
        .forEach((element) => characters.add(Character._fromJson(element)));
    return characters;
  }
}
