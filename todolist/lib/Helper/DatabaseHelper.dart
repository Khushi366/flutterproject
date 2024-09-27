
import 'dart:developer';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class DatabaseHelper{

  Database ? db;
  // Create the database
  Future<Database> create_db()async
  {
    if(db == null)
    {
      // Database not available - create
      Directory dir = await getApplicationDocumentsDirectory();
      String dbpath = join(dir.path,"taskdb");
      var db = openDatabase(dbpath,version: 2,onCreate: execute,onUpgrade: upgrade);
      return db;
    }
    else
    {
      //db already available
      return db!;
    }
  }
  // Execute the database creation logic
  execute(Database db, int version)
  {
    db.execute("create table newtask (tid integer primary key autoincrement, title text, remark text,completed integer default 0)");
    log("Table Created");
  }

  // Upgrade the database schema if needed
  void upgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute("ALTER TABLE newtask ADD COLUMN completed INTEGER DEFAULT 0");
      log("Database upgraded to version $newVersion: 'completed' column added.");
    }
  }

  // Insert a new task into the database
  Future<int> insertTask(title,remark) async
  {
    var db = await create_db();
    // Parameters to be inserted
    Map<String,dynamic> params = {
      "title":title,
      "remark":remark
    };
    // Insert the task and return its ID
    var id = await db.insert("newtask", params);
    return id;
  }

  // Retrieve all tasks from the database
  Future<List> allTask() async
  {
    var db = await create_db();
    // Execute a query to select all tasks
    var result = await db.rawQuery("select * from newtask");
    return result.toList();// Convert result to list
  }

  // Delete a task from the database using its ID
  Future<int> deleteTask(tid) async
  {
    var db = await create_db();
    var status = await db.rawDelete("delete from newtask where tid=?",[tid]);
    return status;// Return the status of the deletion
  }

  // Retrieve a single task for editing using its ID
  Future<List> getSingleTask(tid) async
  {
    var db = await create_db();
    // Execute a query to select the task
    var result = await db.rawQuery("select * from newtask where tid=?",[tid]);
    return result.toList();// Convert result to list
  }

  // Update a task's title and remark using its ID
  Future<int> updateTask(title,remark,tid) async
  {
    var db = await create_db();
    // Execute an update query
    var status = await db.rawUpdate("update newtask set title=?,remark=? where tid=?",[title,remark,tid]);
    return status;// Return the status of the update
  }

  // Update the completion status of a task
  Future<int> updateTaskCompletion(int tid, bool isCompleted) async {
    var db = await create_db();
    int completedValue = isCompleted ? 1 : 0; // 1 for completed, 0 for not completed
    // Execute an update query to set the completion status
    var status = await db.rawUpdate(
        "update newtask set completed=? where tid=?", [completedValue, tid]);
    return status; // Return the status of the update
  }
}