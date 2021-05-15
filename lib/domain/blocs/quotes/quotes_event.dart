class QuotesEvent {
  const QuotesEvent();
}

class QuotesRefreshQuotes extends QuotesEvent {
  const QuotesRefreshQuotes();
}

class QuotesChooseQuote extends QuotesEvent {
  final int quoteId;

  const QuotesChooseQuote({
    required this.quoteId,
  });
}
