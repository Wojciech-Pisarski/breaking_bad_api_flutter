import 'package:breaking_bad_api_flutter/ui/screens/favourites/favourites.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breaking_bad_api_flutter/domain/domain.dart';
import '../favourites.dart';

class FavouritesBlocProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => FavouritesBloc(),
        child: FavouritesScreen(),
      );
}
