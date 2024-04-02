import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/place_model.dart';

class MyAppConstants {
  static const String placeTableName = "places_table";
}

class PlaceModelConstants {
  static const String id = "place_id";
  static const String placeName = "place_name";
  static const String placeCategory = "place_category";
  static const String lat = "place_lat";
  static const String long = "place_long";
  static const String entrance = "place_entrance";
  static const String flatNumber = "place_flatNumber";
  static const String orientAddress = "place_orientAddress";
  static const String stage = "place_stage";
}

class LocalDatabase {
  static final databaseInstance = LocalDatabase._();

  LocalDatabase._();

  factory LocalDatabase() {
    return databaseInstance;
  }

  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _init("places.db");
      return _database!;
    }
  }

  Future<Database> _init(String databaseName) async {
    String internalPath = await getDatabasesPath();
    String path = join(internalPath, databaseName);
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const textType = "TEXT NOT NULL";
    const textType2 = 'TEXT';

    await db.execute('''CREATE TABLE ${MyAppConstants.placeTableName} (
      ${PlaceModelConstants.id} $idType,
       ${PlaceModelConstants.placeCategory} $textType,
      ${PlaceModelConstants.placeName} $textType,
      ${PlaceModelConstants.lat} $textType,
      ${PlaceModelConstants.long} $textType,
      ${PlaceModelConstants.entrance} $textType2,
      ${PlaceModelConstants.flatNumber} $textType2,
      ${PlaceModelConstants.orientAddress} $textType2,
      ${PlaceModelConstants.stage} $textType2
    )''');
  }

  static Future<PlaceModel> insertPlace(PlaceModel placeModel) async {
    final db = await databaseInstance.database;
    int savedTaskID =
    await db.insert(MyAppConstants.placeTableName, placeModel.toJson());
    debugPrint("SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+savedTaskID.toString());
    return placeModel;
  }

  static Future<List<PlaceModel>> getAllItems() async {
    final db = await databaseInstance.database;
    String orderBy = '${PlaceModelConstants.id} DESC';
    List<Map<String, dynamic>> json =
    await db.query(MyAppConstants.placeTableName, orderBy: orderBy);
    return json.map((e) => PlaceModel.fromJson(e)).toList();
  }

  static Future<void> updatePlace(PlaceModel placeModel,int id) async {
    final db = await databaseInstance.database;
    await db.update(
      MyAppConstants.placeTableName,
      placeModel.toJson(),// Convert the PlaceModel to a map
      where: '${PlaceModelConstants.id} = ?',
      whereArgs: [id],
    );
    debugPrint("Update successfully");
    // debugPrint(place.id.toString());
  }

  static Future<int> deleteTask(int id) async {
    final db = await databaseInstance.database;
    int deletedId = await db.delete(
      MyAppConstants.placeTableName,
      where: "${PlaceModelConstants.id} = ?",
      whereArgs: [id],
    );
    return deletedId;
  }


}



// import 'package:flutter/cupertino.dart';
// import 'package:homework12/data/models/place_model.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
//
//
// class LocalDatabase {
//   static final databaseInstance = LocalDatabase._();
//
//   LocalDatabase._();
//
//   factory LocalDatabase(){
//     return databaseInstance;
//   }
//
//   Database? _database;
//
//   Future<Database> get database async {
//     if (_database != null) {
//       return _database!;
//     }
//     else {
//       _database = await _init("map.db");
//       return _database!;
//     }
//   }
//
//   Future<Database> _init(String databaseName) async{
//     String internalPath=await getDatabasesPath();
//     String path=join(internalPath,databaseName);
//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: _onCreate,
//     );
//   }
//
//   Future<void> _onCreate(Database db, int version) async {
//     const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
//     const textType = 'TEXT NOT NULL';
//     const realType = 'REAL DEFAULT 0.0';
//     await db.execute('''CREATE TABLE  MAPS(
//       _id $idType,
//       place_name $textType,
//       place_category $textType,
//       entrance $textType,
//       stage $textType,
//       flat_number $textType,
//       orient_address $textType,
//       lat $realType,
//       lng $realType
//       )''');
//   }
//
//   // -------------------------tasks----------------
//   static Future<PlaceModel> insertTask(PlaceModel placeModel) async {
//     debugPrint("Initial id:${placeModel.id}");
//     final db = await databaseInstance.database;
//     int savedTaskId = await db.insert('MAPS',placeModel.toJson());
//     debugPrint("saved id:$savedTaskId");
//     debugPrint("Initial id:${placeModel.id}");
//     return placeModel.copyWith(id: savedTaskId);
//   }
//
//   static Future<List<PlaceModel>> getAllTask() async {
//     final db = await databaseInstance.database;
//     String orderBy = "${'_id'} DESC";
//
//     List json = await db.query('MAPS', orderBy: orderBy);
//     return json.map((e) => PlaceModel.fromJson(e)).toList();
//   }
//
//   static Future<int> deleteTask(int id) async {
//     final db = await databaseInstance.database;
//     int deletedId = await db.delete(
//       'Maps',
//       where: "_id = ?",
//       whereArgs: [id],
//     );
//     return deletedId;
//   }
//
//
//   static Future<int> updateTask(PlaceModel placeModel, int id) async {
//     final db = await databaseInstance.database;
//     int updatedId = await db.update(
//         "MAPS",
//         placeModel.toJson(),
//         where: "_id = ?",
//         whereArgs: [id]);
//
//     return updatedId;
//   }
//
//   static Future<int> updateTaskStatus({
//     required String newCategory,
//     required int taskId,
//   }) async {
//     final db = await databaseInstance.database;
//     int updatedId = await db.update(
//         'MAPS',
//         {
//           "place_category": newCategory
//         },
//         where: "_id = ?",
//         whereArgs: [taskId]);
//
//     return updatedId;
//   }
// }
//
//
