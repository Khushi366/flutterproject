import 'package:flutter/material.dart';

class StackExample extends StatefulWidget {
  const StackExample({super.key});

  @override
  State<StackExample> createState() => _StackExampleState();
}

class _StackExampleState extends State<StackExample> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child:  Image.asset("assets/img/plane.jpeg",fit: BoxFit.cover,),
        ),

        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: 200.0,
                    height: 200.0,
                    color: Colors.red,
                    margin: EdgeInsets.all(10.0),
                  ),
                  Container(
                    width: 200.0,
                    height: 200.0,
                    color: Colors.red,
                    margin: EdgeInsets.all(10.0),
                  ),
                  Container(
                    width: 200.0,
                    height: 200.0,
                    color: Colors.red,
                    margin: EdgeInsets.all(10.0),
                  ),
                  Container(
                    width: 200.0,
                    height: 200.0,
                    color: Colors.red,
                    margin: EdgeInsets.all(10.0),
                  ),
                  Container(
                    width: 200.0,
                    height: 200.0,
                    color: Colors.red,
                    margin: EdgeInsets.all(10.0),
                  ),
                  Container(
                    width: 200.0,
                    height: 200.0,
                    color: Colors.red,
                    margin: EdgeInsets.all(10.0),
                  ),
                  Container(
                    width: 200.0,
                    height: 200.0,
                    color: Colors.red,
                    alignment: Alignment.bottomCenter,
                    child: TextField(),
                    margin: EdgeInsets.all(10.0),
                  ),

                ],
              ),
            ),
          ),
        )

        // Container(
        //   width: 200.0,
        //   height: 200.0,
        //   color: Colors.red,
        // ),
        // Positioned(
        //   top: 10.0,
        //   left: 10.0,
        //   child:Container(
        //     width: 50.0,
        //     height: 50.0,
        //     color: Colors.blue,
        //   ),
        // ),
        // Positioned(
        //   bottom: 10.0,
        //   right: 10.0,
        //   child:Container(
        //     width: 50.0,
        //     height: 50.0,
        //     color: Colors.blue,
        //   ),
        // ),
        // Container(
        //   width: 100.0,
        //   height: 100.0,
        //   color: Colors.green,
        // ),
        // Container(
        //   width: 50.0,
        //   height: 50.0,
        //   color: Colors.blue,
        // ),
      ],
    );
  }
}
