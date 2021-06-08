import 'package:breaking_bad_api_flutter/domain/blocs/blocs.dart';
import 'package:breaking_bad_api_flutter/domain/models/quote.dart';
import 'package:breaking_bad_api_flutter/ui/strings/strings.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('QuoteBloc tests', () {
    late int id;
    late bool isAddedToFavourites;
    late String quoteContent;
    late String author;
    late String favouritesButtonLabel;
    late Quote quote;
    late QuoteDisplayedData quoteDisplayedData;
    late QuotesTransferDto quotesTransferDto;
    late QuoteBloc quoteBloc;

    setUp(() {
      id = -1;
      isAddedToFavourites = false;
      quoteContent = "";
      author = "";
      favouritesButtonLabel = isAddedToFavourites == false
          ? AppLabels.AddToFavourites
          : AppLabels.RemoveFromFavourites;
      quote = Quote(
        id: id,
        quote: quoteContent,
        author: author,
      );
      quoteDisplayedData = QuoteDisplayedData(
        content: quoteContent,
        author: author,
        favouritesButtonLabel: favouritesButtonLabel,
      );
      quotesTransferDto = QuotesTransferDto(
        quote: quote,
        isAddedToFavourites: isAddedToFavourites,
      );
      quoteBloc = QuoteBloc(quotesTransferDto);
    });

    test(
        'initial state of a QuoteBloc built using SeasonsTransferDto is QuoteInitial',
        () => expect(quoteBloc.state,
            QuoteInitial(quoteDisplayedData: quoteDisplayedData)));
  });
}
