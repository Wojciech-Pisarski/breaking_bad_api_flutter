import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breaking_bad_api_flutter/domain/blocs/blocs.dart';
import 'package:breaking_bad_api_flutter/domain/utilities/loading/loading_utility.dart';
import 'package:breaking_bad_api_flutter/ui/ui.dart';

class EpisodeScreen extends StatefulWidget {
  final bool showOnlyFavourites;

  const EpisodeScreen(this.showOnlyFavourites);
  @override
  _EpisodeScreenState createState() => _EpisodeScreenState();
}

class _EpisodeScreenState extends State<EpisodeScreen> {
  late final EpisodeBloc _episodeBloc;
  bool shouldRefreshFavourites = false;

  @override
  void initState() {
    super.initState();
    _episodeBloc = BlocProvider.of<EpisodeBloc>(context);
  }

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () async {
          Navigator.pop(context, _episodeBloc.shouldRefreshFavouriteEpisodes);
          return false;
        },
        child: CupertinoPageScaffold(
          backgroundColor: AppColors.screenGrayBackground,
          navigationBar: _buildCupertinoNavigationBar(),
          child: SafeArea(
            child: BlocConsumer<EpisodeBloc, EpisodeState>(
              listener: _buildListener,
              builder: (_, state) =>
                  _buildScreenContent(state.episodeDisplayedData),
            ),
          ),
        ),
      );

  CupertinoNavigationBar _buildCupertinoNavigationBar() =>
      CupertinoNavigationBar(middle: Text(AppScreenLabels.EpisodeScreen));

  _buildListener(BuildContext context, EpisodeState state) {
    if (state is EpisodeAddedToFavourites ||
        state is EpisodeRemovedFromFavourites) {
      LoadingUtility.finishLoading(context);
    }
  }

  Widget _buildScreenContent(EpisodeDisplayedData episodeDisplayedData) =>
      ListView(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          _buildEpisodeLabel(episodeDisplayedData.name),
          _buildEpisodeDescription(episodeDisplayedData),
          _buildToggleFavouriteButton(episodeDisplayedData),
        ],
      );

  Widget _buildEpisodeLabel(String label) => Container(
        height: 200,
        child: Center(
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
            ),
          ),
        ),
      );

  Column _buildEpisodeDescription(EpisodeDisplayedData episodeDisplayedData) =>
      Column(
        children: [
          ElementDescriptionRow(
            label: AppLabels.Season,
            content: episodeDisplayedData.season,
          ),
          ElementDescriptionRow(
            label: AppLabels.Episode,
            content: episodeDisplayedData.episode,
          ),
          ElementDescriptionRow(
            label: AppLabels.AirDate,
            content: episodeDisplayedData.airDate,
          ),
          ElementDescriptionRow(
            label: AppLabels.Characters,
            content: episodeDisplayedData.characters,
          ),
        ],
      );

  Widget _buildToggleFavouriteButton(
          EpisodeDisplayedData episodeDisplayedData) =>
      Container(
        height: 100,
        child: CupertinoButton(
          onPressed: _addOrRemoveFromFavourites,
          child: Text(episodeDisplayedData.favouritesButtonLabel),
        ),
      );

  _addOrRemoveFromFavourites() =>
      _episodeBloc.add(EpisodeAddOrRemoveFromFavourites());
}
