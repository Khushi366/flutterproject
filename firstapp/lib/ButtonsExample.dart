import 'package:flutter/material.dart';

class ButtonsExample extends StatefulWidget {
  const ButtonsExample({super.key});

  @override
  State<ButtonsExample> createState() => _ButtonsExampleState();
}

class _ButtonsExampleState extends State<ButtonsExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Button Screen"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              print("Button Clicked");
            }, child: Text("Submit")),
            TextButton(onPressed: (){}, child: Text("Submit")),
            InkWell(
              onTap: (){},
              child: Text("Click Me"),
            ),
            IconButton(onPressed: (){}, icon: Icon(Icons.login)),
            GestureDetector(
              onTap: (){
                print("Image Click");
              },
              child:  Image.asset("assets/img/plane.jpeg",width: 200.0),
            ),
            OutlinedButton(onPressed: (){}, child: Text("Submit"))
          ],
        ),
      ),
    );
  }
}
