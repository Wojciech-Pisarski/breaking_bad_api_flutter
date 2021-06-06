import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breaking_bad_api_flutter/domain/domain.dart';
import '../character.dart';

class CharacterBlocProvider extends StatelessWidget {
  final CharactersTransferDto charactersTransferDto;
  final bool showOnlyFavourites;

  const CharacterBlocProvider({
    required this.charactersTransferDto,
    required this.showOnlyFavourites,
  });

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => CharacterBloc(charactersTransferDto),
        child: CharacterScreen(showOnlyFavourites),
      );
}
