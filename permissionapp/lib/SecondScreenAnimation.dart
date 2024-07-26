import 'package:flutter/material.dart';

class SecondScreenAnimation extends StatefulWidget {
  const SecondScreenAnimation({super.key});

  @override
  State<SecondScreenAnimation> createState() => _SecondScreenAnimationState();
}

class _SecondScreenAnimationState extends State<SecondScreenAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("SecondScreen",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),)),

        ],
      ),

    );
  }
}
