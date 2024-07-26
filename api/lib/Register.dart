import 'dart:convert';
import 'dart:developer';

import 'package:api/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'Login.dart';
class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {


  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();
  TextEditingController _conpass = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _desig = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _email.text = "vikaaalp@gmail.com";
    _pass.text = "12345678";
    _conpass.text = "12345678";
    _name.text = "Vikalp";
    _phone.text = "87867676898";
    _desig.text = "Student";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text("Register",style: TextStyle(fontSize: 20.0,color: Colors.white),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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

              TextField(
                controller: _conpass,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "ConfirmPassword",
                  contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                ),
              ),

              SizedBox(height: 20.0,),

              TextField(
                controller: _name,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Name",
                  contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                ),
              ),
              SizedBox(height: 20.0,),

              TextField(
                controller: _phone,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "PhoneNo",
                  contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                ),
              ),
              SizedBox(height: 20.0,),

              TextField(
                controller: _desig,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Designation",
                  contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                ),
              ),


              SizedBox(height: 20.0,),

              ElevatedButton(
                  onPressed: ()async{

                    var email = _email.text.toString();
                    var pass = _pass.text.toString();
                    var conpass = _conpass.text.toString();
                    var name = _name.text.toString();
                    var phone =  _phone.text.toString();
                    var desig =  _desig.text.toString();

                    // if(pass !=conpass)
                    //   {
                    //     ScaffoldMessenger.of(context).showSnackBar(
                    //       SnackBar(content: Text("Passwords do not match")),
                    //     );
                    //     return;
                    //   }

                    log("Button Clicked");

                    var params = {
                     "email": email,
                      "password": pass,
                      "confirm_password": conpass,
                      "name": name,
                      "phoneNumber": phone,
                      "designation": desig
                    };

                    Uri url = Uri.parse("https://api.viosa.in/user/auth/signup");
                    var response = await http.post(url,body: params);
                    log(response.statusCode.toString());

                    if(response.statusCode == 200)
                    {
                      var json =  jsonDecode(response.body.toString());

                      if(json["success"]== true)
                        {

                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        prefs.setString("islogin","yes");
                        prefs.setString("_id",json["data"]["result"]["_id"].toString());
                        prefs.setString("name",json["data"]["result"]["name"].toString());
                        prefs.setString("role",json["data"]["result"]["role"].toString());
                        prefs.setString("token",json["data"]["token"].toString());



                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(json["message"]))
                          );
                          //Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HomePage()));
                        }
                      else
                        {

                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(json["message"]))
                          );

                        }
                    }
                    else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Error:"+response.body.toString())),
                      );
                    }

              }, child: Text("SignUP"))

            ],
          ),
        ),
      ),
    );
  }
}
