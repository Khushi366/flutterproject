import 'package:flutter/material.dart';

class DialerScreen extends StatefulWidget {
  const DialerScreen({super.key});

  @override
  State<DialerScreen> createState() => _DialerScreenState();
}

class _DialerScreenState extends State<DialerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dialer"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  height: 50.0,
                  width: 50.0,
                  child: Text("1", style: TextStyle(fontSize: 30.0, color: Colors.green,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,)),
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 2,right: 5),
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black),
                    boxShadow: [
                    BoxShadow(color: Colors.amber.shade300,offset: Offset(-10.0,-10.0) )
                    ],

                  ),
                ),
              Container(
                height: 50.0,
                width: 50.0,
                child: Text("2", style: TextStyle(fontSize: 30.0, color: Colors.green,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,)),
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 2,right: 5),

                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                  boxShadow: [
                    //BoxShadow(color: Colors.yellow.shade300,offset: Offset(10.0,-10.0))

                    BoxShadow(color: Colors.amber.shade300,offset: Offset(-10.0,-10.0) )
                  ],

                ),
              ),
              Container(
                height: 50.0,
                width: 50.0,
                child: Text("3", style: TextStyle(fontSize: 30.0, color: Colors.green,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,)),
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 2,right: 5),

                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                  boxShadow: [
                    //BoxShadow(color: Colors.yellow.shade300,offset: Offset(10.0,-10.0))

                    BoxShadow(color: Colors.amber.shade300,offset: Offset(-10.0,-10.0) )
                  ],

                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 50.0,
                width: 50.0,
                child: Text("4", style: TextStyle(fontSize: 30.0, color: Colors.green,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,)),
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 2,right: 5),

                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                  boxShadow: [
                    //BoxShadow(color: Colors.yellow.shade300,offset: Offset(10.0,-10.0))

                    BoxShadow(color: Colors.amber.shade300,offset: Offset(-10.0,-10.0) )
                  ],

                ),
              ),
              Container(
                height: 50.0,
                width: 50.0,
                child: Text("5", style: TextStyle(fontSize: 30.0, color: Colors.green,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,)),
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 2,right: 5),

                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                  boxShadow: [
                    BoxShadow(color: Colors.amber.shade300,offset: Offset(-10.0,-10.0) )
                  ],

                ),
              ),
              Container(
                height: 50.0,
                width: 50.0,
                child: Text("6", style: TextStyle(fontSize: 30.0, color: Colors.green,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,)),
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 2,right: 5),

                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                  boxShadow: [
                    BoxShadow(color: Colors.amber.shade300,offset: Offset(-10.0,-10.0) )
                  ],

                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 50.0,
                width: 50.0,
                child: Text("7", style: TextStyle(fontSize: 30.0, color: Colors.green,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,)),
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 2,right: 5),

                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                  boxShadow: [
                    BoxShadow(color: Colors.amber.shade300,offset: Offset(-10.0,-10.0) )
                  ],

                ),
              ),
              Container(
                height: 50.0,
                width: 50.0,
                child: Text("8", style: TextStyle(fontSize: 30.0, color: Colors.green,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,)),
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 2,right: 5),

                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                  boxShadow: [
                    BoxShadow(color: Colors.amber.shade300,offset: Offset(-10.0,-10.0) )
                  ],

                ),
              ),
              Container(
                height: 50.0,
                width: 50.0,
                child: Text("9", style: TextStyle(fontSize: 30.0, color: Colors.green,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,)),
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 2,right: 5),

                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                  boxShadow: [
                    BoxShadow(color: Colors.amber.shade300,offset: Offset(-10.0,-10.0) )
                  ],

                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 50.0,
                width: 50.0,
                child: Text("*", style: TextStyle(fontSize: 30.0, color: Colors.green,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,)),
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 2,right: 5),

                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                  boxShadow: [
                    BoxShadow(color: Colors.amber.shade300,offset: Offset(-10.0,-10.0) )
                  ],

                ),
              ),
              Container(
                height: 50.0,
                width: 50.0,
                child: Text("0", style: TextStyle(fontSize: 30.0, color: Colors.green,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,)),
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 2,right: 5),

                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                  boxShadow: [
                    BoxShadow(color: Colors.amber.shade300,offset: Offset(-10.0,-10.0) )
                  ],

                ),
              ),
              Container(
                height: 50.0,
                width: 50.0,
                child: Text("#", style: TextStyle(fontSize: 30.0, color: Colors.green,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,)),
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 2,right: 5),

                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                  boxShadow: [
                    BoxShadow(color: Colors.amber.shade300,offset: Offset(-10.0,-10.0) )
                  ],

                ),
              ),
            ],
          ),
        ],
      ),

    );
  }
}
