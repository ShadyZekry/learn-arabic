import 'package:learn_arabic/helpers/database_helper.dart';

class DatabaseManager {
  static DatabaseHelper _dbHelper = DatabaseHelper.instance;

  static Future<Map<String, dynamic>> getProgress() async {
    List<Map<String, dynamic>> progressTable =
        await _dbHelper.getTable("progress");

    if (progressTable == null) return {};

    return progressTable[0];
  }

  static void passLevel(String letter) async {
    _dbHelper.update("progress", "letter", letter, {"pass": true});
  }
}
