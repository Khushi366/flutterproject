import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:propsmart/helper/ApiHandler.dart';
import 'package:propsmart/models/Product.dart';
import 'package:propsmart/providers/ProductProvider.dart';
import 'package:propsmart/resources/UrlResources.dart';
import 'package:propsmart/views/product/ViewProduct2.dart';
import 'package:provider/provider.dart';

import '../../helper/ErrorHandler.dart';
import 'EditProduct.dart';

class ViewProduct extends StatefulWidget {
  const ViewProduct({super.key});

  @override
  State<ViewProduct> createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {


  ProductProvider? provider;


  getdata()async
  {
    await provider!.getAllProducts();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<ProductProvider>(context,listen: false);
    getdata();
  }
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<ProductProvider>(context,listen: true);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF233645),
          title: Text("All Products",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 16.0),),
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: true,
          actions: [
            IconButton(onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=>ViewProduct2())
              );
            }, icon: Icon(Icons.access_time_filled))
          ],
        ),
        body: (provider!.alldata == null)? Center(child: CircularProgressIndicator(color:Color(0xFF233645),),)
            :(provider!.alldata!.length <=0)
            ? Center(child: Text("No data"),)
            : ListView.builder(
            itemCount: provider!.alldata!.length,
            itemBuilder: (context,index){
              return Container(
                  margin: EdgeInsets.all(8.0),
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Color(0xFFF4F4F4).withOpacity(0.4),
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(""+provider!.alldata![index].pname.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                          GestureDetector(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EditProduct(
                                    id:provider!.alldata![index].pid.toString()
                                )));
                              },
                              child: Icon(Icons.edit_outlined,color: Color(0xFF233645),size: 20.0,)),
                          GestureDetector(
                              onTap: (){
                                showDialog(
                                    context: context,
                                  builder: (BuildContext contex)
                                  {
                                    return AlertDialog(
                                      title: Text("Delete Message",style: TextStyle(color: Color(0xFF233645),),),
                                      content: Text("Are you sure you want to delete this message?",style: TextStyle(color: Color(0xFF233645),),),

                                      backgroundColor: Colors.white,
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("Cancel",style: TextStyle(color: Color(0xFF233645),fontWeight: FontWeight.bold),),
                                        ),
                                        TextButton(
                                          onPressed: ()async{
                                            var pid = provider!.alldata![index].pid.toString();
                                            var params = {
                                              "pid": pid
                                            };
                                            await provider!.deleteProduct(context, params);
                                            if(provider!.isdelete==true)
                                              {
                                                Navigator.of(context).pop();
                                              }

                                            // var pid = alldata![index].pid.toString();
                                            // var params = {
                                            //   "pid": pid
                                            // };
                                            // Uri url = Uri.parse("https://studiogo.tech/student/studentapi/deleteProductNormal.php");
                                            //
                                            // var response = await http.post(url,body: params);
                                            // if(response.statusCode == 200)
                                            //   {
                                            //     var json  = jsonDecode(response.body.toString());
                                            //     if(json["status"]=="true")
                                            //     {
                                            //       getdata();
                                            //       Navigator.of(context).pop();
                                            //     }
                                            //
                                            //   }
                                          },
                                          child: Text("Delete",style: TextStyle(color: Color(0xFF233645),fontWeight: FontWeight.bold),),
                                        ),

                                      ],
                                    );
                                  }
                                );
                              },
                              child: Icon(Icons.delete_outline,color: Color(0xFF233645),size: 20.0,))
                        ],
                      ),
                      SizedBox(height: 8.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Qty: "+provider!.alldata![index].qty.toString(),
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          Text("Price: "+provider!.alldata![index].price.toString(),
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          Text("Date: "+provider!.alldata![index].addedDatetime.toString(),
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
              );

            }

        )
    );
  }
}
