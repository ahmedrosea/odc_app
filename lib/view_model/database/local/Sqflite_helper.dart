import 'package:sqflite/sqflite.dart' as sqflite;

class SqfliteHelper {
  static late sqflite.Database database;

  static init() async {
    database = await sqflite.openDatabase('notes.db', version: 1,
        onCreate: (database, version) async {
      await database.execute(
          'CREATE TABLE Notes (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, title TEXT, date TEXT, note TEXT)');
    });
  }

  static Future<void> addNote(Map<String, dynamic> note) async {
    await SqfliteHelper.init();
    await database.insert('Notes', note);
  }

  static Future<List<Map<String, dynamic>>> getAllNotes() async {
    await SqfliteHelper.init();
    return await database.rawQuery('SELECT * FROM Notes');
  }

  static deleteAllNotes() async {
    await SqfliteHelper.init();
    await database.delete('Notes');
  }
}
