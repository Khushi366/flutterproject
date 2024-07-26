import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CloudNotification extends StatefulWidget {
  const CloudNotification({super.key});

  @override
  State<CloudNotification> createState() => _CloudNotificationState();
}

class _CloudNotificationState extends State<CloudNotification> {
  var token = "";


  getdata() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString("firebasetoken").toString();
    });
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
        centerTitle: true,
        title: Text("Cloud Notification",style: TextStyle(fontSize:16.0,color: Colors.white),),
        backgroundColor: Color(0xFF2B3595),
      ),
      body: Text(token),

    );
  }
}
