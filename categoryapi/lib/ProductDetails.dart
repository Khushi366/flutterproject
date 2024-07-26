import 'dart:convert';
import 'dart:developer';

import 'package:categoryapi/Model/Product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class ProductDetails extends StatefulWidget {

  var pid ="";
  ProductDetails({required this.pid});


  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

//  var name = "";
  bool isloading = true;

  Products? obj;

  getdata()async
   {
     setState(() {
       isloading = true;
     });
     Uri url = Uri.parse("https://dummyjson.com/products/"+widget.pid.toString());
     var response  =  await http.get(url);

     if(response.statusCode == 200)
       {
         var body = response.body.toString();
         log(body.toString());
         var json = jsonDecode(body);
         setState(() {
           obj = Products.fromJson(json);
          // name = json["title"].toString();
           isloading = false;
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
      appBar: AppBar(
        title: Text("Products"),
        centerTitle: true,
      ),
      body: (isloading)?Center(child: CircularProgressIndicator(),):SingleChildScrollView(
        child: Column(
          children: [

            Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(obj!.thumbnail.toString(),),
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("" + obj!.category.toString()),

                    ],
                  ),
                  Row(
                    children: [
                      Text("Brand: " + obj!.brand.toString()),
                    ],
                  ),
                  Row(
                    children: [
                      Text("₹" + obj!.price.toString()),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: Text("" + obj!.description.toString())),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Image.network("" + obj!.images![0].toString())),
                    ],
                  ),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //         child: Image.network("" + obj!.images![1].toString())),
                  //   ],
                  // ),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //         child: Image.network("" + obj!.images![2].toString())),
                  //   ],
                  // ),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //         child: Image.network("" + obj!.images![3].toString())),
                  //   ],
                  // ),
                  //


                ],
              ),
            ),

            // Image.network(alldata!.title.toString())

          ],
        ),
      ),

    );
  }
}
