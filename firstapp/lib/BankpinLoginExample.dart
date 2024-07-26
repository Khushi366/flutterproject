
import 'package:firstapp/BankPinCreatExample.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'HorizontalListviewExample.dart';

class BankpinLoginExample extends StatefulWidget {


  @override
  State<BankpinLoginExample> createState() => _BankpinLoginExampleState();
}

class _BankpinLoginExampleState extends State<BankpinLoginExample> {
  TextEditingController _pin = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [

            SizedBox(height: 40.0,),

            Text("Login Pin ",style: TextStyle(fontFamily: "SourceSansPro",fontSize: 22.0),),

            SizedBox(height: 40.0,),

            TextField(
              controller: _pin,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Pin"
              ),
            ),

            SizedBox(height: 20.0,),


            ElevatedButton(onPressed: ()async{

              SharedPreferences prefs = await SharedPreferences.getInstance();
              String enteredPin  = _pin.text.trim();

              if(prefs.getString("pin").toString() == enteredPin)
                {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HorizontalListviewExample()));
                }
              else
                {
                  var snackbar  = SnackBar(content: Text("Pin not match"));
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                }


            }, child: Text("Login")),

            SizedBox(height: 20.0,),

          ],
        ),
      ),

    );

  }
}
