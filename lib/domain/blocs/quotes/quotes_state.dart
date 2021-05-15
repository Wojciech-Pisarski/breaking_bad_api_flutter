import 'data/data.dart';

class QuotesState {
  final QuotesDisplayedData quotesDisplayedData;

  const QuotesState({
    required this.quotesDisplayedData,
  });
}

class QuotesInitial extends QuotesState {
  const QuotesInitial()
      : super(
    quotesDisplayedData: const QuotesDisplayedData(
            quotesToDisplay: <QuoteToDisplay>[],
          ),
        );
}

class QuotesInitialFinished extends QuotesState {
  const QuotesInitialFinished({
    required QuotesDisplayedData quotesDisplayedData,
  }) : super(
          quotesDisplayedData: quotesDisplayedData,
        );
}

class QuotesChosenQuote extends QuotesState {
  const QuotesChosenQuote({
    required QuotesDisplayedData quotesDisplayedData,
  }) : super(
          quotesDisplayedData: quotesDisplayedData,
        );
}

class QuotesLoadedQuote extends QuotesState {
  final QuotesTransferDto quotesTransferDto;

  const QuotesLoadedQuote({
    required this.quotesTransferDto,
    required QuotesDisplayedData quotesDisplayedData,
  }) : super(
          quotesDisplayedData: quotesDisplayedData,
        );
}
