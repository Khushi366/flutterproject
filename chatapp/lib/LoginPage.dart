import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'HomePage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
 void initState() {
    // TODO: implement initState
    super.initState();

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
                onPressed: () async{
                  FirebaseAuth auth = FirebaseAuth.instance;
                  final GoogleSignIn googleSignIn = GoogleSignIn();
                  final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
                  if (googleSignInAccount != null) {
                    final GoogleSignInAuthentication googleSignInAuthentication =
                    await googleSignInAccount.authentication;
                    final AuthCredential authCredential = GoogleAuthProvider.credential(
                        idToken: googleSignInAuthentication.idToken,
                        accessToken: googleSignInAuthentication.accessToken);

                    // Getting users credential
                    UserCredential result = await auth.signInWithCredential(authCredential);


                    User user = result.user!;
                    var name = user.displayName.toString();
                    var email = user.email.toString();
                    var photo = user.photoURL.toString();

                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.setString("name", name);
                    prefs.setString("email", email);
                    prefs.setString("photo", photo);

                    //firestore insert
                    //Check for duplication

                    await FirebaseFirestore.instance.collection("users").where("email",isEqualTo: email).get().then((documents) async{
                      if(documents.docs.length<=0)
                        {
                          await FirebaseFirestore.instance.collection("users").add({
                            "name": name,
                            "email": email,
                            "photo": photo,
                          }).then((document){

                            prefs.setString("senderid", document.id.toString());
                            Navigator.of(context).pop();
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));
                          });
                        }
                      else
                        {
                          prefs.setString("senderid",documents.docs.first.id.toString());
                          Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));
                        }
                    });
                    //sp
                  }

                }, child: Text("Login with google")),
          )
        ],
      ),
    );
  }
}
