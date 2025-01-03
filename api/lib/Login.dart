import 'dart:convert';
import 'dart:developer';

import 'package:api/CustomDrawer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'HomePage.dart';
import 'Register.dart';
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
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text("Login",style: TextStyle(fontSize: 20.0,color: Colors.white),),
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
                    "email": email,
                    "password": pwd
                  };
                  
                  Uri url = Uri.parse("https://api.viosa.in/user/auth/login");
                  var response = await http.post(url,body: params);

                  log(response.statusCode.toString());

                  if(response.statusCode==200)
                    {
                      var json = jsonDecode(response.body.toString());

                      // go to direct home page

                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.setString("islogin","yes");
                      prefs.setString("_id",json["user"]["_id"].toString());
                      prefs.setString("name",json["user"]["name"].toString());
                      prefs.setString("role",json["user"]["role"].toString());


                      prefs.setString("token",json["token"].toString());
                      //

                      Navigator.of(context).pop();                                      //goto direct login
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HomePage()));

                      // if(json["result"]==true)
                      //   {
                      //
                      //   }
                      // else
                      //   {
                      //
                      //   }
                      
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
            ),

            Text("OR"),
            ElevatedButton(
                onPressed: (){

                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Register()));

                }, child: Text("SignUp"))

          ],
        ),
      ),
    );
  }
}
