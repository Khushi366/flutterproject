import 'package:flutter/material.dart';

class ExpandedExample extends StatefulWidget {
  const ExpandedExample({super.key});

  @override
  State<ExpandedExample> createState() => _ExpandedExampleState();
}

class _ExpandedExampleState extends State<ExpandedExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expanded"),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
            height: 100.0,
            color: Colors.red,
          )),
          Expanded( flex: 2,child: Container(
            height: 100.0,
            color: Colors.blue,
          )),
          Expanded( flex: 1,child: Container(
            height: 100.0,
            color: Colors.green,
          ))

          // Expanded(
          //   child: Container(
          //     color: Colors.green,
          //     child: SingleChildScrollView(
          //       child: Column(
          //         children: [
          //           Text("AAAA"),
          //           Text("AAAA"),
          //           Text("AAAA"),
          //           Text("AAAA"),
          //           Text("AAAA"),
          //           Text("AAAA"),
          //           Text("AAAA"),
          //           Text("AAAA"),
          //           Text("AAAA"),
          //           Text("AAAA"),
          //           Text("AAAA"),
          //           Text("AAAA"),
          //           Text("AAAA"),
          //           Text("AAAA"),
          //           Text("AAAA"),
          //           Text("AAAA"),
          //           Text("AAAA"),
          //           Text("AAAA"),
          //           Text("AAAA"),
          //           Text("AAAA"),
          //           Text("AAAA"),
          //           Text("AAAA"),
          //           Text("AAAA"),
          //           Text("AAAA"),
          //           Text("AAAA"),
          //           Text("AAAA"),
          //           Text("AAAA"),
          //           Text("AAAA"),
          //           Text("AAAA"),
          //           Text("AAAA"),
          //           Text("AAAA"),
          //           Text("AAAA"),
          //           Text("AAAA"),
          //           Text("AAAA"),
          //           Text("AAAA"),
          //           Text("AAAA"),
          //           Text("AAAA"),
          //           Text("AAAA"),
          //           Text("AAAA"),
          //           Text("AAAA"),
          //           Text("AAAA"),
          //           Text("AAAA"),
          //           Text("AAAA"),
          //           Text("AAAA"),
          //           Text("AAAA"),
          //           Text("AAAA"),
          //           Text("AAAA"),
          //           Text("AAAA"),
          //           Text("AAAA"),
          //           Text("AAAA"),
          //           Text("AAAA"),
          //           Text("AAAA"),
          //           Text("AAAA"),
          //           Text("AAAA"),
          //           Text("AAAA"),
          //           Text("AAAA"),
          //           Text("AAAA"),
          //           Text("AAAA"),
          //           Text("AAAA"),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          // Container(
          //   width: MediaQuery.of(context).size.width,
          //   height: 60.0,
          //   color: Colors.red,
          //   child: Row(
          //     children: [
          //       Icon(Icons.smart_display),
          //       Expanded(
          //         child: Container(
          //           child: TextField(),
          //         ),
          //       ),
          //       Icon(Icons.smart_display),
          //       Icon(Icons.smart_display),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
