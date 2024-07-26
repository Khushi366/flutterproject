
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {


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

                      var nm = _name.text.toString();
                      var q = _qty.text.toString();
                      var p = _price.text.toString();

                      var params = {
                        "pname":nm,
                        "qty":q,
                        "price":p
                      };
                      
                      
                      Uri url = Uri.parse("https://studiogo.tech/student/studentapi/insertProductNormal.php");
                      var response = await http.post(url,body: params);
                      if(response.statusCode==200)
                        {
                          var json = jsonDecode(response.body.toString());
                          if(json["status"]=="true")
                            {
                              var message = json["message"];
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(message),backgroundColor: Colors.green,)
                              );

                              _name.text = "";
                              _qty.text = "";
                              _price.text = "";
                            }
                          else
                            {
                              var message = json["message"];
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(message),backgroundColor: Colors.red,)
                              );
                            }
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
