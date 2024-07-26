import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class DioAdd extends StatefulWidget {
  const DioAdd({super.key});

  @override
  State<DioAdd> createState() => _DioAddState();
}

class _DioAddState extends State<DioAdd> {

  TextEditingController _name = TextEditingController();
  TextEditingController _qty = TextEditingController();
  TextEditingController _price = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dio Add"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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

            SizedBox(
              width: 200,
              child: ElevatedButton(
                  onPressed: ()async{

                    var name  = _name.text.toString();
                    var qty = _qty.text.toString();
                    var price  = _price.text.toString();

                    final dio = Dio(BaseOptions(
                      baseUrl: 'https://studiogo.tech/student/studentapi',
                    ));


                    final formData = FormData.fromMap({
                      "pname":name,
                      "qty": qty,
                      "price":price
                    });

                    var response = await dio.post('/insertProductNormal.php',data: formData);
                    if(response.statusCode == 200)
                    {

                      var json  = jsonDecode(response.data.toString());
                      if(json["status"]=="true")
                      {

                        var message  =json["message"];
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(message),backgroundColor: Colors.green,)
                        );

                        _name.text = "";
                        _qty.text = "";
                        _price.text = "";
                      }
                      else
                      {
                        var message = json["message"];
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(message),backgroundColor: Colors.red,)
                        );
                      }

                    }







                  }, child: Text("Add")),
            )
          ],
        ),
      ),
    );
  }
}
