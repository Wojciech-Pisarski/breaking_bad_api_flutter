import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breaking_bad_api_flutter/domain/blocs/blocs.dart';
import 'package:breaking_bad_api_flutter/domain/utilities/loading/loading_utility.dart';
import 'package:breaking_bad_api_flutter/ui/ui.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen();
  @override
  _QuoteScreenState createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  late final QuoteBloc _quoteBloc;
  bool shouldRefreshFavourites = false;

  @override
  void initState() {
    super.initState();
    _quoteBloc = BlocProvider.of<QuoteBloc>(context);
  }

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () async {
          Navigator.pop(context, _quoteBloc.shouldRefreshFavouriteEpisodes);
          return false;
        },
        child: CupertinoPageScaffold(
          backgroundColor: AppColors.screenGrayBackground,
          navigationBar: _buildCupertinoNavigationBar(),
          child: SafeArea(
            child: BlocConsumer<QuoteBloc, QuoteState>(
              listener: _buildListener,
              builder: (_, state) =>
                  _buildScreenContent(state.quoteDisplayedData),
            ),
          ),
        ),
      );

  CupertinoNavigationBar _buildCupertinoNavigationBar() =>
      CupertinoNavigationBar(middle: Text(AppScreenLabels.EpisodeScreen));

  _buildListener(BuildContext context, QuoteState state) {
    if (state is QuoteAddedToFavourites ||
        state is QuoteRemovedFromFavourites) {
      LoadingUtility.finishLoading(context);
    }
  }

  Widget _buildScreenContent(QuoteDisplayedData quoteDisplayedData) => Center(
        child: ListView(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            _buildQuoteLabel(quoteDisplayedData.content),
            _buildQuoteAuthorLabel(quoteDisplayedData.author),
            _buildToggleFavouriteButton(quoteDisplayedData),
          ],
        ),
      );

  Widget _buildQuoteLabel(String label) => Center(
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 32,
            fontStyle: FontStyle.italic,
          ),
        ),
      );

  Widget _buildQuoteAuthorLabel(String label) => Center(
        child: Container(
          margin: EdgeInsets.only(top: Paddings.iosSmallPadding),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      );

  Widget _buildToggleFavouriteButton(QuoteDisplayedData quoteDisplayedData) =>
      Container(
        height: 100,
        child: CupertinoButton(
          onPressed: _addOrRemoveFromFavourites,
          child: Text(quoteDisplayedData.favouritesButtonLabel),
        ),
      );

  _addOrRemoveFromFavourites() =>
      _quoteBloc.add(QuoteAddOrRemoveFromFavourites());
}
