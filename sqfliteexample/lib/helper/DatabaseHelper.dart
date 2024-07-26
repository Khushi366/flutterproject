import 'dart:developer';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class DatabaseHelper
{

  Database? db;

  Future<Database> create_db() async
  {
    if(db==null)
      {
        //db not available - create
        Directory dir = await getApplicationDocumentsDirectory();
        String dbpath = join(dir.path,"shoppingdb");
        var db = await openDatabase(dbpath,version: 1,onCreate:execute);
        return db;
      }
    else
      {
        //db already available
        return db!;
      }
  }

  execute(Database db,int version)
  {
    //Create Table
    //Product
    db.execute("create table product (pid integer primary key autoincrement,pname text,qty integer,price double)");
    db.execute("create table employee (eid integer primary key autoincrement, name text, salary double, gender text, department text)");

    log("Table Created");
    //db.execute("create");
  }






  Future<int> insertproduct(name,qty,price) async
  {
    //Database Create
    var db = await create_db();
    //insert
   // var id = await db.rawInsert("insert into product (pname,qty,price) values (?,?,?)",[name,qty,price]);

    Map<String,dynamic> params = {
      "pname":name,
      "qty":qty,
      "price":price
    };
    var id = await db.insert("product", params);
    return id;
  }



  Future<List> allProducts() async
  {
    var db = await create_db();
    var result = await db.rawQuery("select * from product");
    //var result = await db.query("product",columns: ["qty","price"]);
    return result.toList();
  }


  Future<int> deleteProduct(pid) async
  {
    var db = await create_db();
    var status = await db.rawDelete("delete from product where pid=?",[pid]);
    return status;
  }

  Future<List> getSingleProduct(pid) async
  {
    var db = await create_db();
    var result = await db.rawQuery("select * from product where pid=?",[pid]);
    return result.toList();
  }

  Future<int> updateProduct(name,qty,price,pid) async
  {
    var db = await create_db();
    var status = await db.rawUpdate("update product set pname=?,qty=?,price=? where pid=?",[name,qty,price,pid]);
    return status;
  }


  Future<int> insertEmployee(empName, empSalary, empGender, empDepartment) async
  {

    var db = await create_db();
    //var id  = await db.rawInsert("insert into employee (name, salary, gender, product) values (?,?,?,?)",[empName, empSalary, empGender, empProduct]);
    Map<String,dynamic> empparams = {
      "name":empName,
      "salary":empSalary,
      "gender":empGender,
      "department":empDepartment,
    };
    var id = await db.insert("employee", empparams);
    return id;
  }

 Future<List>allEmployee()async
  {
    var db = await create_db();
    var result = await db.rawQuery("select * from employee");

    return result.toList();
  }

  deleteEmployee(eid)async
  {
    var db = await create_db();
    var status = await db.rawDelete("delete from employee where eid=?",[eid]);
    return status;

  }

 Future<List> getSingleEmployee(eid) async
  {
    var db = await create_db();
    var result = await db.rawQuery("select * from employee where eid=?",[eid]);
    return result.toList();
  }


  Future<int>updateEmployee(empName, empSalary, empGender, empDepartment, eid)async
  {
    var db = await create_db();
    var status = await db.rawUpdate("update employee set name=?,salary=?,gender=?, department=? where eid=?",[empName, empSalary, empGender, empDepartment,eid]);
    return status;
  }




}