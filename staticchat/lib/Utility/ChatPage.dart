import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
      appBar: AppBar(
        title: Text(widget.name),// Preferred color
      ),
      body: Column(
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
                          child: Text(document["msg"].toString()),
                        ),
                      );
                    }
                    else
                    {
                      return Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Text(document["msg"].toString()),
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
    );
  }
}
