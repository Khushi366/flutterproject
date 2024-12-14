import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:map/SharedPref/ShowData.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Widget/Button.dart';
import '../Widget/CustomeTextField.dart';

class AddData extends StatefulWidget {
  const AddData({super.key});

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _email = TextEditingController();
    TextEditingController _pass = TextEditingController();

   Future<void> _validation()async{

      var email = _email.text.trim();
      var pass = _pass.text.trim();

      if(email.isEmpty){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content:Text("Email address cannot be empty")),
        );
        return;
      } else if(!RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+').hasMatch(email)){
        ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(content:Text("Please enter valid email address")),
        );
        return;
      }else if(pass.isEmpty){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content:Text("Password cannot be empty")),
        );
        return;
      }else if (pass.length < 8){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content:Text("Password must be at least 8 characters")),
        );
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Form submitted successfully")),
      );

      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String>emails = await prefs.getStringList("email")??[];
      List<String>passwords = await prefs.getStringList("passwords")??[];

      emails.add(email);
      passwords.add(pass);

      await prefs.setStringList("email", emails);
      await prefs.setStringList("passwords", passwords);


      //without list
      // await prefs.setString("email", email);
      // await  prefs.setString("password",pass);

      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ShowData()));
    }

    return Scaffold(
       body: Column(
         children: [
           customeTextBox(
               controller: _email,
               label: '',
               hintText: "Enter Email Adderess"
           ),
           customeTextBox(
               controller: _pass,
               label: '',
               hintText: "Enter Password",
               obscureText: true,
           ),

           PrimaryButton(
             title: 'Submit',
             onTap: _validation,


           ),
         ],
       ),
    );
  }
}
