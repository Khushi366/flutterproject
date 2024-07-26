import 'package:flutter/material.dart';

class ContainerWidgetExample extends StatefulWidget {
  const ContainerWidgetExample({super.key});

  @override
  State<ContainerWidgetExample> createState() => _ContainerWidgetExampleState();
}

class _ContainerWidgetExampleState extends State<ContainerWidgetExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Container"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              //width: 200.0,
              width: MediaQuery.of(context).size.width,
              height: 200.0,
              //height: MediaQuery.of(context).size.height ,

              margin: EdgeInsets.all(50.0),
              alignment: Alignment.bottomCenter,
              // padding: EdgeInsets.only(top: 50.0,left: 10.0),
              padding: EdgeInsets.all(10.0),
              child: Text("Hello",style: TextStyle(
                  color: Colors.white
              ),),
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all(color: Colors.blue,width: 5.0),
                  boxShadow: [
                    BoxShadow(color: Colors.yellow.shade300,offset: Offset(10.0,-10.0))
                  ]
              ),
              // child: Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Text("Hello"),
              //     Text("Hello"),
              //     Text("Hello"),
              //   ],
              // ),
            ),
            Container(
              //width: 200.0,
              width: MediaQuery.of(context).size.width,
              height: 200.0,
              //height: MediaQuery.of(context).size.height ,

              margin: EdgeInsets.all(50.0),
              alignment: Alignment.bottomCenter,
              // padding: EdgeInsets.only(top: 50.0,left: 10.0),
              padding: EdgeInsets.all(10.0),
              child: Text("Hello",style: TextStyle(
                  color: Colors.white
              ),),
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all(color: Colors.blue,width: 5.0),
                  boxShadow: [
                    BoxShadow(color: Colors.yellow.shade300,offset: Offset(10.0,-10.0))
                  ]
              ),
              // child: Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Text("Hello"),
              //     Text("Hello"),
              //     Text("Hello"),
              //   ],
              // ),
            ),
            Container(
              //width: 200.0,
              width: MediaQuery.of(context).size.width,
              height: 200.0,
              //height: MediaQuery.of(context).size.height ,

              margin: EdgeInsets.all(50.0),
              alignment: Alignment.bottomCenter,
              // padding: EdgeInsets.only(top: 50.0,left: 10.0),
              padding: EdgeInsets.all(10.0),
              child: Text("Hello",style: TextStyle(
                  color: Colors.white
              ),),
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all(color: Colors.blue,width: 5.0),
                  boxShadow: [
                    BoxShadow(color: Colors.yellow.shade300,offset: Offset(10.0,-10.0))
                  ]
              ),
              // child: Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Text("Hello"),
              //     Text("Hello"),
              //     Text("Hello"),
              //   ],
              // ),
            ),
            Container(
              //width: 200.0,
              width: MediaQuery.of(context).size.width,
              height: 200.0,
              //height: MediaQuery.of(context).size.height ,

              margin: EdgeInsets.all(50.0),
              alignment: Alignment.bottomCenter,
              // padding: EdgeInsets.only(top: 50.0,left: 10.0),
              padding: EdgeInsets.all(10.0),
              child: Text("Hello",style: TextStyle(
                  color: Colors.white
              ),),
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all(color: Colors.blue,width: 5.0),
                  boxShadow: [
                    BoxShadow(color: Colors.yellow.shade300,offset: Offset(10.0,-10.0))
                  ]
              ),
              // child: Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Text("Hello"),
              //     Text("Hello"),
              //     Text("Hello"),
              //   ],
              // ),
            )
          ],
        ),
      ),
    );
  }
}
