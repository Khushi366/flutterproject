

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sqfliteexample/helper/DatabaseHelper.dart';

class AddProductExample extends StatefulWidget {
  const AddProductExample({super.key});

  @override
  State<AddProductExample> createState() => _AddProductExampleState();
}

class _AddProductExampleState extends State<AddProductExample> {


  TextEditingController _name = TextEditingController();
  TextEditingController _qty = TextEditingController();
  TextEditingController _price = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              SizedBox(height: 10.0,),
              Center(child: Text("Add Product",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),)),


              SizedBox(height: 20),
              TextField(
                controller: _name,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Name",
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _qty,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Qty",
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _price,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Price",
                ),
              ),
              SizedBox(height: 20),

              Container(
                width: 200.0,
                child: ElevatedButton(
                    onPressed: () async{

                     var name = _name.text.toString();
                     var qty = _qty.text.toString();
                     var price = _price.text.toString();


                     DatabaseHelper obj = new DatabaseHelper();
                     var id = await obj.insertproduct(name,qty,price);

                     if(id>=1)
                       {
                         ScaffoldMessenger.of(context).showSnackBar(
                           SnackBar(content: Text("Product Inserted : " + id.toString()))
                         );
                         _name.text = "";
                         _qty.text = "";
                         _price.text = "";
                       }
                     else
                       {
                         ScaffoldMessenger.of(context).showSnackBar(
                             SnackBar(content: Text("Error!"))
                         );
                       }


                   }, child: Text("Add")
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
