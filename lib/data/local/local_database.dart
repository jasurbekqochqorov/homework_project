import 'package:flutter/cupertino.dart';
import 'package:homework12/data/models/currency_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDatabase {
  //Step 1
  static final databaseInstance = LocalDatabase._();

  LocalDatabase._();

  factory LocalDatabase() {
    return databaseInstance;
  }

  //-----
  //Step 2
  Database? _database;

  //Step 3
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _init("currency.db");
      return _database!;
    }
  }

  //Step 4
  Future<Database> _init(String databaseName) async {
    //......Android/data
    String internalPath = await getDatabasesPath();
    //......Android/data/tod.db
    String path = join(internalPath, databaseName);
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  //--------------------------READY TO USE------------------------

  Future<void> _onCreate(Database db, int version) async {
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const textType = "TEXT NOT NULL";
    const intType = "INTEGER DEFAULT 0";

    await db.execute('''CREATE TABLE Currency(
      title $textType,
      code $textType,
      cb_price $textType,
      date $textType,
      nbu_cell_price $textType,
      nbu_buy_price $textType
    )''');
    debugPrint("DDDDDd");
  }
  //------------------TASKS--------------------------------------

  static Future<void> insertTask(List<CurrencyModel> currencyModel) async {
    final db = await databaseInstance.database;
    debugPrint("SAVED LOCAL DATABASE 1");
    var v=currencyModel.map((e)async{
      await db.insert("Currency", e.toJson());
    });
    debugPrint("SAVED LOCAL DATABASE 1 ${v.length}");

  }
  static Future<List<CurrencyModel>> getAllCurrency() async {
    final db = await databaseInstance.database;
    String orderBy = "title DESC";
    List json = await db.query("Currency",orderBy: orderBy);
    debugPrint("AA${json.length}");
    return json.map((e) => CurrencyModel.fromJson(e)).toList();
  }

  // static Future<int> updateTask(
  //     CurrencyModel taskModel,
  //     int id,
  //     ) async {
  //   debugPrint("UPDATE: ${taskModel.toJson()} ${taskModel.id}");
  //
  //   final db = await databaseInstance.database;
  //   int updatedTaskId = await db.update(
  //     TaskModelConstants.tableName,
  //     taskModel.toJson(),
  //     where: "${TaskModelConstants.id} = ?",
  //     whereArgs: [id],
  //   );
  //   return updatedTaskId;
  // }

  // static Future<int> updateTaskStatus({
  //   required String newStatus,
  //   required int taskId,
  // }) async {
  //   final db = await databaseInstance.database;
  //   int updatedTaskId = await db.update(
  //     TaskModelConstants.tableName,
  //     {TaskModelConstants.status: newStatus},
  //     where: "${TaskModelConstants.id} = ?",
  //     whereArgs: [taskId],
  //   );
  //   return updatedTaskId;
  // }
  //
  // static Future<List<TaskModel>> searchTasks(String query) async {
  //   final db = await databaseInstance.database;
  //   var json = await db.query(
  //     TaskModelConstants.tableName,
  //     where: "${TaskModelConstants.title} LIKE ?",
  //     whereArgs: ["$query%"],
  //   );
  //   return json.map((e) => TaskModel.fromJson(e)).toList();
  // }

//------------------CATEGORIES--------------------------------------

}
