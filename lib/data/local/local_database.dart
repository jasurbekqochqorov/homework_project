import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homework12/data/models/note_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

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
      _database = await _init("note.db");
      return _database!;
    }
  }

  //Step 4
  Future<Database> _init(String databaseName) async {
    //......Android/data
    String internalPath = await getDatabasesPath();
    //......Android/data/todo.db
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

    await db.execute('''CREATE TABLE Notes (
      _id $idType,
      title $textType,
      subtitle $textType,
      color $textType
    )''');

  }

  //------------------TASKS--------------------------------------

  static Future<NoteModel> insertTask(NoteModel noteModel) async {
    debugPrint("INITIAL ID:${noteModel.id}");
    final db = await databaseInstance.database;
    int savedTaskID =
    await db.insert('Notes', noteModel.toJson());
    debugPrint("SAVED ID:$savedTaskID");
    return noteModel.copyWith(id: savedTaskID);
  }

  static Future<List<NoteModel>> getAllTasks() async {
    final db = await databaseInstance.database;
    String orderBy = "_id DESC"; //"_id DESC"
    List json = await db.query('Notes', orderBy: orderBy);
    return json.map((e) => NoteModel.fromJson(e)).toList();
  }

  static Future<int> deleteTask(int id) async {
    final db = await databaseInstance.database;
    int deletedId = await db.delete(
      'Notes',
      where: "_id = ?",
      whereArgs: [id],
    );
    return deletedId;
  }

  static Future<int> updateTask(
      NoteModel noteModel,
      int id,
      ) async {
    debugPrint("UPDATE: ${noteModel.toJson()} ${noteModel.id}");

    final db = await databaseInstance.database;
    int updatedTaskId = await db.update(
      'Notes',
      noteModel.toJson(),
      where: "_id = ?",
      whereArgs: [id],
    );
    return updatedTaskId;
  }

  static Future<int> updateTaskStatus({
    required String newStatus,
    required int taskId,
  }) async {
    final db = await databaseInstance.database;
    int updatedTaskId = await db.update(
      "Notes",
      {'title': newStatus},
      where: "_id = ?",
      whereArgs: [taskId],
    );
    return updatedTaskId;
  }

  // static Future<List<NoteModel>> searchTasks(String query) async {
  //   final db = await databaseInstance.database;
  //   var json = await db.query(
  //     "Notes",
  //     where: "${.title} LIKE ?",
  //     whereArgs: ["$query%"],
  //   );
  //   return json.map((e) => TaskModel.fromJson(e)).toList();
  // }

//------------------CATEGORIES--------------------------------------

}
