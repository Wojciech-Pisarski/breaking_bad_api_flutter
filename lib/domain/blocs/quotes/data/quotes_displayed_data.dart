import 'package:equatable/equatable.dart';

import 'data.dart';

class QuotesDisplayedData extends Equatable {
  final List<QuoteToDisplay> quotesToDisplay;

  const QuotesDisplayedData({
    required this.quotesToDisplay,
  });

  @override
  List<Object?> get props => [quotesToDisplay];
}
