import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ConfirmExample extends StatefulWidget {
  const ConfirmExample({super.key});

  @override
  State<ConfirmExample> createState() => _ConfirmExampleState();
}

class _ConfirmExampleState extends State<ConfirmExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Opacity(
              opacity: 0.10,
              child: Image.asset(
                "assets/img/confirmgroup.png",
                height: 100.0,
                width: 400.0,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset(
                        "assets/img/Success Illustration.png",
                        height: 120.0,
                        width: 144.0,
                      ),
                    ),
                    Text("Congratulation!",style: TextStyle(fontFamily: "SourceSansPro",color: Color(0xFFFE7551),fontSize: 24.0,),),
                    Text("Your order is successful",style: TextStyle(fontFamily: "Semibold",color: Color(0xFF010101),fontSize: 18.0,),),

                  ],
                ),
              ),
            ),
            Opacity(
                opacity: 0.10,
                child: Image.asset("assets/img/group.png",height: 90,)),
          ],
        ),
      ),
    );
  }
}
