import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'web.dart';

abstract class WebUtility {
  static const String _HTTPS_PREFIX = 'https://';
  static const String _BASE_URL = 'breakingbadapi.com/api';
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

  static Future<String> downloadImageFromUrl(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      String imageName = path.basename(url);
      if (!imageName.endsWith(".jpg")) imageName = imageName + ".jpg";
      final appDir = await pathProvider.getExternalStorageDirectory();
      late final localPath;
      if (appDir == null)
        throw Exception("Could retrieve app's directory!");
      else
        localPath = path.join("${appDir.path}", imageName);
      final imageFile = File(localPath);
      imageFile.writeAsBytesSync(response.bodyBytes);
    } catch (e) {
      return e.toString();
    }
    return ("Downloaded");
  }
}
