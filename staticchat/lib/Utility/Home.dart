import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:staticchat/ThemeApp/AppColor.dart';
import 'package:staticchat/Utility/ChatPage.dart';

class Home extends StatefulWidget {


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String currentUserId = 'Lm1oDu8Y7T5i36gIANs1';
  final String otherUserId = 'xyJDjTDks4Q1hIi81T7r';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home',style: TextStyle(color: Colors.white),),
        backgroundColor: Color(0xFF011F4B),
        centerTitle: true,// Preferred color
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection('users').doc(currentUserId).collection('chats')
                    .doc(otherUserId)
                    .collection('message')
                    .snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return ListView(
                    children:snapshot.data!.docs.map((document){
                      if(document["senderid"] == currentUserId)
                      {
                        return Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            width: 60.0,
                            decoration: BoxDecoration(
                                color: kAppBarColor,
                                borderRadius: BorderRadius.circular(10.0)
                            ),
                            child: Column(
                              children: [
                                Text(document["name"].toString(),style: TextStyle(color: kWhite),),
                                Text(document["msg"].toString(),style: TextStyle(color: kWhite),),
                              ],
                            ),
                          ),
                        );
                      }
                      else
                      {
                        return Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: 60.0,
                            decoration: BoxDecoration(
                              color: kGrey,
                              borderRadius: BorderRadius.circular(10.0)
                            ),
                            child: Column(
                              children: [
                                Text(document["name"].toString(),style: TextStyle(color: kWhite),),
                                Text(document["msg"].toString(),style: TextStyle(color: kWhite),),
                              ],
                            ),
                          ),
                        );
                      }
                    }).toList(),
                  );
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(onPressed: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context)=>ChatPage(current: currentUserId, other: otherUserId,name:"Pinal"))
                    );
                  }, child: Text("User 1")),
                ),
                SizedBox(width: 20.0,),
                Expanded(
                  child: ElevatedButton(onPressed: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=>ChatPage(current: otherUserId, other: currentUserId,name:"Khushi"))
                    );
                  }, child: Text("User 2")),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
