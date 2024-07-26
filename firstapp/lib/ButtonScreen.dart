import 'package:flutter/material.dart';

class ButtonScreen extends StatefulWidget {
  const ButtonScreen({super.key});

  @override
  State<ButtonScreen> createState() => _ButtonScreenState();
}

class _ButtonScreenState extends State<ButtonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Button Screen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: (){

              }, child: Text("Elevated Button")),

              ElevatedButton(onPressed: (){

              }, child: Text("Elevated Button")),
            ],
          ),

          Container(
            width: 300.0,
            child: ElevatedButton(
                onPressed: (){

                }, child: Text("Elevated Button")),
          ),

          Container(
            width: 300.0,
            height: 40.0,
            child: ElevatedButton(
                onPressed: (){

                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)
                    )
                ),
                child: Text("Elevated Button")),
          ),

          Container(
            width: 300.0,
            child: OutlinedButton(
                onPressed: (){

                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.green,width: 2),

                ),
                child: Text("Outline Button")),
          ),

          IconButton(
              onPressed: (){

              },
              icon: Icon(Icons.access_time_filled),
            iconSize: 100.0,
          )
        ],
      ),
    );
  }
}
