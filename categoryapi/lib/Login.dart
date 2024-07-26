import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'MyHomePage.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _email.text = "vikaddlp@gmail.com";
    _pass.text = "12345678";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
                onPressed: ()async{

                  var email = _email.text.toString();
                  var pwd = _pass.text.toString();


                  var params = {
                    "email": email,
                    "password": pwd
                  };

                  Uri url = Uri.parse("https://api.viosa.in/user/auth/login");
                  var response = await http.post(url,body: params);
                  if(response.statusCode == 200)
                    {
                      var json = jsonDecode(response.body.toString());

                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.setString("islogin","yes");

                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> MyHomePage()));

                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(json["message"]))
                      );

                    }
                  else
                  {
                    var json = jsonDecode(response.body.toString());
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(json["message"]))
                    );
                  }



                }, child: Text("Login")
            )




          ],
        ),
      ),
    );
  }
}
