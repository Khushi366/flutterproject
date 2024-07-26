 import 'dart:developer';
import 'dart:io';
 import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper
 {
    Database? db;

   Future<Database>create_db()async
    {

      if(db == null)
      {
        //db not available - create
        Directory dir = await getApplicationDocumentsDirectory();
        String dbpath = join(dir.path, "expensedb");
        var db = await openDatabase(dbpath, version: 1,onCreate: execute);
        return db;
      }
      else
      {
        // db already available
        return db!;
      }
    }

    execute(Database db, int version)
    {
      db.execute("create table transactions(tid integer primary key autoincrement,types text,title text,remark text,amt double,dates text)");
      log("Table Created");
    }


   Future<int> insertTransaction(types,title,remark,amt,dates)async
    {
      //Database Create
      var db = await create_db();

      Map<String,dynamic>params ={

        "types":types,
        "title":title,
        "remark":remark,
        "amt":amt,
        "dates":dates
      };
      var id = await db.insert("transactions",params);
      return id;
    }


   Future<List> allTransactions(type)async
    {
      var db = await create_db();
      var result;
      if(type=="all")
        {
           result = await db.rawQuery("select * from transactions");
        }
      else if(type=="Income")
        {
           result = await db.rawQuery("select * from transactions where types='Income'");
        }
      else
        {
           result = await db.rawQuery("select * from transactions where types='Expense'");
        }
      return result.toList();
    }

  Future<int>deleteTransaction(tid)async
    {

      var db = await create_db();

      var status  = await db.rawDelete("delete from transactions where tid=?",[tid]);
      return status;
    }

   Future<List> getSingleExpense(tid)async
    {
      var db = await create_db();

     var result = await db.rawQuery("select * from transactions where tid=?",[tid]);
     return result.toList();
    }


    Future<int> updateTransactions(types,title,remark,amt,dates,tid) async
    {
      var db = await create_db();
      var status = await db.rawUpdate("update transactions set types=?,title=?,remark=?,amt=?,dates=? where tid=?",[types,title,remark,amt,dates,tid]);
      return status;
    }

 }