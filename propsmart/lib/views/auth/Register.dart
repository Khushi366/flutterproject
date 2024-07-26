import 'package:flutter/material.dart';
import 'package:propsmart/resources/StringResource.dart';
import 'package:propsmart/resources/StyleResources.dart';
import 'package:propsmart/widgets/PrimaryButton.dart';

import 'Login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF233645),
        title: Text("Register",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20.0),),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Name",
                contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF294357)),
                  borderRadius: BorderRadius.circular(10.0),
                ),

                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF233645)),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              cursorColor: Color(0xFF233645),
            ),
            SizedBox(height: 20.0,),
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Email",
                contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF294357)),
                  borderRadius: BorderRadius.circular(10.0),
                ),

                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF233645)),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              cursorColor: Color(0xFF233645),
            ),
            SizedBox(height: 20.0,),
            TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "PhoneNo",
                contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF294357)),
                  borderRadius: BorderRadius.circular(10.0),
                ),

                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF233645)),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              cursorColor: Color(0xFF233645),
            ),
            SizedBox(height: 20.0,),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: StringResource.TXT_PASSWORD,
                contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF294357)),
                  borderRadius: BorderRadius.circular(10.0),
                ),

                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF233645)),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              cursorColor: Color(0xFF233645),

            ),


            SizedBox(height: 12.0,),

            PrimaryButton(
              btntext: "Sign Up",
              btncolor: Colors.blue,
              onclick: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Login()));
              },
            ),

            // GestureDetector(
            //   onTap: (){
            //
            //     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Login()));
            //
            //   },
            //   child: Container(
            //       width: double.infinity,
            //       height: 40,
            //       alignment: Alignment.center,
            //       // margin: EdgeInsets.symmetric(horizontal: 20.0),
            //       padding: EdgeInsets.all(10.0),
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(10),
            //         color:StyleResources.BTN_COLOR,
            //       ),
            //       child:Text("Sign Up",style: StyleResources.BTN_TEXT_STYLE,)),
            // ),

            SizedBox(height: 12.0,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?",style: TextStyle(color: Color(0xFF233645),fontSize: 13.0),),
                InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Login()));

                  },
                  child: Text("Sign In",style: TextStyle(color: Color(0xFF233645),fontWeight: FontWeight.bold,fontSize: 13.0,
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xFF233645),),),
                ),

              ],
            ),


          ],
        ),
      ),
    );
  }
}
