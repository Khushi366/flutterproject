import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'models/Product.dart';

class DropDownExample extends StatefulWidget {
  const DropDownExample({super.key});

  @override
  State<DropDownExample> createState() => _DropDownExampleState();
}

class _DropDownExampleState extends State<DropDownExample> {
  List<Product>?alldata;

  var selectedProduct = "";

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
        selectedProduct = alldata!.first.pid.toString();
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
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text("DropDown Api",style: TextStyle(fontSize: 20.0,color: Colors.white),),

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            (alldata!=null)?Column(
              children: alldata!.map((obj){
                return Container(
                  child: Column(
                    children: [
                      Text(obj.pid.toString()),
                      Text(obj.pname.toString())
                    ],
                  ),
                );
              }).toList(),
            ):SizedBox(),
            Container(
            child:   Text("TEST"),
            ),
            Container(
              child:   Text("TEST"),
            ),
            Container(
              child:   Text("TEST"),
            )
          ],
        )
      ),
      // body: Column(
      //   children: [
      //     (alldata!=null)?DropdownButton(
      //       value: selectedProduct,
      //       onChanged: (val)
      //       {
      //         setState(() {
      //           selectedProduct = val!;
      //         });
      //       },
      //       items: alldata!.map((obj){
      //         return DropdownMenuItem(
      //           child: Text(obj.pname.toString()),
      //           value: obj.pid.toString(),
      //         );
      //       }).toList(),
      //     ):SizedBox(),
      //     ElevatedButton(onPressed: (){
      //       log(selectedProduct.toString());
      //     }, child: Text("Submit"))
      //   ],
      // ),
    );
  }
}
