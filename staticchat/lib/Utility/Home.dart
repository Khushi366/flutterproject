import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final String currentUserId = 'Lm1oDu8Y7T5i36gIANs1'; // Current user (Pinal)
  final String otherUserId = 'xyJDjTDks4Q1hIi81T7r';  // Other user (Khushi)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Chat App'),
        backgroundColor: Color(0xFF011F4B), // Preferred color
      ),
      body: StreamBuilder<List<QueryDocumentSnapshot>>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(currentUserId)
            .collection('chats')
            .doc(otherUserId)
            .collection('message')
            .snapshots()
            .asyncMap((snapshot) async {
          print('Current User Messages Snapshot: ${snapshot.docs.length} documents found');
          List<QueryDocumentSnapshot> messages = snapshot.docs;

          // Fetch messages from the other user's chat with the current user
          final otherUserMessagesSnapshot = await FirebaseFirestore.instance
              .collection('users')
              .doc(otherUserId)
              .collection('chats')
              .doc(currentUserId)
              .collection('message')
              .get();

          print('Other User Messages Snapshot: ${otherUserMessagesSnapshot.docs.length} documents found');
          messages.addAll(otherUserMessagesSnapshot.docs);

          return messages;
        }),
        builder: (context, AsyncSnapshot<List<QueryDocumentSnapshot>> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final messages = snapshot.data!;
          print('Messages Data: $messages');

          return ListView.builder(
            itemCount: messages.length,
            itemBuilder: (context, index) {
              var message = messages[index]; // Correct data access

              // Extracting message data with null checks
              var senderId = message['senderid'] ?? '';
              var messageContent = message['msg'] ?? '';
              var senderName = message['name'] ?? '';

              // Check if the current user is the sender of the message
              var isSender = senderId == currentUserId;

              return Align(
                alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: isSender ? Colors.blue[100] : Colors.grey[300],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    crossAxisAlignment: isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                    children: [
                      Text(
                        senderName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        messageContent,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
