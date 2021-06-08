import 'package:breaking_bad_api_flutter/domain/domain.dart';
import 'package:equatable/equatable.dart';

class Quote extends Equatable {
  final int id;
  final String quote;
  final String author;
  static const String _WEB_POSTFIX = '/quotes';
  static const String _ID_COLUMN_NAME = 'quote_id';

  const Quote({
    required this.id,
    required this.quote,
    required this.author,
  });

  factory Quote._fromJson(Map<String, dynamic> json) => Quote(
        id: json['quote_id'],
        quote: json['quote'],
        author: json['author'],
      );

  static addQuoteToFavourites(int quoteId) => DatabaseUtility.addValue(
        quoteId,
        DbTables.FAVOURITE_QUOTES_TABLE,
      );

  static removeQuoteFromFavourites(int quoteId) => DatabaseUtility.removeValue(
        quoteId,
        DbTables.FAVOURITE_QUOTES_TABLE,
      );

  static Future<bool> checkIfQuoteInFavourites(int quoteId) async =>
      await DatabaseUtility.checkIfValueInFavourites(
          quoteId, DbTables.FAVOURITE_QUOTES_TABLE);

  static Future<List<int>> getAllFavouriteQuotesIds() async =>
      await DatabaseUtility.getValues(
        DbTables.FAVOURITE_QUOTES_TABLE,
      );

  static Future<List<Map<String, dynamic>>> getAllQuotesData() async {
    var quotesData;
    try {
      quotesData = await WebUtility.getCollectionOfData(_WEB_POSTFIX);
    } catch (exception) {
      throw 'Error occurred\n$exception';
    }
    return quotesData;
  }

  static Future<List<Map<String, dynamic>>> getQuotesDataFromIds(
      List<int> quotesIds) async {
    var quotesData;
    try {
      quotesData = await WebUtility.getCollectionOfDataForIdList(
        quotesIds,
        _ID_COLUMN_NAME,
        _WEB_POSTFIX,
      );
    } catch (exception) {
      throw 'Error occurred\n$exception';
    }
    return quotesData;
  }

  static List<Quote> getQuotesFromQuotesData(
      List<Map<String, dynamic>> quotesData) {
    final List<Quote> quotes = [];
    quotesData.forEach((element) => quotes.add(Quote._fromJson(element)));
    return quotes;
  }

  @override
  List<Object?> get props => [
        id,
        quote,
        author,
      ];
}
