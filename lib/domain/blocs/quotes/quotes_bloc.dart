import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breaking_bad_api_flutter/domain/domain.dart';

class QuotesBloc extends Bloc<QuotesEvent, QuotesState> {
  late final QuotesOriginalData _quotesOriginalData;

  QuotesBloc() : super(QuotesInitial());

  @override
  Stream<QuotesState> mapEventToState(QuotesEvent event) async* {
    if (event is QuotesRefreshQuotes) {
      yield _initial();
      var quotesData = await Quote.getAllQuotesData();
      _quotesOriginalData = QuotesOriginalData(
          quotes: Quote.getQuotesFromQuotesData(quotesData),
      );
      yield _initialFinished();
    } else if (event is QuotesChooseQuote) {
      yield _chosenQuote();
      _quotesOriginalData.quote = _quotesOriginalData.quotes
          .firstWhere((element) => element.id == event.quoteId);
      yield _loadedQuote();
    }
  }

  QuotesInitial _initial() => QuotesInitial();

  QuotesInitialFinished _initialFinished() => QuotesInitialFinished(
        quotesDisplayedData:
            _quotesOriginalData.convertToDisplayedData(),
      );

  QuotesChosenQuote _chosenQuote() => QuotesChosenQuote(
        quotesDisplayedData:
        _quotesOriginalData.convertToDisplayedData(),
      );

  QuotesLoadedQuote _loadedQuote() => QuotesLoadedQuote(
        quotesTransferDto: QuotesTransferDto(
          quotes: _quotesOriginalData.quotes,
        ),
        quotesDisplayedData:
            _quotesOriginalData.convertToDisplayedData(),
      );
}
