import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:permissionapp/SecondScreenAnimation.dart';

class FirstScreenAnimation extends StatefulWidget {
  const FirstScreenAnimation({super.key});

  @override
  State<FirstScreenAnimation> createState() => _FirstScreenAnimationState();
}

class _FirstScreenAnimationState extends State<FirstScreenAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Text("Flutter",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),),
          Expanded(
            child: Center(
                child: ElevatedButton(
                    onPressed:(){

                      Navigator.of(context).push(PageTransition(
                          type: PageTransitionType.rotate,
                          duration: Duration(seconds: 1),
                      alignment: Alignment.center,
                      child: SecondScreenAnimation()));

                    }, child: Text("Submit"))),
          )
        ],
      ),
    );
  }
}
