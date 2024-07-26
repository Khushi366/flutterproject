import 'package:flutter/material.dart';
import 'package:sqfliteexample/ViewProductExample.dart';

import 'helper/DatabaseHelper.dart';

class UpdateProductExample extends StatefulWidget {


  var updateid="";
  UpdateProductExample({required this.updateid});


  @override
  State<UpdateProductExample> createState() => _UpdateProductExampleState();
}

class _UpdateProductExampleState extends State<UpdateProductExample> {

  TextEditingController _name = TextEditingController();
  TextEditingController _qty = TextEditingController();
  TextEditingController _price = TextEditingController();


  getdata() async
  {
    DatabaseHelper obj = new DatabaseHelper();
    var data = await obj.getSingleProduct(widget.updateid);


    setState(() {
      _name.text = data[0]["pname"].toString();
      _qty.text = data[0]["qty"].toString();
      _price.text = data[0]["price"].toString();
    });


  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
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
              Center(child: Text("Edit Product",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),)),


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

                      var status = await obj.updateProduct(name,qty,price,widget.updateid);

                      if(status==1)
                        {
                          Navigator.of(context).pop();//edit
                          Navigator.of(context).pop();//view
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context)=>ViewProductExample())
                          );
                        }
                      else
                        {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Error!"))
                            );
                        }


                      // if(id>=1)
                      // {
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //       SnackBar(content: Text("Product Inserted : " + id.toString()))
                      //   );
                      //   _name.text = "";
                      //   _qty.text = "";
                      //   _price.text = "";
                      // }
                      // else
                      // {
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //       SnackBar(content: Text("Error!"))
                      //   );
                      // }
                    }, child: Text("Edit")
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
