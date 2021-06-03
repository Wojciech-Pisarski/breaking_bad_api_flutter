import 'package:breaking_bad_api_flutter/domain/blocs/blocs.dart';
import 'package:breaking_bad_api_flutter/domain/utilities/loading/loading_utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:breaking_bad_api_flutter/ui/ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuotesScreen extends StatefulWidget {
  final FavouritesTransferDto? favouritesTransferDto;

  const QuotesScreen({this.favouritesTransferDto});
  @override
  _QuotesScreenState createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  late final QuotesBloc _quotesBloc;

  @override
  void initState() {
    super.initState();
    _quotesBloc = BlocProvider.of<QuotesBloc>(context);
  }

  @override
  Widget build(BuildContext context) => CupertinoPageScaffold(
        backgroundColor: AppColors.screenGrayBackground,
        navigationBar: _buildCupertinoNavigationBar(),
        child: SafeArea(
          child: BlocConsumer<QuotesBloc, QuotesState>(
            listener: _buildListener,
            builder: (_, state) => _buildIosListView(state),
          ),
        ),
      );

  CupertinoNavigationBar _buildCupertinoNavigationBar() =>
      CupertinoNavigationBar(
        middle: Text(AppScreenLabels.QuotesScreen),
      );

  _buildListener(BuildContext context, QuotesState state) {
    if (state is QuotesInitial || state is QuotesChosenQuote) {
      LoadingUtility.startLoading(context);
    } else if (state is QuotesInitialFinished) {
      LoadingUtility.finishLoading(context);
    } else if (state is QuotesLoadedQuote) {
      LoadingUtility.finishLoading(context);
      //_navigateToQuoteScreen(state.quotesTransferDto);
    }
  }

  Widget _buildIosListView(QuotesState state) => IosListViewComponent(
        itemsData: _buildIosListViewItemData(
            state.quotesDisplayedData.quotesToDisplay),
        onItemPress: _chooseQuote,
      );

  List<IosListViewItemData> _buildIosListViewItemData(
      List<QuoteToDisplay> quoteToDisplay) {
    List<IosListViewItemData> iosListViewItemDataList = <IosListViewItemData>[];
    for (var item in quoteToDisplay) {
      iosListViewItemDataList.add(
        IosListViewItemData(
          id: item.id,
          label: item.label,
        ),
      );
    }
    return iosListViewItemDataList;
  }

  _chooseQuote(int quoteId) => _quotesBloc.add(
        QuotesChooseQuote(
          quoteId: quoteId,
        ),
      );

//_navigateToQuoteScreen(QuotesTransferDto quotesTransferDto) =>
// TODO: Implement in future tasks
}
