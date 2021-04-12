import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breaking_bad_api_flutter/domain/domain.dart';
import '../seasons.dart';

class SeasonsBlocProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => SeasonsBloc(),
        child: SeasonsScreen(),
      );
}
