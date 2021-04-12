import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breaking_bad_api_flutter/domain/domain.dart';
import '../characters.dart';

class CharactersBlocProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) =>
            CharactersBloc()..add(CharactersRefreshCharacters()),
        child: CharactersScreen(),
      );
}
