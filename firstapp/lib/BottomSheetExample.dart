import 'package:flutter/material.dart';

class BottomSheetExample extends StatefulWidget {
  const BottomSheetExample({super.key});

  @override
  State<BottomSheetExample> createState() => _BottomSheetExampleState();
}

class _BottomSheetExampleState extends State<BottomSheetExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom Sheet Example"),
      ),
      body: Builder(
        builder: (context){
          return Center(
            child: ElevatedButton(
              child: Text("Bottom sheet"),
              onPressed: (){
                showModalBottomSheet(
                    context: context, builder: (context){
                      return Wrap(
                        children: [
                          ListTile(
                            leading: Icon(Icons.share),
                            title: Text("Share"),

                          ),
                          ListTile(
                            leading: Icon(Icons.copy),
                            title: Text("Copy"),
                          ),
                          ListTile(
                            leading: Icon(Icons.edit),
                            title: Text("Edit"),
                          ),

                          SizedBox(
                            height: 120.0,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                Image.asset("assets/img/plane.jpeg",width: 100.0,),
                                SizedBox(width: 10.0,),
                                Image.asset("assets/img/plane.jpeg",width: 100.0,),
                                SizedBox(width: 10.0,),
                                Image.asset("assets/img/plane.jpeg",width: 100.0,),
                                SizedBox(width: 10.0,),
                                Image.asset("assets/img/plane.jpeg",width: 100.0,),
                                SizedBox(width: 10.0,),
                                Image.asset("assets/img/plane.jpeg",width: 100.0,),
                                SizedBox(width: 10.0,),
                                Image.asset("assets/img/plane.jpeg",width: 100.0,)
                              ],
                            ),
                          )
                        ],
                      );
                },
                );
              },
            ),
          );
        }
      ),
    );
  }
}
