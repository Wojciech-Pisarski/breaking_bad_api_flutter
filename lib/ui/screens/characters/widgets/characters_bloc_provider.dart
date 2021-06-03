import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breaking_bad_api_flutter/domain/domain.dart';
import '../characters.dart';

class CharactersBlocProvider extends StatelessWidget {
  final FavouritesTransferDto? favouritesTransferDto;

  const CharactersBlocProvider({
    this.favouritesTransferDto,
  });

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => favouritesTransferDto != null
            ? CharactersBloc(favouritesTransferDto: favouritesTransferDto)
            : CharactersBloc()
          ..add(CharactersRefreshCharacters()),
        child: CharactersScreen(),
      );
}
