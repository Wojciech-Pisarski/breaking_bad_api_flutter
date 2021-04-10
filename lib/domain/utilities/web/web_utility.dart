import 'dart:async';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'web.dart';

abstract class WebUtility {
  static const String _HTTPS_PREFIX = 'https://';
  static const String _BASE_URL = 'www.breakingbadapi.com/api';
  static const String _BREAKING_BAD_SERIES_CHOICE = '?series=Breaking+Bad';

  static Future<List<Map<String, dynamic>>> getCollectionOfData(
      String postfix) async {
    var response;
    try {
      response = await http
          .get(Uri.parse(
              '$_HTTPS_PREFIX$_BASE_URL$postfix$_BREAKING_BAD_SERIES_CHOICE'))
          .timeout(TimeoutDuration);
      if (response.statusCode != 200) {
        throw 'API response code: ${response.statusCode}';
      }
    } on TimeoutException catch (exception) {
      throw 'Timeout exception: $exception';
    } catch (exception) {
      throw exception;
    }
    List<Map<String, dynamic>> objectsData = [];
    jsonDecode(response.body).forEach((element) => objectsData.add(element));
    return objectsData;
  }

  static Future<List<Map<String, dynamic>>> getCollectionOfDataForIdList(
    List<int> ids,
    String idColumnName,
    String postfix,
  ) async {
    var response;
    try {
      response = await http
          .get(Uri.parse(
              '$_HTTPS_PREFIX$_BASE_URL$postfix$_BREAKING_BAD_SERIES_CHOICE'))
          .timeout(TimeoutDuration);
      if (response.statusCode != 200) {
        throw 'API response code: ${response.statusCode}';
      }
    } on TimeoutException catch (exception) {
      throw 'Timeout exception: $exception';
    } catch (exception) {
      throw exception;
    }
    List<Map<String, dynamic>> objectsData = [];
    jsonDecode(response.body).forEach(
      (element) {
        if (ids.contains(element[idColumnName])) {
          objectsData.add(element);
        }
      },
    );
    return objectsData;
  }
}
