import 'package:flutter/cupertino.dart';
import 'package:homework12/data/models/place_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class LocalDatabase {
  static final databaseInstance = LocalDatabase._();

  LocalDatabase._();

  factory LocalDatabase(){
    return databaseInstance;
  }

  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    else {
      _database = await _init("map.db");
      return _database!;
    }
  }

  Future<Database> _init(String databaseName) async{
    String internalPath=await getDatabasesPath();
    String path=join(internalPath,databaseName);
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const intType = 'INTEGER DEFAULT 0';
    await db.execute('''CREATE TABLE Maps (
      _id $idType,
      place_name $textType,
      place_category $textType,
      entrance $textType,
      stage $textType,
      flat_number $textType,
      orient_address $textType,
      lat $intType,
      lng $intType
      )''');
  }

  // -------------------------tasks----------------
  static Future<PlaceModel> insertTask(PlaceModel placeModel) async {
    debugPrint("Initial id:${placeModel.id}");
    final db = await databaseInstance.database;
    int savedTaskId = await db.insert('Maps',placeModel.toJson());
    debugPrint("saved id:$savedTaskId");
    debugPrint("Initial id:${placeModel.id}");
    return placeModel.copyWith(id: savedTaskId);
  }

  static Future<List<PlaceModel>> getAllTask() async {
    final db = await databaseInstance.database;
    String orderBy = "${'_id'} DESC";

    List json = await db.query('Maps', orderBy: orderBy);
    return json.map((e) => PlaceModel.fromJson(e)).toList();
  }

  static Future<int> deleteTask(int id) async {
    final db = await databaseInstance.database;
    int deletedId = await db.delete(
      'Maps',
      where: "_id = ?",
      whereArgs: [id],
    );
    return deletedId;
  }


  static Future<int> updateTask(PlaceModel placeModel, int id) async {
    final db = await databaseInstance.database;
    int updatedId = await db.update(
        "Maps",
        placeModel.toJson(),
        where: "_id = ?",
        whereArgs: [id]);

    return updatedId;
  }

  static Future<int> updateTaskStatus({
    required String newCategory,
    required int taskId,
  }) async {
    final db = await databaseInstance.database;
    int updatedId = await db.update(
        'Maps',
        {
          "place_category": newCategory
        },
        where: "_id = ?",
        whereArgs: [taskId]);

    return updatedId;
  }
}


