import 'dart:convert';

import 'package:sqflite/sqflite.dart';
import 'package:todo_apps/models/task.dart';
import 'package:todo_apps/ui/signin/modal/signup-modal.dart';

class DBHelper {
  static Database? _database;
  static const int _version = 1;
  static const String _tableName = 'tasks';
  static const String _dbName = 'todo.db';

  static Future<void> initDb() async {
    if (_database != null) {
      return;
    }
    try {
      String path = await getDatabasesPath() + _dbName;

      _database = await openDatabase(
        path,
        version: _version,
        onCreate: (db, version) async{
          // print('Creating table name ->  $_tableName');
           await db.execute(
            'CREATE TABLE $_tableName (id INTEGER PRIMARY KEY AUTOINCREMENT, title STRING, note TEXT, date STRING, startTime STRING, endTime STRING, remind INTEGER, repeat STRING, color INTEGER, isCompleted INTEGER, completedAt STRING, createdAt STRING, updatedAt STRING)',
          );

           await db.execute('CREATE TABLE IF NOT EXISTS userDetails(userName STRING PRIMARY KEY, firstName STRING, lastName STRING, password VARCHAR)');
        },
      );
    } catch (e) {
      // print(e);
    }
  }


  void insertUser(SignupForm user)async{
    _database?.execute(
        'INSERT OR REPLACE INTO userDetails(userName, firstName, lastName, password) VALUES (?, ?, ?, ?)',
        [
          user.userName,
          user.firstName,
          user.lastName,
          user.password,
        ]);
  }

  List<SignupForm> getUser(){
    var tempData = _database?.execute("");
    var data = signupFormFromJson(jsonEncode(tempData));
    return data;
  }

  static Future<int> insert(Task task) async {
    // print('Inserting data to $_tableName');
    try {
      // print(task.toJson());
      return await _database!.insert(_tableName, task.toJson());
    } catch (e) {
      // print(e);
      return 0;
    }
  }

  static Future<List<Map<String, dynamic>>> query() async {
    // print('Querying data from $_tableName ');
    try {
      return await _database!.query(_tableName);
    } catch (e) {
      // print(e);
      return [];
    }
  }

  static Future<int> delete(int id) async {
    // print('Deleting data from $_tableName with id ===> $id');
    try {
      return await _database!.delete(
        _tableName,
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e) {
      // print(e);
      return 0;
    }
  }

  static updateTask(int id, bool isCompleted) async {
    // print('Updating data from $_tableName with id ===> $id');

    int isComplete = isCompleted ? 1 : 0;
    try {
      return await _database!.rawUpdate('''
      UPDATE $_tableName 
      SET isCompleted = ?, completedAt = ?
      WHERE id = ?
    ''', [isComplete, DateTime.now().toIso8601String(), id]);
    } catch (e) {
      // print(e);
      return 0;
    }
  }

  static Future<int> updateTaskInfo(Task task) async {
    // print('Updating data from $_tableName with id ===> ${task.id}');
    try {
      return await _database!.rawUpdate(
        '''
      UPDATE $_tableName
      SET title = ?, note = ?, date = ?, startTime = ?, endTime = ?, remind = ?, repeat = ?, color = ?, isCompleted = ?, createdAt = ?, updatedAt = ?, completedAt = ?
      WHERE id = ?
      ''',
        [
          task.title,
          task.note,
          task.date,
          task.startTime,
          task.endTime,
          task.remind,
          task.repeat,
          task.color,
          task.isCompleted,
          task.createdAt,
          task.updatedAt,
          task.completedAt,
          task.id
        ],
      );
    } catch (e) {
      // print(e);
      return 0;
    }
  }
}
