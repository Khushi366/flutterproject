import 'package:firstapp/CheckBoxExample.dart';
import 'package:firstapp/ContainerWidgetExample.dart';
import 'package:firstapp/RadioButtonExample.dart';
import 'package:firstapp/RegisterScreen.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationExample extends StatefulWidget {
  const CustomBottomNavigationExample({super.key});

  @override
  State<CustomBottomNavigationExample> createState() => _CustomBottomNavigationExampleState();
}

class _CustomBottomNavigationExampleState extends State<CustomBottomNavigationExample> {


  var index=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom"),
      ),
      body: Column(
        children: [
          Expanded(
            child: (index==0)?RadioButtonExample():(index==1)?RegisterScreen():(index==3)?CheckBoxExample():ContainerWidgetExample(),
          ),
          Container(
            color: Colors.yellow.shade300,
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        index=0;
                      });
                    },
                    child: Container(
                      color: (index==0)?Colors.purple:Colors.transparent,
                      padding: EdgeInsets.all(5.0),
                      child: Icon(Icons.home),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        index=1;
                      });
                    },
                    child: Container(
                      color: (index==1)?Colors.purple:Colors.transparent,
                      padding: EdgeInsets.all(5.0),
                      child: Icon(Icons.account_box),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        index=2;
                      });
                    },
                    child: Container(

                      color: (index==2)?Colors.purple:Colors.transparent,
                      padding: EdgeInsets.all(5.0),
                      child: Icon(Icons.five_k_plus_sharp,color: (index==2)?Colors.white:Colors.black,),
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: (){
                      setState(() {
                        index=3;
                      });
                    },
                    child: Text("POP"),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
