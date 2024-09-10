import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:staticchat/ThemeApp/AppColor.dart';
class ChatPage extends StatefulWidget {

  var current="";
  var other="";
  var name="";

  ChatPage({required this.current,required this.other,required this.name});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
   String currentUserId = '';
   String otherUserId = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      currentUserId = widget.current;
      otherUserId = widget.other;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.name),// Preferred color
      // ),
      appBar: AppBar(
        title: Text(widget.name,style: TextStyle(color: Colors.white),),
        backgroundColor: Color(0xFF011F4B),
        centerTitle: true,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(
          color: Colors.white, // Set the leading icon color here
        ),
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
                                Text(document["name"].toString(),style: TextStyle(color: Colors.white),),
                                Text(document["msg"].toString(),style: TextStyle(color: Colors.white),),
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
                                Text(document["name"].toString(),style: TextStyle(color: Colors.white),),
                                Text(document["msg"].toString(),style: TextStyle(color: Colors.white),),
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

          ],
        ),
      ),
    );
  }
}
