import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageTwo extends StatefulWidget {
  HomePageTwo({super.key});

  @override
  State<HomePageTwo> createState() => _HomePageTwoState();
}

class _HomePageTwoState extends State<HomePageTwo> {
  // var email = "";
  // var pass = "";

  List<String>email =[];
  List<String>passwords =[];


  Future<void> deleteData(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      email.removeAt(index);
      passwords.removeAt(index);
    });

    // Update SharedPreferences
    await prefs.setStringList("emails", email);
    await prefs.setStringList("passwords", passwords);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Data deleted successfully")),
    );
  }

  Future<void> getData()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
     setState(() {
     // email =  prefs.getString("email")??"no data";
     // pass = prefs.getString("password")??"no data";
     email = prefs.getStringList("email")??[];
     passwords=  prefs.getStringList("passwords")??[];
     log(email.toString());
   });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: email.length,
        itemBuilder: (context,index){
          return ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("userName:"+email[index].toString()),
                IconButton( onPressed: () => deleteData(index),icon: Icon(Icons.delete))
              ],
            ),
            subtitle: Text("password:"+passwords[index]),
          );
        },
      ),
      // body: Column(
      //   children: [
      //     Text("UserName: "+email.toString()),
      //     Text("Password: "+pass.toString()),
      //
      //
      //   ],
      // ),
    );
  }
}
