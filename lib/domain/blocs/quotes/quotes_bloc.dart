import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breaking_bad_api_flutter/domain/domain.dart';

class QuotesBloc extends Bloc<QuotesEvent, QuotesState> {
  late QuotesOriginalData _quotesOriginalData;
  bool _showOnlyFavourites;

  QuotesBloc({
    FavouritesTransferDto? favouritesTransferDto,
  })  : _showOnlyFavourites = favouritesTransferDto != null,
        _quotesOriginalData =
            QuotesOriginalData.fromFavouritesTransferDto(favouritesTransferDto),
        super(_emitInitialState(favouritesTransferDto));

  static QuotesState _emitInitialState(
          FavouritesTransferDto? favouritesTransferDto) =>
      favouritesTransferDto != null
          ? QuotesInitialFromFavouritesDto(
              quotesDisplayedData: QuotesOriginalData.fromFavouritesTransferDto(
                      favouritesTransferDto)
                  .convertToDisplayedData())
          : QuotesInitial();

  @override
  Stream<QuotesState> mapEventToState(QuotesEvent event) async* {
    if (event is QuotesRefreshQuotes) {
      if (_showOnlyFavourites) {
        final List<int> favQuotesIds = await Quote.getAllFavouriteQuotesIds();
        final List<Map<String, dynamic>> favQuotesData =
            await Quote.getQuotesDataFromIds(favQuotesIds);
        final List<Quote> favQuotes =
            Quote.getQuotesFromQuotesData(favQuotesData);
        _quotesOriginalData = QuotesOriginalData(quotes: favQuotes);
      } else {
        yield _initial();
        var quotesData = await Quote.getAllQuotesData();
        _quotesOriginalData = QuotesOriginalData(
          quotes: Quote.getQuotesFromQuotesData(quotesData),
        );
        yield _initialFinished();
      }
    } else if (event is QuotesChooseQuote) {
      yield _chosenQuote();
      _quotesOriginalData.quote = _quotesOriginalData.quotes
          .firstWhere((element) => element.id == event.quoteId);
      final bool isAddedToFavourites =
          await Quote.checkIfQuoteInFavourites(event.quoteId);
      yield _loadedQuote(isAddedToFavourites);
    }
  }

  QuotesInitial _initial() => QuotesInitial();

  QuotesInitialFinished _initialFinished() => QuotesInitialFinished(
        quotesDisplayedData: _quotesOriginalData.convertToDisplayedData(),
      );

  QuotesChosenQuote _chosenQuote() => QuotesChosenQuote(
        quotesDisplayedData: _quotesOriginalData.convertToDisplayedData(),
      );

  QuotesLoadedQuote _loadedQuote(bool isAddedToFavourite) => QuotesLoadedQuote(
        quotesTransferDto: QuotesTransferDto(
          quote: _quotesOriginalData.quote,
          isAddedToFavourites: isAddedToFavourite,
        ),
        quotesDisplayedData: _quotesOriginalData.convertToDisplayedData(),
      );
}
