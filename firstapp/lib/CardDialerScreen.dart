import 'package:flutter/material.dart';

class CardDialerScreen extends StatefulWidget {
  const CardDialerScreen({super.key});

  @override
  State<CardDialerScreen> createState() => _CardDialerScreenState();
}

class _CardDialerScreenState extends State<CardDialerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 70.0,
                width: 70.0,
                child: Card(
                  elevation: 10.0,
                  child: Align(
                      alignment: Alignment.center,
                      child: Text("1", style: TextStyle(fontSize: 30.0, color: Colors.green,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,))),

                ),
              ),

              Container(
                height: 70.0,
                width: 70.0,
                child: Card(
                  elevation: 10.0,
                  child: Align(
                      alignment: Alignment.center,
                      child: Text("2", style: TextStyle(fontSize: 30.0, color: Colors.green,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,))),

                ),
              ),

              Container(
                height: 70.0,
                width: 70.0,
                child: Card(
                  elevation: 10.0,
                  child: Align(
                      alignment: Alignment.center,
                      child: Text("3", style: TextStyle(fontSize: 30.0, color: Colors.green,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,))),

                ),
              ),

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 70.0,
                width: 70.0,
                child: Card(
                  elevation: 10.0,
                  child: Align(
                      alignment: Alignment.center,
                      child: Text("4", style: TextStyle(fontSize: 30.0, color: Colors.green,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,))),

                ),
              ),

              Container(
                height: 70.0,
                width: 70.0,
                child: Card(
                  elevation: 10.0,
                  child: Align(
                      alignment: Alignment.center,
                      child: Text("5", style: TextStyle(fontSize: 30.0, color: Colors.green,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,))),

                ),
              ),

              Container(
                height: 70.0,
                width: 70.0,
                child: Card(
                  elevation: 10.0,
                  child: Align(
                      alignment: Alignment.center,
                      child: Text("6", style: TextStyle(fontSize: 30.0, color: Colors.green,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,))),

                ),
              ),

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 70.0,
                width: 70.0,
                child: Card(
                  elevation: 10.0,
                  child: Align(
                      alignment: Alignment.center,
                      child: Text("7", style: TextStyle(fontSize: 30.0, color: Colors.green,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,))),

                ),
              ),

              Container(
                height: 70.0,
                width: 70.0,
                child: Card(
                  elevation: 10.0,
                  child: Align(
                      alignment: Alignment.center,
                      child: Text("8", style: TextStyle(fontSize: 30.0, color: Colors.green,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,))),

                ),
              ),

              Container(
                height: 70.0,
                width: 70.0,
                child: Card(
                  elevation: 10.0,
                  child: Align(
                      alignment: Alignment.center,
                      child: Text("9", style: TextStyle(fontSize: 30.0, color: Colors.green,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,))),

                ),
              ),

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 70.0,
                width: 70.0,
                child: Card(
                  elevation: 10.0,
                  child: Align(
                      alignment: Alignment.center,
                      child: Text("*", style: TextStyle(fontSize: 30.0, color: Colors.green,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,))),

                ),
              ),

              Container(
                height: 70.0,
                width: 70.0,
                child: Card(
                  elevation: 10.0,
                  child: Align(
                      alignment: Alignment.center,
                      child: Text("0", style: TextStyle(fontSize: 30.0, color: Colors.green,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,))),

                ),
              ),

              Container(
                height: 70.0,
                width: 70.0,
                child: Card(
                  elevation: 10.0,
                  child: Align(
                      alignment: Alignment.center,
                      child: Text("#", style: TextStyle(fontSize: 30.0, color: Colors.green,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,))),

                ),
              ),

            ],
          ),
        ],
      ),

    );
  }
}
