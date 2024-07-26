import 'package:firstapp/BankpinLoginExample.dart';
import 'package:firstapp/SharedPreferenceExample.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HorizontalListviewExample extends StatefulWidget {
  const HorizontalListviewExample({super.key});

  @override
  State<HorizontalListviewExample> createState() => _HorizontalListviewExampleState();
}

class _HorizontalListviewExampleState extends State<HorizontalListviewExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Horizontal Listview"),
        leading: IconButton(
          onPressed: ()async{

            Navigator.of(context).pop();

          },
          icon: Icon(Icons.logout_outlined),),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 300.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 300.0,
                    color: Colors.red,
                    margin: EdgeInsets.all(10.0),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 300.0,
                    color: Colors.green,
                    margin: EdgeInsets.all(10.0),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 300.0,
                    color: Colors.blue,
                    margin: EdgeInsets.all(10.0),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
