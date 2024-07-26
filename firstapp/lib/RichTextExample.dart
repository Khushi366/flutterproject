import 'package:flutter/material.dart';

class RichTextExample extends StatefulWidget {

  const RichTextExample({super.key});

  @override
  State<RichTextExample> createState() => _RichTextExampleState();
}

class _RichTextExampleState extends State<RichTextExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RichText"),
      ),
      body: Center(
        child: RichText(
          text: TextSpan(
            children: [
              WidgetSpan(
                child: Icon(Icons.add),
              ),
              TextSpan(
                text: "0",
                style: TextStyle(
                  color: Colors.black
                )
              ),
              WidgetSpan(
                child: Icon(Icons.add),
              ),
            ]
          ),
        ),

        // child: RichText(
        //   text: TextSpan(
        //     text: "Don't Have Account?",
        //     style: TextStyle(
        //       color: Colors.black,
        //       fontSize: 20.0
        //     ),
        //     children: [
        //       TextSpan(
        //         text: "Sign Up",
        //         style: TextStyle(
        //             color: Colors.blue,
        //             fontSize: 20.0
        //         ),
        //       )
        //     ]
        //   ),
        // ),
      ),
    );
  }
}
