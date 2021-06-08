import 'package:breaking_bad_api_flutter/domain/blocs/blocs.dart';
import 'package:breaking_bad_api_flutter/domain/models/quote.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('QuotesBloc tests', () {
    late int id = -1;
    late String quoteContent = "";
    late String author = "";
    late Quote quote;
    late QuoteToDisplay quoteToDisplay;
    late QuotesDisplayedData quotesDisplayedData;
    late FavouritesTransferDto favouritesTransferDto;
    late QuotesBloc quotesBlocFromFavouritesTransferDto;
    late QuotesBloc quotesBloc;

    setUp(() {
      id = -1;
      quoteContent = "";
      author = "";
      quote = Quote(
        id: id,
        quote: quoteContent,
        author: author,
      );
      quoteToDisplay = QuoteToDisplay(
        id: id,
        label: quoteContent,
      );
      quotesDisplayedData = QuotesDisplayedData(
        quotesToDisplay: [quoteToDisplay],
      );
      favouritesTransferDto = FavouritesTransferDto(
        quotes: [quote],
      );
      quotesBlocFromFavouritesTransferDto =
          QuotesBloc(favouritesTransferDto: favouritesTransferDto);
      quotesBloc = QuotesBloc();
    });

    test(
        'initial state of QuoteBloc built using FavouritesTransferDto is QuotesInitialFromFavouritesDto',
        () => expect(
            quotesBlocFromFavouritesTransferDto.state,
            QuotesInitialFromFavouritesDto(
                quotesDisplayedData: quotesDisplayedData)));
    test(
        'initial state of QuoteBloc built without FavouritesTransferDto is QuotesInitial',
        () => expect(quotesBloc.state, QuotesInitial()));
  });
}
