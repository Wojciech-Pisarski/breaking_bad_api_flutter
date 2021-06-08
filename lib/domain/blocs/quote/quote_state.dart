import 'package:equatable/equatable.dart';

import 'data/data.dart';

class QuoteState extends Equatable {
  final QuoteDisplayedData quoteDisplayedData;

  const QuoteState({
    required this.quoteDisplayedData,
  });

  @override
  List<Object?> get props => [quoteDisplayedData];
}

class QuoteProcessing extends QuoteState {
  const QuoteProcessing({
    required QuoteDisplayedData quoteDisplayedData,
  }) : super(
          quoteDisplayedData: quoteDisplayedData,
        );
}

class QuoteInitial extends QuoteState {
  const QuoteInitial({
    required QuoteDisplayedData quoteDisplayedData,
  }) : super(
          quoteDisplayedData: quoteDisplayedData,
        );
}

class QuoteAddedToFavourites extends QuoteState {
  const QuoteAddedToFavourites({
    required QuoteDisplayedData quoteDisplayedData,
  }) : super(
          quoteDisplayedData: quoteDisplayedData,
        );
}

class QuoteRemovedFromFavourites extends QuoteState {
  const QuoteRemovedFromFavourites({
    required QuoteDisplayedData quoteDisplayedData,
  }) : super(
          quoteDisplayedData: quoteDisplayedData,
        );
}
