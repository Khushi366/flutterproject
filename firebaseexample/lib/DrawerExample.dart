import 'package:flutter/material.dart';
import 'AddEmployeeExample.dart';
import 'AddProductExample.dart';
import 'ViewEmployeeExample.dart';
import 'ViewProductExample.dart';

class DrawerExample extends StatefulWidget {
  const DrawerExample({super.key});

  @override
  State<DrawerExample> createState() => _DrawerExampleState();
}

class _DrawerExampleState extends State<DrawerExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase app",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.green,
      ),
      body: const Center(),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: [
            SizedBox(height: 50.0,),
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text("Add Product"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> AddProductExample()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.view_agenda),
              title: const Text("View Product"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ViewProductExample()));

              },
            ),
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text("Add Employee"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> AddEmployeeExample()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.view_agenda),
              title: const Text("View Employee"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ViewEmployeeExample()));
              },
            ),
          ],
        ),
      ), //Drawer
    );
  }
}
