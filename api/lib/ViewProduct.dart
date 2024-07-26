import 'dart:convert';

import 'package:api/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'EditProduct.dart';

class ViewProduct extends StatefulWidget {
  const ViewProduct({super.key});

  @override
  State<ViewProduct> createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {

  List<Product>?alldata;
  getdata()async
  {

    Uri url = Uri.parse("https://studiogo.tech/student/studentapi/getProducts.php");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var body = response.body.toString();
      print("Data : " + body);
      var json = jsonDecode(body);
      // return json["data"];

      setState(() {
        alldata = json["data"].map<Product>((obj)=> Product.fromJson(obj)).toList();

      });
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: (alldata == null)? Center(child: CircularProgressIndicator(),):(alldata!.length <=0)? Center(child: Text("No data"),)
            : Column(
          children: [
            SizedBox(height: 30.0,),
            Text('Product List',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),),
            Expanded(
                child:  ListView.builder(
                    itemCount: alldata!.length,
                    itemBuilder: (context,index)
                    {
                      return Container(
                        margin: EdgeInsets.all(8.0),
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text("Product: "+alldata![index].pname.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.0,
                                    ),),
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                        onTap:(){
                                          // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EditProduct(
                                          //   obj:alldata![index]
                                          // )));

                                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EditProduct(
                                            id:alldata![index].pid.toString()
                                          )));

                                        },
                                        child: Icon(Icons.edit_outlined,color: Color(0xFF65819D),size: 20.0,)),
                                    GestureDetector(
                                        onTap:(){
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context)
                                              {

                                                return AlertDialog(
                                                  title: Text("Delete Message"),
                                                  content: Text("Are you sure you want to delete this message?"),

                                                  actions: [

                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context).pop();
                                                      },
                                                      child: Text("Cancel"),
                                                    ),
                                                    TextButton(
                                                      onPressed: ()  async{
                                                        
                                                        
                                                        var pid = alldata![index].pid.toString();
                                                        
                                                        var params = {
                                                          "pid":pid
                                                        };
                                                        
                                                        Uri url = Uri.parse("https://studiogo.tech/student/studentapi/deleteProductNormal.php");
                                                        var response = await http.post(url,body: params);

                                                        if(response.statusCode==200)
                                                          {
                                                            var json = jsonDecode(response.body.toString());
                                                            if(json["status"]=="true")
                                                              {
                                                                getdata();
                                                                Navigator.of(context).pop();
                                                              }
                                                          }
                                                        

                                                      },
                                                      child: Text("Delete"),
                                                    ),
                                                  ],

                                                );
                                              }
                                          );

                                        },
                                        child: Icon(Icons.delete_outline,color: Color(0xFF65819D),size: 20.0,))
                                  ],
                                ),

                              ],
                            ),
                            SizedBox(height: 8.0,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Qty: "+alldata![index].qty.toString(),
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                Text("Price: "+alldata![index].price.toString(),
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                Text("Date: "+alldata![index].addedDatetime.toString(),
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }
                )
            )
          ],
        )
    );
  }
}
