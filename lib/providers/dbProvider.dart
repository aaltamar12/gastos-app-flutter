import 'dart:io';
import 'package:gastos_app/models/movementModel.dart';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static final DBProvider db = DBProvider._();

  static Database? _database;

  DBProvider._();

  Future<Database> get database async {
    // If database exists, return database
    if (_database != null) return _database!;

    // If database don't exists, create one
    _database = await initDB();
    return _database!;
  }

  // Create the database and the Movement table
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'app_info.db');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE Movement('
          'id INTEGER PRIMARY KEY,'
          'description TEXT,'
          'movementType TEXT,'
          'title TEXT,'
          'value DOUBLE,'
          'userId TEXT,'
          'iconFontFamily TEXT,'
          'icon TEXT,'
          'colorCategory TEXT,'
          'createdAt DATE'
          ')');
    });
  }

  // Insert MovementModel on database
  createMovement(MovementModel newMovement) async {
    await deleteAllMovements();
    final db = await database;
    final res = await db.insert('Movement', newMovement.toJson());

    return res;
  }

  // Delete all Movements
  Future<int> deleteAllMovements() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM Movement');

    return res;
  }

  Future<List<MovementModel>> getAllMovements() async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM Movement");

    // var liste =
    //     res.isNotEmpty ? res.map((c) => print('SOY C: $c')).toList() : [];

    List<MovementModel> list = res.isNotEmpty
        ? res.map((c) => MovementModel.fromJson(c)).toList()
        : [];

    return list;
  }
}
