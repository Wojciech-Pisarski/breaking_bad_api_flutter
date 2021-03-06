import 'package:breaking_bad_api_flutter/domain/models/models.dart';
import 'package:breaking_bad_api_flutter/domain/domain.dart';
import 'data.dart';

class QuotesOriginalData {
  final List<Quote> quotes;
  late Quote quote;

  QuotesOriginalData({
    required this.quotes,
  });

  QuotesOriginalData.fromFavouritesTransferDto(
    FavouritesTransferDto? favouritesTransferDto,
  ) : quotes = favouritesTransferDto?.quotes ?? [];

  QuotesDisplayedData convertToDisplayedData() => QuotesDisplayedData(
        quotesToDisplay: quotes.map(_convertQuoteToDisplayedQuote).toList(),
      );

  QuoteToDisplay _convertQuoteToDisplayedQuote(Quote quote) => QuoteToDisplay(
        id: quote.id,
        label: '${quote.quote}',
      );
}
