import 'package:flutter/material.dart';

class TextWidgetExample extends StatefulWidget {
  const TextWidgetExample({super.key});

  @override
  State<TextWidgetExample> createState() => _TextWidgetExampleState();
}

class _TextWidgetExampleState extends State<TextWidgetExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text"),
      ),
      body: Center(
        child: Text("Hello World!",style: TextStyle(
          fontSize: 40.0,
          color: Colors.deepOrange,
          backgroundColor: Color(0xffd1c4e9),
          fontStyle: FontStyle.italic,
          // backgroundColor: Colors.amberAccent.shade100,
          fontWeight: FontWeight.bold,
          letterSpacing: 5.0,
          wordSpacing: 10.0
        ),),
      ),
    );
  }
}
