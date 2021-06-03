import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breaking_bad_api_flutter/domain/domain.dart';
import '../episodes.dart';

class EpisodesBlocProvider extends StatelessWidget {
  final SeasonsTransferDto? seasonsTransferDto;
  final FavouritesTransferDto? favouritesTransferDto;

  const EpisodesBlocProvider({
    this.seasonsTransferDto,
    this.favouritesTransferDto,
  }) : assert(seasonsTransferDto != null && favouritesTransferDto == null ||
            seasonsTransferDto == null && favouritesTransferDto != null);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => EpisodesBloc(
          seasonsTransferDto: seasonsTransferDto,
          favouritesTransferDto: favouritesTransferDto,
        ),
        child: EpisodesScreen(),
      );
}
