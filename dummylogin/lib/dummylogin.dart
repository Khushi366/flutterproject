import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'HomePage.dart';

class DummyLogin extends StatefulWidget {
  const DummyLogin({super.key});

  @override
  State<DummyLogin> createState() => _DummyLoginState();
}

class _DummyLoginState extends State<DummyLogin> {


  TextEditingController _username = TextEditingController();
  TextEditingController _pass = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _username.text = "emilys";
    _pass.text = "emilyspass";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text("DummyLogin",style: TextStyle(fontSize: 20.0,color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 20.0,),

            TextField(
              controller: _username,
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
                hintText: "Email",
                contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              ),
            ),

            SizedBox(height: 20.0,),

            ElevatedButton(
                onPressed: ()async{

                  var user = _username.text.toString();
                  var password = _pass.text.toString();

                  var params = {
                    "username": user,
                    "password":password
                  };

                  Uri url = Uri.parse("https://dummyjson.com/auth/login");
                  var response = await http.post(url,body: params);
                  log(response.statusCode.toString());

                  if(response.statusCode ==200)
                  {
                    var json = jsonDecode(response.body.toString());
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.setString("islogin","yes");
                    prefs.setString("firstName",json["firstName"]);

                    prefs.setString("token",json["token"].toString());

                    var message = json["message"] ?? "Login successful";
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(message)),
                    );


                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HomePage()));

                  }
                  else if (response.statusCode>=400)
                  {
                    var json = jsonDecode(response.body.toString());
                    var message = json["message"] ?? "Login failed";
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(message)),
                    );
                  }
                  else
                  {
                    log("Server Error");
                  }
                }, child: Text("Login"))
          ],
        ),
      ),
    );
  }
}
