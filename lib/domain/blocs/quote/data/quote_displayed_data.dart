import 'package:equatable/equatable.dart';

class QuoteDisplayedData extends Equatable {
  final String content;
  final String author;
  final String favouritesButtonLabel;

  const QuoteDisplayedData({
    required this.content,
    required this.author,
    required this.favouritesButtonLabel,
  });

  @override
  List<Object?> get props => [
        content,
        author,
        favouritesButtonLabel,
      ];
}
