import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/jog_model.dart';

class JogsDatabaseHelper {
  JogsDatabaseHelper._init();

  static final JogsDatabaseHelper instanceJogHelper =
      JogsDatabaseHelper._init();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initializeDB('jogs.db');
    return _database!;
  }

  Future<Database> _initializeDB(String filePath) async {
    final path = join(await getDatabasesPath(), filePath);
    return openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';

    await db.execute('''
CREATE TABLE $tableJogs ( 
  ${JogFields.id} $idType, 
  ${JogFields.title} $textType,
  ${JogFields.description} $textType,
  ${JogFields.time} $textType
  )
''');
  }

  Future<Jog> createJog(Jog jog) async {
    final db = await instanceJogHelper.database;
    final id = await db.insert(tableJogs, jog.toJson());
    return jog.copy(id: id);
  }

  Future<Jog> readJog(int id) async {
    final db = await instanceJogHelper.database;

    final maps = await db.query(
      tableJogs,
      columns: JogFields.values,
      where: '${JogFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Jog.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Jog>> readAllJogs() async {
    final db = await instanceJogHelper.database;
    final orderBy = '${JogFields.time} ASC';
    final result = await db.query(tableJogs, orderBy: orderBy);
    return result.map(Jog.fromJson).toList();
  }

  Future<int> update(Jog jog) async {
    final db = await instanceJogHelper.database;

    return db.update(
      tableJogs,
      jog.toJson(),
      where: '${JogFields.id} = ?',
      whereArgs: [jog.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instanceJogHelper.database;

    return db.delete(
      tableJogs,
      where: '${JogFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instanceJogHelper.database;
    db.close();
  }
}
