import 'dart:convert';

import 'package:api/ViewProduct.dart';
import 'package:api/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditProduct extends StatefulWidget {
  // Product obj;
  // EditProduct({required this.obj});

  var id;
  EditProduct({required this.id});


  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {


  TextEditingController _name = TextEditingController();
  TextEditingController _qty = TextEditingController();
  TextEditingController _price = TextEditingController();

  getdata() async{
    Uri url = Uri.parse("https://studiogo.tech/student/studentapi/getSingleProduct.php");
    var params = {
      "pid":widget.id.toString()
    };
    var response = await http.post(url,body: params);
    if(response.statusCode==200)
      {
        var json = jsonDecode(response.body.toString());
        _name.text = json["data"]["pname"].toString();
        _qty.text = json["data"]["qty"].toString();
        _price.text = json["data"]["price"].toString();
      }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getdata();

    // _name.text = widget.obj.pname.toString();
    // _qty.text = widget.obj.qty.toString();
    // _price.text = widget.obj.price.toString();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              SizedBox(height: 10.0,),
              Center(child: Text("Edit Product", style: TextStyle(
                  fontSize: 18.0, fontWeight: FontWeight.bold),)),


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
                    onPressed: () async {


                      var nm = _name.text.toString();
                      var q = _qty.text.toString();
                      var p = _price.text.toString();

                      var params = {
                        "pname":nm,
                        "qty":q,
                        "price":p,
                        "pid":widget.id.toString()
                      };


                      Uri url = Uri.parse("https://studiogo.tech/student/studentapi/updateProductNormal.php");
                      var response = await http.post(url,body: params);
                      if(response.statusCode==200)
                      {
                        var json = jsonDecode(response.body.toString());
                        if(json["status"]=="true")
                        {
                          var message = json["message"];
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context)=>ViewProduct())
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(message),backgroundColor: Colors.green,)
                          );
                        }
                        else
                        {
                          var message = json["message"];
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(message),backgroundColor: Colors.red,)
                          );
                        }
                      }

                    }, child: Text("Save")
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
