import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '/classes/user.dart';

class DatabaseHandler {
  static const int _version = 1;
  static const String _dbname = "service_voice.db";

  static Future<Database> _getDB() async {
    return openDatabase(join(await getDatabasesPath(), _dbname), 
    onCreate: (db, version) async => await db.execute( 
    "create table users ( " + 
    "id                  int             PRIMARY KEY," + 
    "username         VARCHAR(255)       NOT NULL," + 
    "first_name          VARCHAR(255)    NOT NULL," + 
    "last_name           VARCHAR(255)," + 
    "email               VARCHAR(255)    NOT NULL," + 
    "password            VARCHAR(255)    NOT NULL," + 
    "profile_picture     blob            DEFAULT null)" 
    ), version: _version);
  }


  static Future<int> addUser(User newUser) async {
    print('ADD: ' + newUser.toString());
    final db = await _getDB();
    return await db.insert("users", newUser.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> updateUser(User updatedUser) async {
    final db = await _getDB();
    return await db.update("users", updatedUser.toJson(), 
    where: 'id = ?', whereArgs: [updatedUser.id], conflictAlgorithm: ConflictAlgorithm.replace );
  }

  static Future<int> deleteUser(User deletedUser) async {
    final db = await _getDB();
    return await db.delete("users", where: 'id = ?', whereArgs: [deletedUser.id]);
  }

  static Future<List<User>?> getAllUsers() async {
    final db = await _getDB();
    final List<Map<String, dynamic>> maps = await db.query("users");

    if (maps.isEmpty) {
      return null;
    } 
    return List.generate(maps.length, (index) => User.fromJson(maps[index]));
  }

  static void deleteDatabases() {
    deleteDatabase(_dbname);
    }
}