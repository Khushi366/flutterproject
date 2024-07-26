import 'package:flutter/material.dart';
import 'package:gofresh/RegisterExample.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'HomeExample.dart';
import 'HomePage.dart';

class LoginExample extends StatefulWidget {
  const LoginExample({super.key});

  @override
  State<LoginExample> createState() => _LoginExampleState();
}

class _LoginExampleState extends State<LoginExample> {
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();

  bool isValidEmail(String email){
    String emailRegex =  r'^[\w-]+(?:\.[\w-]+)*@(?:[\w-]+\.)+[a-zA-Z]{2,7}$';
    return RegExp(emailRegex).hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFBFAFF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 92.0,left: 03.0),
                child: Image.asset("assets/img/login.png",width: 130.0,height: 130.0,),
              ),
              SizedBox(width: 720.0,height: 30.0,),
              Text("Login",style: TextStyle(fontFamily: "SourceSansPro",fontSize: 26.0),),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                child: TextField(
                  controller: _email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Email",hintStyle: TextStyle(fontFamily: "Semibold"),

                    contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFFE7551)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFFE7551)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  cursorColor: Color(0xFFFE7551),

                  style: TextStyle(fontFamily: "Semibold"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                child: TextField(
                  controller: _pass,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: (){

                      },
                      icon: Icon(Icons.visibility_off_outlined,color: Color(0xFFC0C0C0),size: 22.0,),
                    ),
                    border: OutlineInputBorder(),
                    hintText: "Password",hintStyle: TextStyle(fontFamily: "Semibold",color: Color(0xFFC0C0C0)),
                    contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFF4F4F4)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFF4F4F4)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  cursorColor: Color(0xFFC0C0C0) ,
                  style: TextStyle(fontFamily: "Semibold",color: Color(0xFFC0C0C0)),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Text("Forget password?",style: TextStyle(fontFamily: "Semibold",color: Color(0xFFFE7551),fontSize: 13.0),),
                  )
                ],
              ),


              SizedBox(height: 30.0,),
              ElevatedButton(

                  onPressed: () async{
                  if(_email.text.isEmpty){
                    var snackbar = SnackBar(content: Text("Please enter email"));
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  }else if(!isValidEmail(_email.text)){
                    var snackbar =  SnackBar(content: Text("Please enter  a valid email address"));
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);

                  } else if(_pass.text.isEmpty){
                    var snackbar  =  SnackBar(content: Text("Please enter password"));
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);

                  }else if (_pass.text.length < 3){

                    var snackbar  = SnackBar(content: Text("Please enter atlest 3 character"));
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);

                  }else if(_email.text == "test@gmail.com" && _pass.text == "123"){

                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.setBool("islogin", true);

                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeExample()));
                  }
                  else{
                    var snackbar =  SnackBar(content: Text("Invalid email or password"));
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);

                  }

                  },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFFFE7551)),
                  fixedSize: MaterialStateProperty.all(Size(130.0,45.0)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)
                    )
                  ),
                ),
                child: Text("Login",style: TextStyle(fontFamily: "SourceSansPro",color: Color(0xFFFFFFFF),fontSize: 20.0,),),
              ),
              SizedBox(height: 30,),

              Text("Or Continue With",style: TextStyle(fontFamily:"Semibold",fontSize: 12.0, ),),

              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(width: 2,color: Color(0xFFF4F4F4))
                    ),
                    child: Image.asset("assets/img/facebook.png",scale: 5.0,),
                  ),
                  SizedBox(width: 20.0,),
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(width: 2,color: Color(0xFFF4F4F4))

                    ),
                    child: Image.asset("assets/img/google.png",scale: 5.0,),
                  ),
                ],
              ),
              SizedBox(height: 30.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't Have an account?",style: TextStyle(fontFamily: "Semibold",fontSize: 14.0),),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> RegisterExample()));
                    },
                    child: Text(" Create",style: TextStyle(fontFamily: "SourceSansPro",fontSize: 14.0,color: Color(0xFFFE7551),
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xFFFE7551),
                    ),),
                  ),

                ],
              ),
              SizedBox(height: 25.0,),
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                ),
                 child: Opacity(
                   opacity: 0.10,
                     child: Image.asset("assets/img/group.png")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
