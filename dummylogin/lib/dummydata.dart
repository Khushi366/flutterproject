import 'package:flutter/material.dart';

class Dummydata extends StatefulWidget {
  const Dummydata({super.key});

  @override
  State<Dummydata> createState() => _DummydataState();
}

class _DummydataState extends State<Dummydata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text("DummyLogin",style: TextStyle(fontSize: 20.0,color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [


          ],
        ),
      ),
    );
  }
}
