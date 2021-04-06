import 'package:breaking_bad_api_flutter/domain/domain.dart';

class Quote {
  final int id;
  final String quote;
  final String author;

  const Quote({
    required this.id,
    required this.quote,
    required this.author,
  });

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        id: json['quote_id'],
        quote: json['quote'],
        author: json['author'],
      );

  static Future<Quote> getQuoteById(int quoteId) async =>
      await WebUtility.getQuoteById(quoteId);

  static Future<List<Quote>> getAllQuotes() async =>
      await WebUtility.getAllQuotes();
}
