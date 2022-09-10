import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:starter_flutter/models/user_settings_model.dart';

class UserSettingsDatabase {
  static final UserSettingsDatabase instance = UserSettingsDatabase._init();

  static Database? _database;

  UserSettingsDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB("userSettings.db");
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    final textType = "TEXT NOT NULL";
    final boolType = "BOOLEAN NOT NULL";
    await db.execute('''
      CREATE TABLE $tableUserSettings (
      ${UserSettingsFields.id} ${idType},
      ${UserSettingsFields.sex} ${textType},
      ${UserSettingsFields.age} ${textType},
      ${UserSettingsFields.distance} ${textType},
      ${UserSettingsFields.location1} ${textType},
      ${UserSettingsFields.location2} ${textType},
      ${UserSettingsFields.location3} ${textType},
      ${UserSettingsFields.darkMode} ${boolType},
      ${UserSettingsFields.incognitoMode} ${boolType},
      )
    ''');
  }

  Future<UserSettings> create(UserSettings userSettings) async {
    final db = await instance.database;
    final id = await db.insert(tableUserSettings, userSettings.toJson());
    return userSettings.copy(id: id);
  }

  Future<UserSettings> readUserSettings(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      tableUserSettings,
      columns: UserSettingsFields.values,
      where: '${UserSettingsFields.id} = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return UserSettings.fromJson(maps.first);
    } else {
      throw Exception("ID was not found");
    }
  }

  Future<int> update(UserSettings userSettings) async {
    final db = await instance.database;

    return db.update(
      tableUserSettings,
      userSettings.toJson(),
      where: '${UserSettingsFields.id} = ?',
      whereArgs: [userSettings.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return await db.delete(
      tableUserSettings,
      where: '${UserSettingsFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
