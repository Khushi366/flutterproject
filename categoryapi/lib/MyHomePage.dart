import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;
import 'Login.dart';
import 'Model/Product.dart';
import 'ProductDetails.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  List<Products>? alldata;
  getdata()async
  {

    Uri url = Uri.parse("https://dummyjson.com/products");
    var response = await http.get(url);
    if(response.statusCode == 200)
      {
        var body = response.body.toString();
        var json = jsonDecode(body);
        log(body);
        setState(() {
         alldata  =  json["products"].map<Products>((obj)=> Products.fromJson(obj)).toList();
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
                onTap: ()async{
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.clear();
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Login()));

                },
                child: Icon(Icons.logout_outlined)),
          )
        ],
        title: Text("MyHomePage"),
        centerTitle: true,
      ),
      body: (alldata==null)?Center(child: CircularProgressIndicator(),)
          :GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,),
          itemCount: alldata!.length,
          itemBuilder: (context, index)
          {
            return GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ProductDetails(
                  pid: alldata![index].id.toString(),
                )));
              },
              child: Container(
                margin: EdgeInsets.all(8.0),
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    Expanded(
                        child: Image.network(alldata![index].images![0].toString())),

                    SizedBox(height: 20.0,),
                    Text(""+alldata![index].title.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14.0),textAlign: TextAlign.start,),
                    Text("₹"+alldata![index].price.toString()),
                  ],
                ),
              ),
            );
          }
      )
    );
  }
}
