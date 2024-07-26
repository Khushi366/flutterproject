import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxproject/views/DataScreen.dart';

class DioLogin extends StatefulWidget {
  const DioLogin({super.key});

  @override
  State<DioLogin> createState() => _DioLoginState();
}

class _DioLoginState extends State<DioLogin> {


  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _email.text = "emilys";
    _pass.text = "emilyspass";
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dio Login"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            SizedBox(height: 20.0,),

            TextField(
              controller: _email,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Email",
                contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              ),
            ),


            SizedBox(height: 20.0,),
            TextField(
              controller: _pass,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Password",

                contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              ),
            ),

            SizedBox(height: 20),


            ElevatedButton(
                onPressed: ()async{
                  var email = _email.text.toString();
                  var pwd = _pass.text.toString();

                  final dio = Dio();

                  var params = {
                    "username": email,
                    "password": pwd
                  };
                  var response = await dio.post('https://dummyjson.com/auth/login',data:params);

                  log(response.statusCode.toString());

                  if(response.statusCode == 200) {
                    var json = response.data;
                    var message = json["message"] ?? "Login successful";
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(message)),
                    );
                    Get.to(DataScreen());
                  }
                  else if (response.statusCode! >= 400)
                  {
                    var json = response.data;
                    var message = json["message"] ?? "Login failed";
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(message)),
                    );

                  }
                  else
                  {
                    log("Server Error");
                  }
                  }, child:Text("Submit"))
          ],
        ),
      ),
    );
  }
}
