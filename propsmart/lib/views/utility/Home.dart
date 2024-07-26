import 'package:flutter/material.dart';
import 'package:propsmart/views/auth/Login.dart';
import 'package:propsmart/views/product/AddProduct.dart';
import 'package:propsmart/views/product/ViewProduct.dart';
import 'package:propsmart/views/profile/MyProfile.dart';
import 'package:propsmart/widgets/MyDrawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.clear();
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Login()));
              },
              child: Icon(Icons.logout_outlined))
        ],
        backgroundColor: Color(0xFF233645),
        title: Text("Home",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 16.0),),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: const Center(),
      drawer: MyDrawer(), //Drawer
    );
  }
}

