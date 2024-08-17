import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:propsmart/providers/CheckLoginProvider.dart';
import 'package:propsmart/resources/StringResource.dart';
import 'package:propsmart/widgets/MyTextBox.dart';
import 'package:propsmart/resources/StyleResources.dart';
import 'package:propsmart/views/utility/Home.dart';
import 'package:propsmart/widgets/PrimaryButton.dart';
import 'package:provider/provider.dart';

import 'Register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  CheckLoginProvider? provider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _email.text = "emilys";
    _password.text = "emilyspass";
    provider = Provider.of<CheckLoginProvider>(context,listen: false);
  }

  _loginBtn()
  {
    return PrimaryButton(
      btntext: "Sign In",
      btncolor: Colors.red,
     // jj

      onclick: ()async{


        var email = _email.text.toString();
        var pass = _password.text.toString();


        if(email.isEmpty || pass.isEmpty)
        {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("All fields are required."),
              backgroundColor: Colors.red,
            ),
          );
          return;
        }

        var params = {
          "username":email,
          "password":pass,
        };

        await provider!.checkLogin(context,params);
        if(provider!.islogin==true)
          {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Login success"),
                  backgroundColor: Colors.green,
                ));

            Navigator.of(context).pop();
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Home()));
          }
        else
          {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Login faile"),
                  backgroundColor: Colors.red,
                ));
          }
        },
    );
  }

  _loginForm()
  {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [

          MyTextBox(
            hinttext: "Email",
            keywordType: TextInputType.emailAddress,
            controller: _email,
          ),

          SizedBox(height: 20.0,),
          MyTextBox(
            hinttext: StringResource.TXT_PASSWORD,
            keywordType: TextInputType.name,
            controller: _password,
            password: true,

          ),
          SizedBox(height: 12.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                  onTap: (){

                    var email = _email.text.toString();

                  },
                  child: Text("Forget password?",style: TextStyle(color: Color(0xFF233645),fontWeight: FontWeight.bold,fontSize: 13.0),)),
            ],
          ),
          SizedBox(height: 12.0,),
          _loginBtn(),

          // GestureDetector(
          //   onTap: (){
          //     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Home()));
          //   },
          //   child: Container(
          //       width: double.infinity,
          //       height: 40,
          //       alignment: Alignment.center,
          //      // margin: EdgeInsets.symmetric(horizontal: 20.0),
          //       padding: EdgeInsets.all(10.0),
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(10),
          //         color: StyleResources.BTN_COLOR,
          //       ),
          //       child:Text("Sign In",style: StyleResources.BTN_TEXT_STYLE,)),
          // ),

          SizedBox(height: 12.0,),

          Text("Or",style: TextStyle(color: Color(0xFF233645),fontWeight: FontWeight.bold,fontSize: 13.0),),
          SizedBox(height: 12.0,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account?",style: TextStyle(color: Color(0xFF233645),fontSize: 13.0),),
              InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Register()));

                },
                child: Text("Create",style: TextStyle(color: Color(0xFF233645),fontWeight: FontWeight.bold,fontSize: 13.0,
                  decoration: TextDecoration.underline,
                  decorationColor: Color(0xFF233645),),),
              ),

            ],
          ),

        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF233645),
        title: Text("Login",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20.0),),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: _loginForm(),
    );
  }
}
