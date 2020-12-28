import 'package:learn_arabic/helpers/database_helper.dart';

class DatabaseManager {
  static DatabaseHelper _dbHelper = DatabaseHelper.instance;

  static Future<List<Map<String, dynamic>>> getProgress() async {
    return _dbHelper.getTable("progress");
  }

  static void passDragLevel(String letter) async {
    _dbHelper.update("progress", "letter", letter, {"pass_drag": true});
  }

  static void passChooseLevel(String letter) async {
    _dbHelper.update("progress", "letter", letter, {"pass_choose": true});
  }

  static Future<List<Map<String, dynamic>>> getIncompleteChooseLevels(
      String letter) async {
    return _dbHelper
        .query("progress", where: "pass_choose = ?", whereArgs: ["0"]);
  }

  static Future<List<Map<String, dynamic>>> getIncompleteDragLevels(
      String letter) async {
    return _dbHelper
        .query("progress", where: "pass_drag = ?", whereArgs: ["0"]);
  }

  static Future<int> getScore() async {
    List<Map<String, dynamic>> _miscTable = await _dbHelper.getTable("misc");
    return _miscTable[0]["score"];
  }
}
