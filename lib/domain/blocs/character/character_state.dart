import 'package:equatable/equatable.dart';

import 'data/data.dart';

class CharacterState extends Equatable {
  final CharacterDisplayedData characterDisplayedData;

  const CharacterState({
    required this.characterDisplayedData,
  });

  @override
  List<Object?> get props => [characterDisplayedData];
}

class CharacterProcessing extends CharacterState {
  const CharacterProcessing({
    required CharacterDisplayedData characterDisplayedData,
  }) : super(
          characterDisplayedData: characterDisplayedData,
        );
}

class CharacterInitial extends CharacterState {
  const CharacterInitial({
    required CharacterDisplayedData characterDisplayedData,
  }) : super(
          characterDisplayedData: characterDisplayedData,
        );
}

class CharacterAddedToFavourites extends CharacterState {
  const CharacterAddedToFavourites({
    required CharacterDisplayedData characterDisplayedData,
  }) : super(
          characterDisplayedData: characterDisplayedData,
        );
}

class CharacterRemovedFromFavourites extends CharacterState {
  const CharacterRemovedFromFavourites({
    required CharacterDisplayedData characterDisplayedData,
  }) : super(
          characterDisplayedData: characterDisplayedData,
        );
}
