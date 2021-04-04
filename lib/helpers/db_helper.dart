import 'package:foodies/models/models.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static late DatabaseHelper? _databaseHelper;
  static late Database? _database;

  DatabaseHelper._createObject();

  factory DatabaseHelper() {
    _databaseHelper ??= DatabaseHelper._createObject();
    return _databaseHelper!;
  }

  static const String _tblFavorite = 'favorites';

  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      '$path/foodies.db',
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE $_tblFavorite (
          id TEXT PRIMARY KEY,
          name TEXT,
          city TEXT,
          description TEXT,
          pictureId TEXT,
          rating DOUBLE
        )''');
      },
      version: 1,
    );
    return db;
  }

  Future<Database> get database async {
    _database ??= await _initializeDb();
    return _database!;
  }

  Future<void> insertFavorite(Restaurant restaurant) async {
    final db = await database;
    await db.insert(_tblFavorite, restaurant.toJson());
  }

  Future<List<Restaurant>> getFavorite() async {
    final db = await database;
    List<Map<String, dynamic>> results = await db.query(_tblFavorite);
    return results.map((e) => Restaurant.fromJson(e)).toList();
  }

  Future<Map> getFavoriteById(String id) async {
    final db = await database;

    List<Map<String, dynamic>> results = await db.query(
      _tblFavorite,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return {};
    }
  }

  Future<void> removeFavorite(String id) async {
    final db = await database;

    await db.delete(
      _tblFavorite,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
