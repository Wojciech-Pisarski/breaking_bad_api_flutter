import 'package:equatable/equatable.dart';

import 'data/data.dart';

class QuotesState extends Equatable {
  final QuotesDisplayedData quotesDisplayedData;

  const QuotesState({
    required this.quotesDisplayedData,
  });

  @override
  List<Object?> get props => [quotesDisplayedData];
}

class QuotesInitial extends QuotesState {
  const QuotesInitial()
      : super(
          quotesDisplayedData: const QuotesDisplayedData(
            quotesToDisplay: <QuoteToDisplay>[],
          ),
        );
}

class QuotesProcessing extends QuotesState {
  const QuotesProcessing({
    required QuotesDisplayedData quotesDisplayedData,
  }) : super(
          quotesDisplayedData: quotesDisplayedData,
        );
}

class QuotesFinishedProcessing extends QuotesState {
  const QuotesFinishedProcessing({
    required QuotesDisplayedData quotesDisplayedData,
  }) : super(
          quotesDisplayedData: quotesDisplayedData,
        );
}

class QuotesInitialFromFavouritesDto extends QuotesState {
  const QuotesInitialFromFavouritesDto({
    required QuotesDisplayedData quotesDisplayedData,
  }) : super(
          quotesDisplayedData: quotesDisplayedData,
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
