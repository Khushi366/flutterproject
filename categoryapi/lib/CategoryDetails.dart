import 'dart:convert';
import 'dart:developer';

import 'package:categoryapi/Model/Product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class CategoryDetails extends StatefulWidget {
  var cname ="";
  CategoryDetails({required this.cname});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {

List<Products>? alldata;
bool isLoading = true;


  getdata()async
  {
    Uri url = Uri.parse("https://dummyjson.com/products/category/"+widget.cname.toString());
    var response = await http.get(url);
    if(response.statusCode == 200)
      {
        var body = response.body.toString();
        log(body);
        var json = jsonDecode(body);
        setState(() {
          alldata  =  json["products"].map<Products>((obj)=> Products.fromJson(obj)).toList();
          isLoading = false;

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
        title: Text("Details"),
        centerTitle: true,
      ),
      body:isLoading?Center(child: CircularProgressIndicator(),)
      :ListView.builder(
          itemCount: alldata!.length,
          itemBuilder: (context,index){
            return Column(
              children: [
                Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(alldata![index].thumbnail.toString(),),
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("" +alldata![index].category.toString()),

                        ],
                      ),
                      Row(
                        children: [
                          Text("Brand: " + alldata![index].brand.toString()),
                        ],
                      ),
                      Row(
                        children: [
                          Text("₹" + alldata![index].price.toString()),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(child: Text("" +alldata![index].description.toString())),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Image.network("" + alldata![index].images![0].toString())),
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

                // Image.network(alldata![index].thumbnail.toString())

              ],

            );

        },
      )
    );
  }
}
