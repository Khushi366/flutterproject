
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:getxproject/SupportPage.dart';
import 'package:http/http.dart'as http;

import 'models/Product.dart';

class DioExample extends StatefulWidget {
  const DioExample({super.key});

  @override
  State<DioExample> createState() => _DioExampleState();
}

class _DioExampleState extends State<DioExample> {
  List<Product>?allData;
  final dio = Dio(BaseOptions(
    baseUrl: 'https://studiogo.tech/student/studentapi',
  ));
  getData()async{
    try {
    var response = await dio.get('/getProducts.php');
    if(response.statusCode==200)
      {
        var json = jsonDecode(response.data);
        setState(() {
          allData = json["data"].map<Product>((obj)=> Product.fromJson(obj)).toList();
        });
      }
    }
    on DioException catch (e)
    {
        log(e.type!.toString());
        if(e.type! == DioExceptionType.connectionError)
          {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("No Internet"))
            );
          }
        else if(e.type! == DioExceptionType.badResponse)
          {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SupportPage()));
          }
        else
          {

            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Other Error"))
            );
          }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Dio Example"),
          centerTitle: true,
        ),
        body: (allData==null)?Center(child: CircularProgressIndicator(),)
            :(allData!.length<=0)
            ?Center(child: Text("Data not found!"),):
        ListView.builder(
            itemCount: allData!.length,
            itemBuilder:(context,index){
              return Container(
                margin: EdgeInsets.all(8.0),
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(""+allData![index].pname.toString()),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Qty: "+allData![index].qty.toString()),
                        Text("Price: "+allData![index].price.toString(),),
                        Text("Date: "+allData![index].addedDatetime.toString(),),
                      ],
                    )
                  ],
                ),
              );
            })
    );
  }
}