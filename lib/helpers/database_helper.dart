import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  //DB needs to be a singleton, this is a way to create singletons
  DatabaseHelper._createInstance(); //1. create a private named-constructor
  static final DatabaseHelper instance =
      DatabaseHelper._createInstance(); //2.Create a singleton instance

  final _dbName = "MyDB";
  final _progressTableName = "progress";
  final _miscTableName = "misc";
  final _letterColumnName = "letter";
  final _passColumnName = "pass";
  final _scoreColumnName = "score";

  Database _sqfliteDatabase;
  Future<Database> get _db async {
    // If you have an existing DB return it, else open it from the device
    if (_sqfliteDatabase != null) return _sqfliteDatabase;

    return await _openDB();
  }

  Future<Database> _openDB() async {
    final Database db = await openDatabase(
      //first parameter is the database path on device disk
      join(await getDatabasesPath(), _dbName),
      // 'onCreate' is called if the database doesn't exist
      onCreate: _onCreateDB,
      version: 1,
    );

    return db;
  }

  void _onCreateDB(Database db, int version) async {
    // Run the CREATE TABLE statement on the database.
    await db.execute('''
      CREATE TABLE $_progressTableName (
        $_letterColumnName TEXT NOT NULL PRIMARY KEY,
        $_passColumnName BOOLEAN
      );
      CREATE TABLE $_miscTableName (
        $_scoreColumnName INT NOT NULL = 0 
      ''');

    db.insert(_progressTableName, _initProgressMap());
  }

  void insert(String tableName, Map<String, dynamic> row) async {
    Database _db = await instance._db;
    await _db.insert(tableName, row);
  }

  void update(
    String tableName,
    String columnName,
    String columnValue,
    Map<String, dynamic> newValues,
  ) async {
    Database _db = await instance._db;
    await _db.update(tableName, newValues,
        where: '$columnName = ?', whereArgs: [columnValue]);
  }

  void delete(String tableName, String columnName, dynamic columnValue) async {
    Database _db = await instance._db;
    await _db
        .delete(tableName, where: '$columnName = ?', whereArgs: [columnValue]);
  }

  Future<List<Map<String, dynamic>>> getTable(String tableName) async {
    Database _db = await instance._db;
    return await _db.query(tableName);
  }

  Map<String, bool> _initProgressMap() {
    return {
      'أ': false,
      'ب': false,
      'ت': false,
      'ث': false,
      'ج': false,
      'ح': false,
      'خ': false,
      'د': false,
      'ذ': false,
      'ر': false,
      'ز': false,
      'س': false,
      'ش': false,
      'ص': false,
      'ض': false,
      'ط': false,
      'ظ': false,
      'ع': false,
      'غ': false,
      'ف': false,
      'ق': false,
      'ك': false,
      'ل': false,
      'م': false,
      'ن': false,
      'ه': false,
      'و': false,
      'ي': false,
    };
  }
}
