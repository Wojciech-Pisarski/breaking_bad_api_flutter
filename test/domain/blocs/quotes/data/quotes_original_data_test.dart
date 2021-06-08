import 'package:breaking_bad_api_flutter/domain/blocs/blocs.dart';
import 'package:breaking_bad_api_flutter/domain/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("QuotesOriginalData tests", () {
    late int id = -1;
    late String author = "";
    late String quoteContent = "";
    late Quote quote;
    late QuoteToDisplay quoteToDisplay;
    late QuotesDisplayedData quotesDisplayedData;
    late QuotesOriginalData quotesOriginalData;

    setUp(() {
      id = -1;
      author = "";
      quoteContent = "";
      quote = Quote(
        id: id,
        author: author,
        quote: quoteContent,
      );
      quoteToDisplay = QuoteToDisplay(
        id: id,
        label: quoteContent,
      );
      quotesDisplayedData = QuotesDisplayedData(
        quotesToDisplay: [quoteToDisplay],
      );
      quotesOriginalData = QuotesOriginalData(
        quotes: [quote],
      );
    });

    test("Convert mock QuotesOriginalData to QuotesDisplayedData", () {
      QuotesDisplayedData quotesDisplayedDataTest =
          quotesOriginalData.convertToDisplayedData();
      expect(quotesDisplayedData, quotesDisplayedDataTest);
    });
  });
}
