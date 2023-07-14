import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

Map<int, String> scripts = {
  1: ''' CREATE TABLE pesagens (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    peso REAL,
    altura REAL,
    dataPesagem TEXT,
    resultadoImc REAL
  );''',
};

class SQLiteDataBase {
  static Database? db;
  Future<Database> obterDataBase() async {
    if (db == null) {
      return await iniciarBancoDeDados();
    } else {
      return db!;
    }
  }

  static Future<Database> iniciarBancoDeDados() async {
    var db = await openDatabase(
      path.join(
        await getDatabasesPath(),
        'database.db',
      ),
      version: scripts.length,
      onCreate: (Database db, int version) async {
        for (var i = 1; i <= scripts.length; i++) {
          await db.execute(scripts[i]!);
        }
      },
      onUpgrade: (Database db, int oldVersion, int newVersion) async {
        for (var i = oldVersion + 1; i <= scripts.length; i++) {
          await db.execute(scripts[i]!);
        }
      },
    );
    return db;
  }
}
