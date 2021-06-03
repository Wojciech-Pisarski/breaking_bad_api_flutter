import 'package:breaking_bad_api_flutter/domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:breaking_bad_api_flutter/ui/ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouritesScreen extends StatefulWidget {
  @override
  _FavouritesScreenState createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  late final FavouritesBloc _favouritesBloc;

  @override
  void initState() {
    super.initState();
    _favouritesBloc = BlocProvider.of<FavouritesBloc>(context);
  }

  @override
  Widget build(BuildContext context) => CupertinoPageScaffold(
        backgroundColor: AppColors.screenGrayBackground,
        navigationBar: _buildCupertinoNavigationBar(),
        child: SafeArea(
          child: BlocConsumer<FavouritesBloc, FavouritesState>(
            listener: _buildListener,
            builder: (_, __) => _buildIosListView(
                FavouritesBloc.favouritesDisplayedData.favouritesToDisplay),
          ),
        ),
      );

  CupertinoNavigationBar _buildCupertinoNavigationBar() =>
      CupertinoNavigationBar(
        middle: Text(AppScreenLabels.FavouritesScreen),
      );

  _buildListener(BuildContext context, FavouritesState state) {
    if (state is FavouritesInitial) {
      LoadingUtility.finishLoading(context);
    } else if (state is FavouritesChosenFavourite) {
      LoadingUtility.startLoading(context);
    } else if (state is FavouritesLoadedFavourite) {
      LoadingUtility.finishLoading(context);
      _navigateToProperScreen(state.favouritesTransferDto);
    }
  }

  Widget _buildIosListView(List<FavouriteToDisplay> favouritesToDisplay) =>
      IosListViewComponent(
        itemsData: _buildIosListViewItemData(favouritesToDisplay),
        onItemPress: _chooseFavourite,
      );

  List<IosListViewItemData> _buildIosListViewItemData(
      List<FavouriteToDisplay> favouritesToDisplay) {
    List<IosListViewItemData> iosListViewItemDataList = <IosListViewItemData>[];
    for (var item in favouritesToDisplay) {
      iosListViewItemDataList.add(
        IosListViewItemData(
          id: item.id,
          label: item.label,
          icon: item.iconData,
        ),
      );
    }
    return iosListViewItemDataList;
  }

  _chooseFavourite(int favouriteId) => _favouritesBloc.add(
        FavouritesChooseFavourite(favouriteId: favouriteId),
      );

  _navigateToProperScreen(FavouritesTransferDto favouritesTransferDto) =>
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) {
            if (favouritesTransferDto.episodes != null) {
              return EpisodesBlocProvider(
                  favouritesTransferDto: favouritesTransferDto);
            } else if (favouritesTransferDto.characters != null) {
              return CharactersBlocProvider(
                  favouritesTransferDto: favouritesTransferDto);
            } else {
              return QuotesBlocProvider(
                favouritesTransferDto: favouritesTransferDto,
              );
            }
          },
        ),
      );
}
