import 'package:firstapp/BankpinLoginExample.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'HorizontalListviewExample.dart';

class BankPinCreatExample extends StatefulWidget {

  @override
  State<BankPinCreatExample> createState() => _BankPinCreatExampleState();
}

class _BankPinCreatExampleState extends State<BankPinCreatExample> {

  TextEditingController _pin = TextEditingController();
  TextEditingController _confirmpin = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 40.0,),

            Text("Creat Pin ",style: TextStyle(fontFamily: "SourceSansPro",fontSize: 22.0),),

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
            TextField(
              controller: _confirmpin,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Confirm pin"
              ),
            ),

            ElevatedButton(
                onPressed: () async{

                  SharedPreferences prefs = await SharedPreferences.getInstance();

                  String pincreat  = _pin.text.trim();
                  String confirmcreat  = _confirmpin.text.trim();

                  if(pincreat.isEmpty){
                    var snackbar  = SnackBar(content: Text("Please enter pin"));
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  }else if(confirmcreat.isEmpty){
                    var snackbar  = SnackBar(content: Text("Please enter confirm pin "));
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  }else if(pincreat != confirmcreat){
                    var snackbar  = SnackBar(content: Text("PINs do not match "));
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  }
                  else{
                    prefs.setString("pin", pincreat);
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HorizontalListviewExample()));
                  }

            }, child: Text("Submit")),
          ]
      ),
      )
    );
  }
}
