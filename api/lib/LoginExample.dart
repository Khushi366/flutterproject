import 'dart:convert';
import 'dart:developer';

import 'package:api/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginExample extends StatefulWidget {
  const LoginExample({super.key});

  @override
  State<LoginExample> createState() => _LoginExampleState();
}

class _LoginExampleState extends State<LoginExample> {

  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _email.text = "kminchelle";
    _pass.text = "0lelplR";
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text("Login Example",style: TextStyle(fontSize: 20.0,color: Colors.white),),
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

            SizedBox(height: 20.0,),

            ElevatedButton(
                onPressed: () async{

                  var email = _email.text.toString();
                  var pwd = _pass.text.toString();



                  var params = {
                    "username":email,
                    "password":pwd,
                    "expiresInMins":60
                  };
                  
                  Uri url = Uri.parse("https://dummyjson.com/auth/login");

                  var response = await http.post(url,body: jsonEncode(params),headers: {"Content-Type":"application/json"});
                  // if(response.statusCode==200)
                  //   {
                  //     var json = jsonDecode(response.body.toString());
                  //     if(json["status"]=="true")
                  //       {
                  //         log("login success");
                  //       }
                  //     else
                  //       {
                  //         log("login fail");
                  //       }
                  //   }
                  if(response.statusCode==200)
                    {

                      var json = jsonDecode(response.body.toString());
                      log("login success, Welcome," + json["firstName"]);

                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.setString("username", email);
                      prefs.setString("password", pwd);
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HomePage()));
                    }
                  else if(response.statusCode>=400)
                    {
                      var json = jsonDecode(response.body.toString());
                      log(json["message"]);
                    }
                  else
                    {
                      log("Server Error");
                    }



                  // 200-299 - ok
                  // 300-399 - Redirection
                  // 400-499 - not found
                  // 500-599 - Server Error



                }, child: Text("Login")
            ),

          ],
        ),
      ),
    );
  }
}
