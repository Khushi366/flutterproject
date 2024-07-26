import 'package:chatapp/GoogleMapExample.dart';
import 'package:chatapp/Razorpay.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'CloudNotification.dart';
import 'LoginPage.dart';
import 'Notification.dart';
import 'UserPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String? _name;
  String? _email;
  String? _photo;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getUserData();

  }

 Future<void> _getUserData()async
  {
    SharedPreferences prefs =  await SharedPreferences.getInstance();
    setState(() {

      _name = prefs.getString("name");
      _email = prefs.getString("email");
      _photo = prefs.getString("photo");
    });
  }



  @override
  Widget build(BuildContext context) {
   // User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Home Page",style: TextStyle(fontSize:16.0,color: Colors.white),),
        backgroundColor: Color(0xFF2B3595),
        iconTheme: IconThemeData(color: Colors.white),
        actions: [

          IconButton(
              onPressed: ()async{
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.clear();

                GoogleSignIn googleSignIn = GoogleSignIn();
                googleSignIn.signOut();


                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage()));
          }, icon:Icon(Icons.logout_outlined))
        ],
      ),

    body: Column(
      children: [

        StreamBuilder(
            stream: FirebaseFirestore.instance.collection("users").where("email",isNotEqualTo: _email).snapshots(),

            builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot)
           {
             if(snapshot.hasData)
               {

                 if(snapshot.data!.size<=0)
                 {
                   return Center(child: Text("No datad found!"),);
                 }
                 else
                 {

                   return Expanded(
                     child: ListView(
                       children: snapshot.data!.docs.map((document) {
                         return ListTile(
                           leading: CircleAvatar(
                             backgroundImage: document["photo"].toString() != null ? NetworkImage(document["photo"].toString()!) : null,
                           ),
                           title: Text(document["name"].toString()),
                           subtitle: Text(document["email"].toString()),
                           onTap: () {
                             Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserPage(
                               receiverid: document.id.toString(),
                               username: document["name"].toString(),useremail: document["email"].toString(),userphoto: document["photo"].toString(),),
                              ));
                           },
                         );
                       }).toList(),
                     ),
                   );

                 }

               }else
                 {
                   return Center(
                     child: CircularProgressIndicator(),
                   );
                 }
           }
        )
      ],
    ),


      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF2B3595)
              ),
              accountName: Text(_name??''),
              accountEmail: Text(_email??''),
              currentAccountPicture: _photo !=null? CircleAvatar(
                backgroundImage: NetworkImage(_photo!)
              ):null,

            ),
            SizedBox(height: 50.0,),
            ListTile(
              leading: const Icon(Icons.notifications_active),
              title: const Text("Notificaation"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> NotificationPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.cloud),
              title: const Text("CloudNotification"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> CloudNotification()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.cloud),
              title: const Text("Razorpay"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> RazorpayPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.location_on),
              title: const Text("Google Map"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> GoogleMapExample()));
              },
            ),
          ],
        ),
      ),

    );
  }
}
