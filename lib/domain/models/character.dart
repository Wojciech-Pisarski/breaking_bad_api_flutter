import 'package:breaking_bad_api_flutter/domain/domain.dart';

class Character {
  final int id;
  final String name;
  final String birthday;
  final List<String> occupation;
  final String img;
  final String status;
  final String nickname;
  final List<int> apperance;
  final String portrayed;

  const Character({
    required this.id,
    required this.name,
    required this.birthday,
    required this.occupation,
    required this.img,
    required this.status,
    required this.nickname,
    required this.apperance,
    required this.portrayed,
  });

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        id: json['char_id'],
        name: json['name'],
        birthday: json['birthday'],
        occupation: List<String>.from(json['occupation']),
        img: json['img'],
        status: json['status'],
        nickname: json['nickname'],
        apperance: List<int>.from(json['appearance']),
        portrayed: json['portrayed'],
      );

  static Future<Character> getCharacterById(int characterId) async =>
      await WebUtility.getCharacterById(characterId);

  static Future<List<Character>> getAllCharacters() async =>
      await WebUtility.getAllCharacters();
}
