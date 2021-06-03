import 'package:breaking_bad_api_flutter/domain/blocs/blocs.dart';
import 'package:breaking_bad_api_flutter/domain/utilities/loading/loading_utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:breaking_bad_api_flutter/ui/ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeathsScreen extends StatefulWidget {
  @override
  _DeathsScreenState createState() => _DeathsScreenState();
}

class _DeathsScreenState extends State<DeathsScreen> {
  late final DeathsBloc _deathsBloc;

  @override
  void initState() {
    super.initState();
    _deathsBloc = BlocProvider.of<DeathsBloc>(context);
  }

  @override
  Widget build(BuildContext context) => CupertinoPageScaffold(
        backgroundColor: AppColors.screenGrayBackground,
        navigationBar: _buildCupertinoNavigationBar(),
        child: SafeArea(
          child: BlocConsumer<DeathsBloc, DeathsState>(
            listener: _buildListener,
            builder: (_, state) => _buildIosListView(state),
          ),
        ),
      );

  CupertinoNavigationBar _buildCupertinoNavigationBar() =>
      CupertinoNavigationBar(
        middle: Text(AppScreenLabels.DeathsScreen),
      );

  _buildListener(BuildContext context, DeathsState state) {
    if (state is DeathsInitial || state is DeathsChosenDeath) {
      LoadingUtility.startLoading(context);
    } else if (state is DeathsInitialFinished) {
      LoadingUtility.finishLoading(context);
    } else if (state is DeathsLoadedDeath) {
      LoadingUtility.finishLoading(context);
      //_navigateToDeathScreen(state.deathsTransferDto);
    }
  }

  Widget _buildIosListView(DeathsState state) => IosListViewComponent(
        itemsData: _buildIosListViewItemData(
            state.deathsDisplayedData.deathsToDisplay),
        onItemPress: _chooseDeath,
      );

  List<IosListViewItemData> _buildIosListViewItemData(
      List<DeathToDisplay> deathsToDisplay) {
    List<IosListViewItemData> iosListViewItemDataList = <IosListViewItemData>[];
    for (var item in deathsToDisplay) {
      iosListViewItemDataList.add(
        IosListViewItemData(
          id: item.id,
          label: item.label,
        ),
      );
    }
    return iosListViewItemDataList;
  }

  _chooseDeath(int deathId) => _deathsBloc.add(
        DeathsChooseDeath(
          deathId: deathId,
        ),
      );

//_navigateToDeathScreen(DeathsTransferDto deathsTransferDto) =>
// TODO: Implement in future tasks
}
