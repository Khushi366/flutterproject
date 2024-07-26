import 'package:flutter/material.dart';

class ListviewsExample extends StatefulWidget {
  const ListviewsExample({super.key});

  @override
  State<ListviewsExample> createState() => _ListviewsExampleState();
}

class _ListviewsExampleState extends State<ListviewsExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listviews Example"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
