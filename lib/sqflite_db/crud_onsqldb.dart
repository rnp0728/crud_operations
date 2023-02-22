import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper{

  static const dbName = 'myDatabase.db';
  static const dbVersion = 1;
  static const dbTable = 'myTable';
  static const colId = 'id';
  static const colName = 'name';

  //constructor
  static final DatabaseHelper instance = DatabaseHelper();

  //database initialization
  static Database? _database;

  Future<Database?> get database async{
    _database ??=await initDB();
    return _database;
  }

  initDB() async{
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, dbName);
    return await openDatabase(path, version: dbVersion, onCreate: onCreate);
  }

  Future onCreate(Database db, int version) async{
    db.execute(
      '''
      CREATE TABLE $dbTable(
        $colId INTEGER PRIMARY KEY,
        $colName TEXT NOT NULL
      )
      '''
    );
  }
  //insert method
  Future<int> insertRecord(Map<String, dynamic> row) async{
    Database? db = await instance.database;
    return await db!.insert(dbTable, row);
  }

  //read / query method
  Future<List<Map<String, dynamic>>> queryDatabase() async{
    Database? db = await instance.database;
    return await db!.query(dbTable);
  }

  // update method
  Future<int> updateRecord(Map<String, dynamic> row) async{
    Database? db = await instance.database;
    int id = row[colId];
    return await db!.update(dbTable, row, where: '$colId = ?', whereArgs: [id]);
  }

  //delete method
  Future<int> deleteRecord(int id) async{
    Database? db = await instance.database;
    return await db!.delete(dbTable, where: '$colId = ?', whereArgs: [id]);
  }

}