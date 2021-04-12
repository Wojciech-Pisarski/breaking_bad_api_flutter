import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breaking_bad_api_flutter/domain/domain.dart';
import '../episodes.dart';

class EpisodesBlocProvider extends StatelessWidget {
  final SeasonsTransferDto seasonsTransferDto;

  const EpisodesBlocProvider({
    required this.seasonsTransferDto,
  });

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => EpisodesBloc(
          seasonsTransferDto: seasonsTransferDto,
        ),
        child: EpisodesScreen(),
      );
}
