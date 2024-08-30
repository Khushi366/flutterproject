import 'package:flutter/material.dart';

class DemoScreen extends StatefulWidget {
  const DemoScreen({super.key});

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0)
                ),
                color: Colors.blue,
              ),
              height: 100,
              width: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("1",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                ],
              ),
            ),

            Container(
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.orange
              ),
            height: 180,
            width: 260,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Today's",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                  Text("Today's",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            SizedBox(height: 20,),

            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.orange
                ),
                height: 180,
                width: 260,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue
                          ),
                          height: 80,
                          width: 70,
                        )
                      ],
                    ),
                    SizedBox(width: 12.0,),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue
                          ),
                          height: 80,
                          width: 70,
                        )
                      ],
                    ),
                    SizedBox(width: 12.0,),

                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue
                          ),
                          height: 80,
                          width: 70,
                        )
                      ],
                    ),
                   ],
                  ),
              ),
              ),

            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Full Name',
              ),
            )
          ],
        ),
      ),
    );
  }
}
