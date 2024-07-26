import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sqfliteexample/UpdateProductExample.dart';
import 'package:sqfliteexample/helper/DatabaseHelper.dart';

class ViewProductExample extends StatefulWidget {
  const ViewProductExample({super.key});

  @override
  State<ViewProductExample> createState() => _ViewProductExampleState();
}

class _ViewProductExampleState extends State<ViewProductExample> {


  Future<List>? alldata;

  Future<List> getdata() async
  {
    DatabaseHelper obj = new DatabaseHelper();
    var data = await obj.allProducts();
    return data;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      alldata = getdata();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: alldata,
        builder: (index,snapshot)
        {
          if(snapshot.hasData)
            {
              if(snapshot.data!.length<=0)
                {
                  return Center(
                    child: Text("No products found!"),
                  );
                }
              else
                {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context,index)
                    {
                      return Container(
                        margin: EdgeInsets.all(10.0),
                        padding: EdgeInsets.all(10.0),
                        color: Colors.red.shade200,
                        child: Column(
                          children: [
                            Text("Product Name : "+ snapshot.data![index]["pname"].toString()),
                            Text("Product Qty : "+ snapshot.data![index]["qty"].toString()),
                            Text("Product Price : "+ snapshot.data![index]["price"].toString()),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                    onPressed: () async{

                                  var pid = snapshot.data![index]["pid"].toString();

                                  DatabaseHelper obj = new DatabaseHelper();
                                  var status = await obj.deleteProduct(pid);
                                  if(status==1)
                                    {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text("Product deleted"))
                                      );
                                      setState(() {
                                        alldata = getdata();
                                      });

                                    }
                                    else
                                      {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(content: Text("Product not deleted"))
                                        );
                                      }

                                }, child: Text("Delete")),
                                SizedBox(width: 12.0,),
                                ElevatedButton(onPressed: (){

                                  var pid = snapshot.data![index]["pid"].toString();
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> UpdateProductExample(
                                    updateid: pid,
                                  )));

                                }, child: Text("Edit")),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  );
                }
            }
          else
            {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
        },
      ),
    );
  }
}
