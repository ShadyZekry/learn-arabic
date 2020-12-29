import 'package:learn_arabic/helpers/database_helper.dart';

class DatabaseManager {
  static DatabaseHelper _dbHelper = DatabaseHelper.instance;

  static Future<List<Map<String, dynamic>>> getProgress() async {
    List<Map<String, dynamic>> _progressTable =
        await _dbHelper.getTable("progress");

    return _progressTable;
  }

  static void passDragLevel(String letter) async {
    _dbHelper.update("progress", "letter", letter, {"pass_drag": true});
    updateScore();
  }

  static void passChooseLevel(String letter) async {
    _dbHelper.update("progress", "letter", letter, {"pass_choose": true});
    updateScore();
  }

  static Future<List<Map<String, dynamic>>> getIncompleteChooseLevels() async {
    return _dbHelper
        .query("progress", where: "pass_choose = ?", whereArgs: ["0"]);
  }

  static Future<List<Map<String, dynamic>>> getIncompleteDragLevels() async {
    return _dbHelper
        .query("progress", where: "pass_drag = ?", whereArgs: ["0"]);
  }

  static void updateScore() async {
    int myScore = await getScore();
    DatabaseHelper.instance.updateScore((myScore + 10).toString());
  }

  static Future<int> getScore() async {
    List<Map<String, dynamic>> _miscTable = await _dbHelper.getTable("misc");
    return _miscTable[0]["score"];
  }
}
