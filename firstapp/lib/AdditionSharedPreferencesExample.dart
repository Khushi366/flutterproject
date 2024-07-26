import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdditionSharedPreferencesExample extends StatefulWidget {
  const AdditionSharedPreferencesExample({super.key});

  @override
  State<AdditionSharedPreferencesExample> createState() => _AdditionSharedPreferencesExampleState();
}

class _AdditionSharedPreferencesExampleState extends State<AdditionSharedPreferencesExample> {
  TextEditingController _text1 =  TextEditingController();
  TextEditingController _text2 = TextEditingController();
  var total = "0";

  void initState(){
    super.initState();
    _lodValue();
  }



  _lodValue()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {

      _text1.text = prefs.getString("number1").toString();
      _text2.text = prefs.getString("number2").toString();

        //total =  (int.parse(_text1.text) + int.parse(_text2.text)).toString();
        total = "0";


    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              children: [
                SizedBox(height: 40.0,),

                Text("Addition ",style: TextStyle(fontFamily: "SourceSansPro",fontSize: 22.0),),

                SizedBox(height: 40.0,),
                TextField(
                  controller: _text1,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter first no."
                  ),
                ),

                SizedBox(height: 20.0,),
                TextField(
                  controller: _text2,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter second no."
                  ),
                ),

                ElevatedButton(
                    onPressed: () async{
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                          setState(() {
                            total =  (int.parse(_text1.text) + int.parse(_text2.text)).toString();
                          });
                      prefs.setString("number1", _text1.text);
                      prefs.setString("number2", _text2.text);

                    }, child: Text("Submit")),

                  Text("Total: " +total.toString())
              ]
          ),
        )

    );
  }
}
