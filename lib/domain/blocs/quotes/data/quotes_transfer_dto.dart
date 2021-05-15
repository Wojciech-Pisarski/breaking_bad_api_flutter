import 'package:breaking_bad_api_flutter/domain/domain.dart';

class QuotesTransferDto {
  final List<Quote> quotes;

  const QuotesTransferDto({
    required this.quotes,
  });
}
