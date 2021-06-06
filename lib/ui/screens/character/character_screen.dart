import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:breaking_bad_api_flutter/domain/blocs/blocs.dart';
import 'package:breaking_bad_api_flutter/domain/utilities/loading/loading_utility.dart';
import 'package:breaking_bad_api_flutter/ui/ui.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen();
  @override
  _CharacterScreenState createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  late final CharacterBloc _characterBloc;
  bool shouldRefreshFavourites = false;

  @override
  void initState() {
    super.initState();
    _characterBloc = BlocProvider.of<CharacterBloc>(context);
  }

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () async {
          Navigator.pop(context, _characterBloc.shouldRefreshFavouriteEpisodes);
          return false;
        },
        child: CupertinoPageScaffold(
          backgroundColor: AppColors.screenGrayBackground,
          navigationBar: _buildCupertinoNavigationBar(),
          child: SafeArea(
            child: BlocConsumer<CharacterBloc, CharacterState>(
              listener: _buildListener,
              builder: (_, state) =>
                  _buildScreenContent(state.characterDisplayedData),
            ),
          ),
        ),
      );

  CupertinoNavigationBar _buildCupertinoNavigationBar() =>
      CupertinoNavigationBar(middle: Text(AppScreenLabels.CharacterScreen));

  _buildListener(BuildContext context, CharacterState state) {
    if (state is CharacterAddedToFavourites ||
        state is CharacterRemovedFromFavourites) {
      LoadingUtility.finishLoading(context);
    }
  }

  Widget _buildScreenContent(CharacterDisplayedData characterDisplayedData) =>
      ListView(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          _buildCharacterImage(characterDisplayedData.imageUrl),
          _buildNameLabel(characterDisplayedData.fullName),
          _buildStatusLabel(characterDisplayedData.status),
          _buildCharacterDescription(characterDisplayedData),
          _buildToggleFavouriteButton(characterDisplayedData),
        ],
      );

  Widget _buildCharacterImage(String url) => Container(
        margin: EdgeInsets.all(Paddings.iosNormalPadding),
        child: CachedNetworkImage(
          height: 350,
          errorWidget: (context, url, error) => Icon(AppIconDatas.Error),
          fadeOutCurve: Curves.easeIn,
          placeholder: (_, __) => CupertinoActivityIndicator(),
          imageUrl: url,
        ),
      );

  Widget _buildNameLabel(String label) => Center(
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      );

  Widget _buildStatusLabel(String label) => Center(
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            //fontWeight: FontWeight.bold
          ),
        ),
      );

  Column _buildCharacterDescription(
          CharacterDisplayedData characterDisplayedData) =>
      Column(
        children: [
          ElementDescriptionRow(
            label: AppLabels.Nickname,
            content: characterDisplayedData.nickName,
          ),
          ElementDescriptionRow(
            label: AppLabels.Birthday,
            content: characterDisplayedData.birthday,
          ),
          ElementDescriptionRow(
            label: AppLabels.Portrayed,
            content: characterDisplayedData.portrayed,
          ),
        ],
      );

  Widget _buildToggleFavouriteButton(
          CharacterDisplayedData characterDisplayedData) =>
      Container(
        height: 100,
        child: CupertinoButton(
          onPressed: _addOrRemoveFromFavourites,
          child: Text(characterDisplayedData.favouritesButtonLabel),
        ),
      );

  _addOrRemoveFromFavourites() =>
      _characterBloc.add(CharacterAddOrRemoveFromFavourites());
}
