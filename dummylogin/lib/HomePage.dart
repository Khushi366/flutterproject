
import 'dart:convert';

import 'package:dummylogin/dummylogin.dart';
import 'package:dummylogin/models/Profile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var firstName = "";
  var isLoading = true;

  Profile? myobj;


  getdata() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      firstName = prefs.getString("firstName").toString();
    });



    Uri url = Uri.parse("https://dummyjson.com/auth/me");
    var header = {
      //"token":prefs.getString("token").toString()
      'Authorization': 'Bearer '+prefs.getString("token").toString(),
    };
    // var params = {
    //   "token":prefs.getString("token").toString()
    // };
    var response = await http.get(url,headers: header);
    if(response.statusCode==200)
    {
      var data = json.decode(response.body);

      setState(() {
         myobj = Profile.fromJson(data);
        isLoading = false;
      });

      // ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(content: Text("API call and data is displayed"))
      // );
    }
    else
    {
      // ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(content: Text("Token is expired. Please login again"))
      // );
      prefs.clear();
      Navigator.of(context).pop();
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DummyLogin()));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        actions: [
          GestureDetector(
              onTap: ()async{
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.clear();
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DummyLogin()));

              },
              child: Icon(Icons.logout_outlined,color: Colors.white,)),

        ],
        title: (isLoading)?SizedBox():Text("Welcome,"+myobj!.firstName.toString(),style: TextStyle(color: Colors.white),),
      ),
      body:(isLoading)
          ? Center(child: CircularProgressIndicator())
          :  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [

          Image.network(myobj!.image!) ,
            //  myobj?.image != null
            //                 ? Image.network(myobj!.image!)
            //                 : SizedBox.shrink(),

            Row(
              children: [
                Text("Name: " + myobj!.firstName.toString() + " " + myobj!.lastName.toString(), style: TextStyle(fontSize: 18)),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text("Email: " + myobj!.email.toString(), style: TextStyle(fontSize: 18)),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text("Phone: " + myobj!.phone.toString(), style: TextStyle(fontSize: 18)),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text("Age: " + myobj!.age.toString().toString(), style: TextStyle(fontSize: 18)),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text("Gender: " + myobj!.gender.toString(), style: TextStyle(fontSize: 18)),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                    child: Text("Address: " + myobj!.address!.address.toString(), style: TextStyle(fontSize: 18))),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
