import 'package:flutter/material.dart';

class TextfiledScreen extends StatefulWidget {
  const TextfiledScreen({super.key});

  @override
  State<TextfiledScreen> createState() => _TextfiledScreenState();
}

class _TextfiledScreenState extends State<TextfiledScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Textfiled Screen"),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter name",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurpleAccent),
                  ),
                ),
              ),
              SizedBox(height: 30),
              TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter mobile",
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurpleAccent),
                  ),
                ),
              ),
              SizedBox(height: 30),
              TextField(
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0)
                  ),
                  hintText: "Enter password",
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurpleAccent),
                  ),
                ),
              ),
              SizedBox(height: 30),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Age",
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurpleAccent),
                  )
                ),
              ),
              SizedBox(height: 30),
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter email",
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurpleAccent),
                  ),
                ),
              ),
              SizedBox(height: 30),

              TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.add_circle),
                  border: OutlineInputBorder(),
                  hintText: "This is add icon",
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurpleAccent),
                  ),
                ),
              ),
              SizedBox(height: 30),
              TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.home_mini_outlined),
                  border: OutlineInputBorder(),
                  hintText: "This is subtraction icon",
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurpleAccent),
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Container(
                width: 200.0,
                child: ElevatedButton(
                  onPressed: (){

                  }, child: Text("Submit"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
