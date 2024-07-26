import 'package:flutter/material.dart';
import 'package:myvan/resources/StyleResources/AppColor.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColorDark,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset("assets/img/bus1.png",scale: 2,)),
          SizedBox(height: 20), // Add spacing between the avatar and any other content
          Text(
            'MyVan',
            style: TextStyle(
              fontSize: 24,
             fontFamily: "Regular",
              color: kBlack,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Welcome to MyVan App',
            style: TextStyle(
              fontSize: 16.0,
              fontFamily: "Regular",
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
