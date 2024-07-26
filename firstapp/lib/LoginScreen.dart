import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Login Screen"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("1"),
          Text("2"),
          Row(
            children: [
              Text("one"),
              Text("two"),
              Text("three"),
            ],
          ),
          Text("3"),
        ],
      ),
      // body: Row(
      //   children: [
      //     Text("one"),
      //     Text("two"),
      //     Column(
      //       children: [
      //         Text("1"),
      //         Text("2"),
      //         Row(
      //           children: [
      //             Text("A"),
      //             Text("A"),
      //             Text("A"),
      //           ],
      //         ),
      //         Text("3"),
      //       ],
      //     ),
      //     Text("Three"),
      //   ],
      // ),
    );
  }
}
