import 'package:breaking_bad_api_flutter/domain/blocs/blocs.dart';
import 'package:breaking_bad_api_flutter/domain/models/models.dart';
import 'package:breaking_bad_api_flutter/ui/strings/strings.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("QuoteOriginalData tests", () {
    late int id;
    late bool isAddedToFavourites;
    late String author;
    late String quoteContent;
    late String favouritesButtonLabel;
    late Quote quote;
    late QuotesTransferDto quotesTransferDto;
    late QuoteOriginalData quoteOriginalData;
    late QuoteDisplayedData quoteDisplayedData;

    setUp(() {
      id = -1;
      isAddedToFavourites = false;
      author = "";
      quoteContent = "";
      favouritesButtonLabel = isAddedToFavourites == false
          ? AppLabels.AddToFavourites
          : AppLabels.RemoveFromFavourites;
      quote = Quote(
        id: id,
        author: author,
        quote: quoteContent,
      );
      quotesTransferDto = QuotesTransferDto(
        quote: quote,
        isAddedToFavourites: isAddedToFavourites,
      );
      quoteOriginalData = QuoteOriginalData(
        quote: quote,
        isAddedToFavourites: isAddedToFavourites,
      );
      quoteDisplayedData = QuoteDisplayedData(
        author: author,
        content: quoteContent,
        favouritesButtonLabel: favouritesButtonLabel,
      );
    });

    test("Create QuoteOriginalData from mock QuotesTransferDto", () {
      QuoteOriginalData quoteOriginalDataTest =
          QuoteOriginalData.fromQuotesTransferDto(quotesTransferDto);
      expect(quoteOriginalData, quoteOriginalDataTest);
    });

    test("Convert mock QuoteOriginalData to QuoteDisplayedData", () {
      QuoteDisplayedData quoteDisplayedDataTest =
          quoteOriginalData.convertToDisplayedData();
      expect(quoteDisplayedData, quoteDisplayedDataTest);
    });
  });
}
