import 'package:flutter/material.dart';

class RowAndColumnExample extends StatefulWidget {
  const RowAndColumnExample({super.key});

  @override
  State<RowAndColumnExample> createState() => _RowAndColumnExampleState();
}

class _RowAndColumnExampleState extends State<RowAndColumnExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text("Row And Column Api",style: TextStyle(fontSize: 20.0,color: Colors.white),),

      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
