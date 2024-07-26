import 'package:flutter/material.dart';

class AlertDialogAndTtfExample extends StatefulWidget {
  const AlertDialogAndTtfExample({super.key});

  @override
  State<AlertDialogAndTtfExample> createState() => _AlertDialogAndTtfExampleState();
}

class _AlertDialogAndTtfExampleState extends State<AlertDialogAndTtfExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade50,
     
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Hellow World",style: TextStyle(
              fontFamily: "Madami",
              fontSize: 40.0
            ),),
            SizedBox(height: 20,),
            Text("Hellow World"),
            SizedBox(height: 20,),

            ElevatedButton(
                onPressed: (){

                  AlertDialog dialog = AlertDialog(
                    backgroundColor: Colors.red.shade50,
                    elevation: 10.0,
                    contentPadding: EdgeInsets.all(15.0),
                    title: Text("Warning"),
                    content: Text("Are you sure?"),
                    actions: [
                      ElevatedButton(onPressed: (){}, child: Text("Yes")),
                      ElevatedButton(onPressed: (){
                        Navigator.of(context).pop();
                      }, child: Text("Cancel")),
                    ],
                  );

                  showDialog(context: context, builder: (context){return dialog;});

                }, child: Text("Click"),
            ),
          ],
        ),
      ),
    );
  }
}
