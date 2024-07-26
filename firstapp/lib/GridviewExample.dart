import 'package:flutter/material.dart';

class GridviewExample extends StatefulWidget {
  const GridviewExample({super.key});

  @override
  State<GridviewExample> createState() => _GridviewExampleState();
}

class _GridviewExampleState extends State<GridviewExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gridview Example"),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        children: [
          GestureDetector(
            onTap: (){

            },
            child: Container(
              width: 300.0,
              height: 300.0,
              color: Colors.red,
            ),
          ),
          Container(
            width: 300.0,
            height: 300.0,
            color: Colors.red,
          ),
          Container(
            width: 300.0,
            height: 300.0,
            color: Colors.red,
          ),
          Container(
            width: 300.0,
            height: 300.0,
            color: Colors.red,
          ),
          Container(
            width: 300.0,
            height: 300.0,
            color: Colors.red,
          ),
          Container(
            width: 300.0,
            height: 300.0,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
