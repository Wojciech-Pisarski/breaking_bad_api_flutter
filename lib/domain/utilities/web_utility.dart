import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:breaking_bad_api_flutter/domain/domain.dart';

abstract class WebUtility {
  static const String _HTTPS_PREFIX = 'https://';
  static const String _BASE_URL = 'www.breakingbadapi.com/api';
  static const String _CHARACTERS_POSTFIX = '/characters';
  static const String _DEATH_POSTFIX = '/death';
  static const String _EPISODES_POSTFIX = '/episodes';
  static const String _QUOTES_POSTFIX = '/quotes';
  static const String _BREAKING_BAD_SERIES_CHOICE = '?series=Breaking+Bad';

  static Future<Character> getCharacterById(int characterId) async {
    final response = await http.get(
        Uri.parse('$_HTTPS_PREFIX$_BASE_URL$_CHARACTERS_POSTFIX/$characterId'));
    if (response.statusCode == 200) {
      return Character.fromJson(jsonDecode(response.body)[0]);
    } else
      throw 'Error: response code ${response.statusCode}';
  }

  static Future<Death> getDeathForNameAndSurname(
    String name,
    String surname,
  ) async {
    final response = await http.get(Uri.parse(
        '$_HTTPS_PREFIX$_BASE_URL$_DEATH_POSTFIX?name=$name+$surname'));
    if (response.statusCode == 200) {
      return Death.fromJson(jsonDecode(response.body)[0]);
    } else
      throw 'Error: response code ${response.statusCode}';
  }

  static Future<Episode> getEpisodeById(int episodeId) async {
    final response = await http.get(
        Uri.parse('$_HTTPS_PREFIX$_BASE_URL$_EPISODES_POSTFIX/$episodeId'));
    if (response.statusCode == 200) {
      return Episode.fromJson(jsonDecode(response.body)[0]);
    } else
      throw 'Error: response code ${response.statusCode}';
  }

  static Future<Quote> getQuoteById(int quoteId) async {
    final response = await http
        .get(Uri.parse('$_HTTPS_PREFIX$_BASE_URL$_QUOTES_POSTFIX/$quoteId'));
    if (response.statusCode == 200) {
      return Quote.fromJson(jsonDecode(response.body)[0]);
    } else
      throw 'Error: response code ${response.statusCode}';
  }

  static Future<List<Character>> getAllCharacters() async {
    final response = await http
        .get(Uri.parse('$_HTTPS_PREFIX$_BASE_URL$_CHARACTERS_POSTFIX'));
    if (response.statusCode == 200) {
      List<Character> characterList = [];
      (jsonDecode(response.body))
          .forEach((element) => characterList.add(Character.fromJson(element)));
      return characterList;
    } else
      throw 'Error: response code ${response.statusCode}';
  }

  static Future<List<Death>> getAllDeaths() async {
    final response =
        await http.get(Uri.parse('$_HTTPS_PREFIX$_BASE_URL$_DEATH_POSTFIX'));
    if (response.statusCode == 200) {
      List<Death> deathsList = [];
      (jsonDecode(response.body))
          .forEach((element) => deathsList.add(Death.fromJson(element)));
      return deathsList;
    } else
      throw 'Error: response code ${response.statusCode}';
  }

  static Future<List<Episode>> getAllEpisodesForSeasonNumber(
      int seasonNumber) async {
    final response = await http.get(Uri.parse(
        '$_HTTPS_PREFIX$_BASE_URL$_EPISODES_POSTFIX$_BREAKING_BAD_SERIES_CHOICE'));
    if (response.statusCode == 200) {
      List<Episode> episodesList = [];
      (jsonDecode(response.body))
          .forEach((element) => episodesList.add(Episode.fromJson(element)));
      return episodesList
          .where((element) => element.season == seasonNumber.toString())
          .toList();
    } else
      throw 'Error: response code ${response.statusCode}';
  }

  static Future<List<Quote>> getAllQuotes() async {
    final response = await http.get(Uri.parse(
        '$_HTTPS_PREFIX$_BASE_URL$_QUOTES_POSTFIX$_BREAKING_BAD_SERIES_CHOICE'));
    if (response.statusCode == 200) {
      List<Quote> quotesList = [];
      (jsonDecode(response.body))
          .forEach((element) => quotesList.add(Quote.fromJson(element)));
      return quotesList;
    } else
      throw 'Error: response code ${response.statusCode}';
  }
}
