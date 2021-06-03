import 'package:breaking_bad_api_flutter/domain/blocs/blocs.dart';
import 'package:breaking_bad_api_flutter/domain/utilities/loading/loading_utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:breaking_bad_api_flutter/ui/ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersScreen extends StatefulWidget {
  @override
  _CharactersScreenState createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late final CharactersBloc _charactersBloc;

  @override
  void initState() {
    super.initState();
    _charactersBloc = BlocProvider.of<CharactersBloc>(context);
  }

  @override
  Widget build(BuildContext context) => CupertinoPageScaffold(
        backgroundColor: AppColors.screenGrayBackground,
        navigationBar: _buildCupertinoNavigationBar(),
        child: SafeArea(
          child: BlocConsumer<CharactersBloc, CharactersState>(
            listener: _buildListener,
            builder: (_, state) => _buildIosListView(state),
          ),
        ),
      );

  CupertinoNavigationBar _buildCupertinoNavigationBar() =>
      CupertinoNavigationBar(
        middle: Text(AppScreenLabels.CharactersScreen),
      );

  _buildListener(BuildContext context, CharactersState state) {
    if (state is CharactersInitial || state is CharactersChosenCharacter) {
      LoadingUtility.startLoading(context);
    } else if (state is CharactersInitialFinished ||
        state is CharactersInitialFromFavouritesDto) {
      LoadingUtility.finishLoading(context);
    } else if (state is CharactersLoadedCharacter) {
      LoadingUtility.finishLoading(context);
      //_navigateToCharacterScreen(state.charactersTransferDto);
    }
  }

  Widget _buildIosListView(CharactersState state) => IosListViewComponent(
        itemsData: _buildIosListViewItemData(
            state.charactersDisplayedData.charactersToDisplay),
        onItemPress: _chooseCharacter,
      );

  List<IosListViewItemData> _buildIosListViewItemData(
      List<CharacterToDisplay> characterToDisplay) {
    List<IosListViewItemData> iosListViewItemDataList = <IosListViewItemData>[];
    for (var item in characterToDisplay) {
      iosListViewItemDataList.add(
        IosListViewItemData(
          id: item.id,
          label: item.label,
        ),
      );
    }
    return iosListViewItemDataList;
  }

  _chooseCharacter(int characterId) => _charactersBloc.add(
        CharactersChooseCharacter(
          characterId: characterId,
        ),
      );

  //_navigateToCharacterScreen(CharactersTransferDto charactersTransferDto) =>
  // TODO: Implement in future tasks
}
