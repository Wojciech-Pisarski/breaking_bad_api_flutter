import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breaking_bad_api_flutter/domain/domain.dart';
import '../episode.dart';

class EpisodeBlocProvider extends StatelessWidget {
  final EpisodesTransferDto episodesTransferDto;

  const EpisodeBlocProvider({
    required this.episodesTransferDto,
  });

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => EpisodeBloc(episodesTransferDto),
        child: EpisodeScreen(),
      );
}
