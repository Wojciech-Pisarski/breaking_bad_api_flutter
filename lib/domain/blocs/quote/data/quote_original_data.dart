import 'package:breaking_bad_api_flutter/domain/blocs/blocs.dart';
import 'package:breaking_bad_api_flutter/domain/models/models.dart';
import 'package:breaking_bad_api_flutter/ui/strings/strings.dart';
import 'package:breaking_bad_api_flutter/ui/ui.dart';
import 'package:equatable/equatable.dart';

class QuoteOriginalData extends Equatable {
  final Quote quote;
  final bool isAddedToFavourites;

  QuoteOriginalData({
    required this.quote,
    required this.isAddedToFavourites,
  });

  QuoteOriginalData.fromQuotesTransferDto(
    QuotesTransferDto quotesTransferDto,
  )   : quote = quotesTransferDto.quote,
        isAddedToFavourites = quotesTransferDto.isAddedToFavourites;

  QuoteDisplayedData convertToDisplayedData() => QuoteDisplayedData(
        content: quote.quote,
        author: quote.author,
        favouritesButtonLabel: isAddedToFavourites == false
            ? AppLabels.AddToFavourites
            : AppLabels.RemoveFromFavourites,
      );

  @override
  List<Object?> get props => [
        quote,
        isAddedToFavourites,
      ];
}
