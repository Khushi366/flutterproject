import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesExample extends StatefulWidget {
  const SharedPreferencesExample({super.key});

  @override
  State<SharedPreferencesExample> createState() => _SharedPreferencesExampleState();
}

class _SharedPreferencesExampleState extends State<SharedPreferencesExample> {

  TextEditingController _name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
         // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50,),

            TextField(
              controller: _name,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Name",hintStyle: TextStyle(fontFamily: "Semibold"),

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

            SizedBox(height: 10,),

            ElevatedButton(

              onPressed: () async{

                var fn = _name.text.toString();
                SharedPreferences prefs = await SharedPreferences.getInstance();
                //store
                prefs.setString("firstname", fn);
                prefs.setInt("age", 25);


                _name.text="";

                log("Data Stored");



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
              child: Text("Add",style: TextStyle(fontFamily: "SourceSansPro",color: Color(0xFFFFFFFF),fontSize: 20.0,),),
            ),
            SizedBox(height: 10,),
            ElevatedButton(

              onPressed: () async{
                SharedPreferences prefs = await SharedPreferences.getInstance();
                //check
                if(prefs.containsKey("firstname"))
                  {
                    //Read
                    var firstname = prefs.getString("firstname").toString();
                    log("NAme : " + firstname);
                  }
                else
                  {
                    log("Not Available");
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
              child: Text("Read",style: TextStyle(fontFamily: "SourceSansPro",color: Color(0xFFFFFFFF),fontSize: 20.0,),),
            ),
            SizedBox(height: 10,),
            ElevatedButton(

              onPressed: () async{

                SharedPreferences prefs = await SharedPreferences.getInstance();
                //check
                if(prefs.containsKey("firstname"))
                {
                  prefs.clear();
                  //prefs.remove("firstname");
                  log("Deleted");
                }
                else
                {
                  log("Not Available");
                }
                // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeExample()));
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
              child: Text("Delete",style: TextStyle(fontFamily: "SourceSansPro",color: Color(0xFFFFFFFF),fontSize: 20.0,),),
            ),
            SizedBox(height: 10,),


          ],
        ),
      ),
    );
  }
}
