import 'package:breaking_bad_api_flutter/domain/blocs/blocs.dart';
import 'package:breaking_bad_api_flutter/domain/utilities/loading/loading_utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:breaking_bad_api_flutter/ui/ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EpisodesScreen extends StatefulWidget {
  const EpisodesScreen();
  @override
  _EpisodesScreenState createState() => _EpisodesScreenState();
}

class _EpisodesScreenState extends State<EpisodesScreen> {
  late final EpisodesBloc _episodesBloc;

  @override
  void initState() {
    super.initState();
    _episodesBloc = BlocProvider.of<EpisodesBloc>(context);
  }

  @override
  Widget build(BuildContext context) => CupertinoPageScaffold(
        backgroundColor: AppColors.screenGrayBackground,
        navigationBar: _buildCupertinoNavigationBar(),
        child: SafeArea(
          child: BlocConsumer<EpisodesBloc, EpisodesState>(
            listener: _buildListener,
            builder: (_, state) => _buildIosListView(state),
          ),
        ),
      );

  CupertinoNavigationBar _buildCupertinoNavigationBar() =>
      CupertinoNavigationBar(
        middle: Text(AppScreenLabels.EpisodesScreen),
      );

  _buildListener(BuildContext context, EpisodesState state) {
    if (state is EpisodesInitial) {
      LoadingUtility.finishLoading(context);
    } else if (state is EpisodesChooseEpisode) {
      LoadingUtility.startLoading(context);
    } else if (state is EpisodesLoadedEpisode) {
      LoadingUtility.finishLoading(context);
      //_navigateToEpisodeScreen(state.episodesTransferDto);
    }
  }

  Widget _buildIosListView(EpisodesState state) => IosListViewComponent(
        itemsData: _buildIosListViewItemData(
            state.episodesDisplayedData.episodesToDisplay),
        onItemPress: _chooseSeason,
      );

  List<IosListViewItemData> _buildIosListViewItemData(
      List<EpisodeToDisplay> episodesToDisplay) {
    List<IosListViewItemData> iosListViewItemDataList = <IosListViewItemData>[];
    for (var item in episodesToDisplay) {
      iosListViewItemDataList.add(
        IosListViewItemData(
          id: item.id,
          label: item.label,
        ),
      );
    }
    return iosListViewItemDataList;
  }

  _chooseSeason(int episodeId) => _episodesBloc.add(
        EpisodesChooseEpisode(
          episodeId: episodeId,
        ),
      );

  //_navigateToEpisodeScreen(EpisodesTransferDto episodesTransferDto) =>
  // TODO: Implement in future tasks
}
