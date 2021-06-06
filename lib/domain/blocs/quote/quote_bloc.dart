import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breaking_bad_api_flutter/domain/domain.dart';

class QuoteBloc extends Bloc<QuoteEvent, QuoteState> {
  QuoteOriginalData _quoteOriginalData;
  bool _shouldRefreshFavouriteEpisodes;
  bool get shouldRefreshFavouriteEpisodes => _shouldRefreshFavouriteEpisodes;

  QuoteBloc(QuotesTransferDto quotesTransferDto)
      : _shouldRefreshFavouriteEpisodes = false,
        _quoteOriginalData =
            QuoteOriginalData.fromQuotesTransferDto(quotesTransferDto),
        super(_emitInitialState(quotesTransferDto));

  static QuoteInitial _emitInitialState(QuotesTransferDto quotesTransferDto) =>
      QuoteInitial(
        quoteDisplayedData:
            QuoteOriginalData.fromQuotesTransferDto(quotesTransferDto)
                .convertToDisplayedData(),
      );

  @override
  Stream<QuoteState> mapEventToState(QuoteEvent event) async* {
    if (event is QuoteAddOrRemoveFromFavourites) {
      yield _processing();
      _shouldRefreshFavouriteEpisodes = !_shouldRefreshFavouriteEpisodes;
      final int quoteId = _quoteOriginalData.quote.id;
      final bool isSavedInFavourites =
          await Quote.checkIfQuoteInFavourites(quoteId);
      isSavedInFavourites
          ? await Quote.removeQuoteFromFavourites(quoteId)
          : await Quote.addQuoteToFavourites(quoteId);
      _quoteOriginalData = QuoteOriginalData(
        quote: _quoteOriginalData.quote,
        isAddedToFavourites: !isSavedInFavourites,
      );
      yield isSavedInFavourites
          ? _removedFromFavouritesEpisode()
          : _addedToFavouritesEpisode();
    }
  }

  QuoteProcessing _processing() => QuoteProcessing(
      quoteDisplayedData: _quoteOriginalData.convertToDisplayedData());

  QuoteAddedToFavourites _addedToFavouritesEpisode() => QuoteAddedToFavourites(
        quoteDisplayedData: _quoteOriginalData.convertToDisplayedData(),
      );

  QuoteRemovedFromFavourites _removedFromFavouritesEpisode() =>
      QuoteRemovedFromFavourites(
        quoteDisplayedData: _quoteOriginalData.convertToDisplayedData(),
      );
}
