import 'package:breaking_bad_api_flutter/domain/blocs/blocs.dart';
import 'package:breaking_bad_api_flutter/domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:breaking_bad_api_flutter/ui/ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeasonsScreen extends StatefulWidget {
  @override
  _SeasonsScreenState createState() => _SeasonsScreenState();
}

class _SeasonsScreenState extends State<SeasonsScreen> {
  late final SeasonsBloc _seasonsBloc;

  @override
  void initState() {
    super.initState();
    _seasonsBloc = BlocProvider.of<SeasonsBloc>(context);
  }

  @override
  Widget build(BuildContext context) => CupertinoPageScaffold(
        backgroundColor: AppColors.screenGrayBackground,
        navigationBar: _buildCupertinoNavigationBar(),
        child: SafeArea(
          child: BlocConsumer<SeasonsBloc, SeasonsState>(
            listener: _buildListener,
            builder: (_, state) => _buildIosListView(state),
          ),
        ),
      );

  CupertinoNavigationBar _buildCupertinoNavigationBar() =>
      CupertinoNavigationBar(
        middle: Text(AppScreenLabels.SeasonsScreen),
      );

  _buildListener(BuildContext context, SeasonsState state) {
    if (state is SeasonsInitial) {
      LoadingUtility.finishLoading(context);
    } else if (state is SeasonsChosenSeason) {
      LoadingUtility.startLoading(context);
    } else if (state is SeasonsLoadedEpisodes) {
      LoadingUtility.finishLoading(context);
      _navigateToEpisodesScreen(state.seasonsTransferDto);
    }
  }

  Widget _buildIosListView(SeasonsState state) => IosListViewComponent(
        itemsData: _buildIosListViewItemData(
            state.seasonsDisplayedData.seasonsToDisplay),
        onItemPress: _chooseSeason,
      );

  List<IosListViewItemData> _buildIosListViewItemData(
      List<SeasonToDisplay> seasonsToDisplay) {
    List<IosListViewItemData> iosListViewItemDataList = <IosListViewItemData>[];
    for (var item in seasonsToDisplay) {
      iosListViewItemDataList.add(
        IosListViewItemData(
          id: item.id,
          label: item.label,
        ),
      );
    }
    return iosListViewItemDataList;
  }

  _chooseSeason(int seasonNumber) => _seasonsBloc.add(
        SeasonsChooseSeason(
          seasonNumber: seasonNumber,
        ),
      );

  _navigateToEpisodesScreen(SeasonsTransferDto seasonsTransferDto) =>
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => EpisodesScreen(),
        ),
      );
}
