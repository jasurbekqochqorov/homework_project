import 'package:flutter/cupertino.dart';
import 'package:homework12/data/model/coffee_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';



class LocalDatabase{
  static final databaseInstance=LocalDatabase._();
  LocalDatabase._();

  factory LocalDatabase(){
    return databaseInstance;
  }

  Database? _database;

  Future<Database> get database async{
    if(_database!=null){
      return _database!;
    }
    else{
      _database=await _init("Coffee.db");
      return  _database!;
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

  Future<void> _onCreate(Database db,int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const intType = 'INTEGER DEFAULT 0';

    await db.execute('''CREATE TABLE 'Coffee' (
      'id' $idType,
      "subtitle" $textType,
      'description $textType,
      'image' $textType,
      'name' $textType,
      'categoryId' $intType,
      'price' $intType,
      'rate' $intType,
      'type' $textType
      )''');
  }
  // -------------------------coffee----------------
    static Future<CoffeeModel> insertTask(CoffeeModel coffeeModel) async{
    debugPrint("Initial id:${coffeeModel.id}");
    final db=await databaseInstance.database;
    int savedTaskId=await db.insert('Coffee',coffeeModel.toJson());
    debugPrint("saved id:$savedTaskId");
    debugPrint("Initial id:${coffeeModel.id}");
    return coffeeModel.copyWith(id: savedTaskId);
  }

  static Future<List<CoffeeModel>> getAllTask() async{
    final db=await databaseInstance.database;
    String orderBy="${'id'} DESC";

    List json=await db.query('Coffee',orderBy: orderBy);
    return json.map((e) => CoffeeModel.fromJson(e)).toList();
  }

  // static Future<int> deleteTask(int id) async {
  //   final db=await databaseInstance.database;
  //   int deletedId=await db.delete(
  //     TaskModelConstants.tableName,
  //     where:"${TaskModelConstants.id} = ?",
  //     whereArgs: [id],
  //   );
  //   return deletedId;
  // }

}