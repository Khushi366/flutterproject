import 'package:api/AddEmployee.dart';
import 'package:api/AddProduct.dart';
import 'package:api/FakeProduct.dart';
import 'package:flutter/material.dart';

import 'FakeProductThree.dart';
import 'FakeProducttwo.dart';
import 'ViewEmployee.dart';
import 'ViewProduct.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Api",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
      body: const Center(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(8.0),
          children: [
            SizedBox(height: 50.0),
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text("Add Product"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> AddProduct()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.view_agenda),
              title: const Text("View Product"),
              onTap: () {
                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ViewProduct()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text("Add Employee"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> AddEmployee()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.view_agenda),
              title: const Text("View Employee"),
              onTap: () {
                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ViewEmployee()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.production_quantity_limits),
              title: const Text("Fake Product one"),
              onTap: () {
                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=> FakeProduct()));
              },
            ),


            ListTile(
              leading: const Icon(Icons.production_quantity_limits),
              title: const Text("Fake Product Two"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> FakeProducttwo()));
              },
            ),

            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Users"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> FakeProductThree()));
              },
            ),
          ],
        ),
      ), //Drawer
    );
  }
}
