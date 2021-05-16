import 'package:breaking_bad_api_flutter/ui/screens/deaths/deaths.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breaking_bad_api_flutter/domain/domain.dart';
import '../deaths.dart';

class DeathsBlocProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) =>
            DeathsBloc()..add(DeathsRefreshDeaths()),
        child: DeathsScreen(),
      );
}
