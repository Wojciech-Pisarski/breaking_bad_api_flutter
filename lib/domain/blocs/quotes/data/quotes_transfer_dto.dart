import 'package:breaking_bad_api_flutter/domain/domain.dart';

class QuotesTransferDto {
  final Quote quote;
  final bool isAddedToFavourites;

  const QuotesTransferDto({
    required this.quote,
    required this.isAddedToFavourites,
  });
}
