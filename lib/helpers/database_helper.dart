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
  final _passChooseColumn = "pass_choose";
  final _passDragColumn = "pass_drag";
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
        $_passChooseColumn BOOLEAN DEFAULT 0,
        $_passDragColumn BOOLEAN DEFAULT 0
      )
      ''');

    await db.execute('''
      CREATE TABLE $_miscTableName (
        $_scoreColumnName INT NOT NULL DEFAULT 0
      )
      ''');

    await _initProgressMap(db);
    await db.insert(_miscTableName, {_scoreColumnName: 0});
  }

  Future<void> _initProgressMap(Database db) async {
    String values = characters.fold('', (previousValue, char) {
      String addition = '';
      if (previousValue != '') addition += ',';
      return "$previousValue$addition\n('$char', 0, 0)";
    });

    // fill table values
    await db.execute('''
        INSERT INTO $_progressTableName ($_letterColumnName, $_passChooseColumn, $_passDragColumn)
        VALUES  $values;
    ''');
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

  void updateScore(String newScore) async {
    Database _db = await instance._db;
    await _db.update(
      _miscTableName,
      {_scoreColumnName: newScore},
    );
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

  Future<List<Map<String, dynamic>>> query(
    String tableName, {
    List<String> columns,
    String where,
    List<String> whereArgs,
  }) async {
    Database _db = await instance._db;
    return await _db.query(tableName,
        columns: columns, where: where, whereArgs: whereArgs);
  }

  static List<String> characters = [
    'أ',
    'ب',
    'ت',
    'ث',
    'ج',
    'ح',
    'خ',
    'د',
    'ذ',
    'ر',
    'ز',
    'س',
    'ش',
    'ص',
    'ض',
    'ط',
    'ظ',
    'ع',
    'غ',
    'ف',
    'ق',
    'ك',
    'ل',
    'م',
    'ن',
    'ه',
    'و',
    'ي',
  ];
}
