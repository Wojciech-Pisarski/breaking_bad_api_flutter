import 'package:breaking_bad_api_flutter/domain/domain.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

abstract class DatabaseUtility {
  static late Database _database;
  static const String _databaseName = 'users_favourites_db.db';
  static const int _databaseVersion = 1;

  static initializeDatabase() async {
    final databasePath = join(await getDatabasesPath(), _databaseName);
    _database = await openDatabase(
      databasePath,
      onCreate: (db, version) async {
        await db.execute(
            """CREATE TABLE ${DbTablesStrings[DbTables.FAVOURITE_EPISODES_TABLE]} 
            (id INTEGER PRIMARY KEY AUTOINCREMENT, 
            ${DbColumnsStrings[DbTables.FAVOURITE_EPISODES_TABLE]} INTEGER NOT NULL)
            """);
        await db.execute(
            """CREATE TABLE ${DbTablesStrings[DbTables.FAVOURITE_QUOTES_TABLE]} 
            (id INTEGER PRIMARY KEY AUTOINCREMENT, 
            ${DbColumnsStrings[DbTables.FAVOURITE_QUOTES_TABLE]} INTEGER NOT NULL)
            """);
        await db.execute(
            """CREATE TABLE ${DbTablesStrings[DbTables.FAVOURITE_CHARACTERS_TABLE]} 
            (id INTEGER PRIMARY KEY AUTOINCREMENT, 
            ${DbColumnsStrings[DbTables.FAVOURITE_CHARACTERS_TABLE]} INTEGER NOT NULL)""");
      },
      version: _databaseVersion,
    );
  }

  static Future<int?> _verifyIfValuesIsInDb(int id, DbTables table) async {
    final columnName = DbColumnsStrings[table]!;
    final List<Map<String, dynamic>> futureValues = await _database.query(
      DbTablesStrings[table]!,
      where: '$columnName = ?',
      whereArgs: [id],
    );
    return futureValues.isNotEmpty
        ? futureValues.first[DbColumnsStrings[table]]
        : null;
  }

  static Future<List<int>> getValues(DbTables table) async {
    final List<Map<String, dynamic>> maps =
        await _database.query(DbTablesStrings[table]!);
    return List.generate(maps.length, (i) {
      return maps[i][DbColumnsStrings[table]];
    });
  }

  static Future<void> addValue(int id, DbTables table) async {
    final databaseObjectId = await _verifyIfValuesIsInDb(id, table);
    if (databaseObjectId == null) {
      await _database.insert(
        '${DbTablesStrings[table]}',
        {
          'id': null,
          '${DbColumnsStrings[table]}': id,
        },
      );
    }
  }

  static Future<void> removeValue(int id, DbTables table) async {
    final databaseObject = await _verifyIfValuesIsInDb(id, table);
    if (databaseObject != null) {
      await _database.delete(
        '${DbTablesStrings[table]}',
        where: '${DbColumnsStrings[table]} = ?',
        whereArgs: [id],
      );
    }
  }

  static Future<bool> checkIfValueInFavourites(int id, DbTables table) async {
    final databaseObject = await _verifyIfValuesIsInDb(id, table);
    return databaseObject != null;
  }
}
