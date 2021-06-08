import 'package:equatable/equatable.dart';

class CharacterDisplayedData extends Equatable {
  final String imageUrl;
  final String fullName;
  final String status;
  final String nickName;
  final String birthday;
  final String portrayed;
  final String favouritesButtonLabel;

  const CharacterDisplayedData({
    required this.imageUrl,
    required this.fullName,
    required this.status,
    required this.nickName,
    required this.birthday,
    required this.portrayed,
    required this.favouritesButtonLabel,
  });

  @override
  List<Object?> get props => [
        imageUrl,
        fullName,
        status,
        nickName,
        birthday,
        portrayed,
        favouritesButtonLabel,
      ];
}
