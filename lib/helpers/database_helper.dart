import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  //DB needs to be a singleton, this is a way to create singletons
  DatabaseHelper._createInstance(); //1. create a private named-constructor
  static final DatabaseHelper instance =
      DatabaseHelper._createInstance(); //2.Create a singleton instance

  static const _dbName = "";
  static const _progressTableName = "progress";
  static const _letterColumnName = "letter";
  static const _passColumnName = "pass";

  static Database _sqfliteDatabase;

  Future<Database> get getDB async {
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
        $_passColumnName BOOLEAN,
      )
      ''');
  }
}
