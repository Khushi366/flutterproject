import 'package:flutter/material.dart';

class TextfiledsExample extends StatefulWidget {
  const TextfiledsExample({super.key});

  @override
  State<TextfiledsExample> createState() => _TextfiledsExampleState();
}

class _TextfiledsExampleState extends State<TextfiledsExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade100,
      appBar: AppBar(
        title: Text("Textfield Example"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Name"),
              TextField(
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 10.0,),
              Text("Mobile"),
              TextField(
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 10.0,),
              Text("Password"),
              TextField(
                keyboardType: TextInputType.text,
                obscureText: true,
              ),
              SizedBox(height: 10.0,),
              Text("Age"),
              TextField(
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10.0,),
              Text("Email"),
              TextField(
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 10.0,),
              ElevatedButton(onPressed: (){}, child: Text("Register"))
            ],
          ),
        ),
      ),
    );
  }
}
