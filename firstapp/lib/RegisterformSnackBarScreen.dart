import 'dart:developer';

import 'package:flutter/material.dart';

class RegisterformSnackBarScreen extends StatefulWidget {
  const RegisterformSnackBarScreen({super.key});

  @override
  State<RegisterformSnackBarScreen> createState() => _RegisterformSnackBarScreenState();
}

class _RegisterformSnackBarScreenState extends State<RegisterformSnackBarScreen> {

TextEditingController _name = TextEditingController();
TextEditingController _contact = TextEditingController();
TextEditingController _email = TextEditingController();
TextEditingController _pass = TextEditingController();
TextEditingController _conPass = TextEditingController();


  var ch1 = true;
  var gender = "M";
  var select = "Pro";

   _handelRadio(val){
     setState(() {
       gender = val!;
     });
   }
   _handelCheckbox(val){
     setState(() {
       ch1 = val!;
     });
   }
   bool isValidEmail(String email){
     String emailRegex =  r'^[\w-]+(?:\.[\w-]+)*@(?:[\w-]+\.)+[a-zA-Z]{2,7}$';
     return RegExp(emailRegex).hasMatch(email);

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration Page"),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [

              TextField(
                controller: _name,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Name",
                ),
              ),

              SizedBox(height: 20.0,),
              TextField(
                controller: _contact,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter ContactNo.",
                ),
              ),

              SizedBox(height: 20.0,),
              TextField(
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Email.",
                ),
              ),


              SizedBox(height: 20.0,),
              Row(
                children: [
                  Text("Gender"),
                  Radio(value: "M", groupValue: gender, onChanged:_handelRadio),
                  Text("Male"),
                  Radio(value: "F", groupValue: gender, onChanged:_handelRadio),
                  Text("Female"),

                ],
              ),


              SizedBox(height: 20.0,),
              TextField(
                controller: _pass,
                obscureText: true,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Password.",
                ),
              ),

              SizedBox(height: 20.0,),
              TextField(
                controller: _conPass,
                obscureText: true,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Conform Password.",
                ),
              ),

              SizedBox(height: 20.0,),
              DropdownButton(
                 value: select,
                  isExpanded: true,
                  elevation: 4,
                  padding: EdgeInsets.all(10.0),

                  items: [
                    DropdownMenuItem(child: Text("Product"),value: "Pro",),
                    DropdownMenuItem(child: Text("Salse"),value: "Sal",),
                    DropdownMenuItem(child: Text("Purchase"),value: "Pur",)

                  ],
                  onChanged: (val){
                   setState(() {
                     select = val!;
                   });
              }),

              Row(
                children: [
                  Checkbox(value: ch1, onChanged: _handelCheckbox),
                   Text("I am accept for a terms and condition")
                ],
              ),


              ElevatedButton(
                  onPressed: (){

                    if(_name.text.isEmpty) {
                      var snackbar = SnackBar(
                          content: Text("Plase insert name."));
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    }else if( _contact.text.isEmpty){
                      var snackbar = SnackBar(
                          content: Text("Plase insert contact number"));
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    } else if(_contact.text.length != 10){
                      var snackbar  = SnackBar(content: Text("Plase insert a 10-digits contact number."));
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    } else if(_email.text.isEmpty ){
                      var snackbar = SnackBar(
                          content: Text("Plase insert email"));
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    } else if(!isValidEmail(_email.text)){
                      var snackbar = SnackBar(content: Text("Plase insert a valid email address"));
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);

                    } else if(_pass.text.isEmpty){
                      var snackbar = SnackBar(
                          content: Text("Plase insert password"));
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    } else if(_pass.text.length<8){
                      var snackbar = SnackBar(
                          content: Text("Plase insert atlest 8 characters for the  password"));
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    } else if(_conPass.text.isEmpty){
                      var snackbar = SnackBar(
                          content: Text("Plase insert conform password"));
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    } else if(_pass.text != _conPass.text){
                      var snackbar  = SnackBar(content: Text("Password do not match"));
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    }else if(!ch1){
                      var snackbar  = SnackBar(content: Text("Plase select terms and condition"));
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    }
                    else
                    {
                      log("Name " + _name.text.toString());
                      log("contact number : "+_contact.text);
                      log("email : "+_email.text);
                      log("password : "+_pass.text);

                      var snackbar = SnackBar(content: Text("Register successful."));
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    }
                  }, child: Text("Register"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
