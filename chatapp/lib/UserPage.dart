import 'dart:developer';
import 'dart:io';
import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:uuid/uuid.dart';
import 'ImageDownload.dart';

class UserPage extends StatefulWidget {

  var username = "";
  var useremail = "";
  var userphoto = "";
  var receiverid="";

  UserPage({super.key,required this.username, required this.useremail, required this.userphoto,required this.receiverid});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {

  var isTyping = false;
  File?myfile;
  var senderid="";
  var isloading=false;
 // List<String> formattedTimestamps = [];


  ScrollController _scrollController = ScrollController();
  TextEditingController _msg = TextEditingController();


  getdata() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      senderid = prefs.getString("senderid").toString();
    });
  }

  String formatTimestamp(int timestamp) {
    var now = DateTime.now();
    var messageTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    var difference = now.difference(messageTime);

    if (difference.inSeconds < 60) {
      return 'Just now';
    } else if (difference.inMinutes == 1) {
      return '1 minute ago';
    } else if (difference.inMinutes < 60) {
      return  difference.inMinutes.toString() + ' minutes ago';
    } else if (difference.inHours == 1) {
      return '1 hour ago';
    } else if (difference.inHours < 24) {
      return difference.inHours.toString() + ' hours ago';
    } else if (difference.inDays == 1) {
      return '1 day ago';
    } else {
      return difference.inDays.toString() + ' days ago';
    }
  }



  String formatTimestampWithDate(int timestamp)
  {
    var  now =  DateTime.now();
    var messageTime =  DateTime.fromMicrosecondsSinceEpoch(timestamp * 1000);


    if(now.year == messageTime.year && now.month == messageTime.month && now.day == messageTime.day)
      {
        return "Today";
      }

    else if(now.year == messageTime.year && now.month == messageTime.month && now.day - messageTime.day == 1)
    {

      return "Yesterday";
    }
    else
      {

        var dateFormat = DateFormat('MMM,dd, yyyy');
        return dateFormat.format(messageTime);

      }
  }

  String formatDateGroup(Timestamp timestamp) {
    DateTime date = timestamp.toDate();
    DateTime now = DateTime.now();

    if (date.year == now.year && date.month == now.month && date.day == now.day) {
      return 'Today';
    } else if (date.year == now.year && date.month == now.month && date.day == now.day - 1) {
      return 'Yesterday';
    } else {
      return DateFormat('dd MMM yyyy').format(date); // Format as '01 Jan 2023'
    }
  }

  Timestamp stringToTimestamp(String timestampString) {
    // Parse the string to an integer representing milliseconds since epoch
    int millisecondsSinceEpoch = int.parse(timestampString);

    // Create a DateTime object from the milliseconds
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);

    // Convert the DateTime object to a Timestamp
    return Timestamp.fromDate(dateTime);
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
       children: [
         Container(
           width: double.infinity,
           height: double.infinity,
           color: Color(0xFFFBFAFF),
           child: Image.asset("assets/img/chatback.png",fit: BoxFit.fill,),
         ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
             title: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(widget.username,style: TextStyle(color: Colors.white,fontSize: 14.0)),
                 Text(widget.useremail,style: TextStyle(color: Colors.white,fontSize: 14.0),),
               ],
             ),
             backgroundColor: Color(0xFF2B3595),
             iconTheme: IconThemeData(color: Colors.white),
             leading: Row(
               children: [
                 GestureDetector(
                     onTap: (){
                       Navigator.of(context).pop();
                     },
                     child: Icon(Icons.arrow_back)),
                 SizedBox(width: 5.0,),
                 CircleAvatar(
                   radius: 13.0,
                   backgroundImage: NetworkImage(widget.userphoto),

                 ),

               ],
             ),
           ),
           body: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children:[
               Expanded(
                 child: (senderid=="")?SizedBox():StreamBuilder<QuerySnapshot>(
                   stream: FirebaseFirestore.instance.collection("users").doc(senderid).collection("chats").snapshots(),
                   builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot)
                   {
                     if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                       return Center(child: Text('No chats found'));
                     }
                     return ListView(
                       children: snapshot.data!.docs.map((e){
                         return Text(e.id.toString());
                       }).toList(),
                     );
                   },
                 )
               ),
               Align(
                 alignment: Alignment.bottomCenter,
                 child: Padding(
                   padding: EdgeInsets.all(8.0),
                   child: SizedBox(
                     height: 44,
                     child: Row(
                       children: [
                         Expanded(
                           child: TextField(
                             controller: _msg,
                             onChanged: (value){
                               setState(() {
                                 isTyping = value.isNotEmpty;
                               });
                             },
                             onEditingComplete: () {
                               setState(() {
                                 isTyping = false;
                               });
                             },
                             textAlignVertical: TextAlignVertical.center,
                             textAlign: TextAlign.start,
                             decoration: InputDecoration(
                               filled: true,
                               suffixIcon: Row(
                                 mainAxisSize: MainAxisSize.min,
                                 children: [
                                   // image delete
                                   GestureDetector(
                                       onTap: ()async{

                                         ImagePicker picker = ImagePicker();
                                         XFile? image = await picker.pickImage(source: ImageSource.gallery,imageQuality: 50);
                                         myfile = File(image!.path);

                                         var uuid = Uuid();

                                         var filename = uuid.v1().toString()+".png";

                                         setState(() {
                                           isloading=true;
                                         });

                                         var messageid= uuid.v4().toString();
                                         DateTime now = DateTime.now();
                                         String currentdate = DateFormat('yyyy-MM-dd').format(now);
                                         await FirebaseStorage.instance.ref(filename).putFile(myfile!).whenComplete((){}).then((filedata) async{
                                           await filedata.ref.getDownloadURL().then((fileurl) async{
                                                await FirebaseFirestore.instance.collection("users").doc(senderid).collection("chats")
                                                    .doc(widget.receiverid).collection("mydates").doc(currentdate).collection("messages").add({
                                                "msg":fileurl,
                                                "senderid":senderid,
                                                "receiverid":widget.receiverid,
                                                "type":"image",
                                                "messageid":messageid,
                                                "timestamp":DateTime.now().millisecondsSinceEpoch
                                                }).then((value) async{
                                                    await FirebaseFirestore.instance.collection("users").doc(widget.receiverid)
                                                        .collection("chats").doc(senderid).collection("mydates").doc(currentdate).collection("messages").add({
                                                        "msg":fileurl,
                                                        "senderid":senderid,
                                                        "receiverid":widget.receiverid,
                                                        "type":"image",
                                                      "messageid":messageid,
                                                        "timestamp":DateTime.now().millisecondsSinceEpoch
                                                    }).then((value){
                                                      log("Message Sent");
                                                      setState(() {
                                                        isloading=false;
                                                      });

                                                    });

                                                });
                                           });
                                         });

                                       },
                                       child: Icon(Icons.photo,color: Colors.black38,)),
                                   GestureDetector(
                                       onTap: ()async{

                                         ImagePicker picker = ImagePicker();
                                         XFile? image = await picker.pickImage(source: ImageSource.camera,imageQuality: 50);
                                         myfile = File(image!.path);

                                         var uuid = Uuid();

                                         var filename = uuid.v1().toString()+".png";

                                         setState(() {
                                           isloading=true;
                                         });
                                         DateTime now = DateTime.now();
                                         String currentdate = DateFormat('yyyy-MM-dd').format(now);
                                         var messageid= uuid.v4().toString();
                                         await FirebaseStorage.instance.ref(filename).putFile(myfile!).whenComplete((){}).then((filedata) async{
                                           await filedata.ref.getDownloadURL().then((fileurl) async{
                                             await FirebaseFirestore.instance.collection("users").doc(senderid).collection("chats")
                                                 .doc(widget.receiverid).collection("mydates").doc(currentdate).collection("messages").add({
                                               "msg":fileurl,
                                               "senderid":senderid,
                                               "receiverid":widget.receiverid,
                                               "type":"image",
                                               "messageid":messageid,
                                               "timestamp":DateTime.now().millisecondsSinceEpoch
                                             }).then((value) async{
                                               await FirebaseFirestore.instance.collection("users").doc(widget.receiverid)
                                                   .collection("chats").doc(senderid).collection("mydates").doc(currentdate).collection("messages").add({
                                                 "msg":fileurl,
                                                 "senderid":senderid,
                                                 "receiverid":widget.receiverid,
                                                 "type":"image",
                                                 "messageid":messageid,
                                                 "timestamp":DateTime.now().millisecondsSinceEpoch
                                               }).then((value){
                                                 log("Message Sent");
                                                 setState(() {
                                                   isloading=false;
                                                 });

                                               });

                                             });
                                           });
                                         });

                                       },
                                       child: Icon(Icons.camera_alt,color: Colors.black38,)),
                                   SizedBox(width: 10.0,)

                                 ],
                               ),
                               fillColor: Colors.white,
                               hintText: "Message",
                               border: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(30.0)
                               ),
                               contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                             ),
                           ),
                         ),

                         SizedBox(width: 3.0,),
                         (isloading)?CircularProgressIndicator():Container(
                           decoration: BoxDecoration(
                               shape: BoxShape.circle,
                               color: Color(0xFF2B3595)
                           ),
                           child: IconButton(
                               onPressed: () async{
                                 //
                                 // log("Senderid : " + senderid);
                                 // log("Receiverid : " + widget.receiverid);


                                 //text delete
                                 var msg = _msg.text.toString();
                                 _msg.text="";

                                 if(msg!="")
                                   {
                                     DateTime now = DateTime.now();
                                     String currentdate = DateFormat('yyyyMMdd').format(now);
                                     var uuid = Uuid();
                                     var messageid= uuid.v4().toString();
                                     await FirebaseFirestore.instance.collection("users").doc(senderid).collection("chats")
                                         .doc(widget.receiverid).collection("mydates").doc("x"+currentdate).collection("messages").add({
                                       "msg":msg,
                                       "senderid":senderid,
                                       "receiverid":widget.receiverid,
                                       "type":"text",
                                       "messageid":messageid,
                                       "timestamp":DateTime.now().millisecondsSinceEpoch
                                     }).then((value) async{
                                       await FirebaseFirestore.instance.collection("users").doc(widget.receiverid)
                                           .collection("chats").doc(senderid).collection("mydates").doc("x"+currentdate).collection("messages").add({
                                         "msg":msg,
                                         "senderid":senderid,
                                         "receiverid":widget.receiverid,
                                         "type":"text",
                                         "messageid":messageid,
                                         "timestamp":DateTime.now().millisecondsSinceEpoch
                                       }).then((value){
                                         log("Message Sent");

                                         // WidgetsBinding.instance!.addPostFrameCallback((_) {
                                         //   _scrollController.animateTo(
                                         //     0.0,
                                         //     duration: Duration(milliseconds: 1),
                                         //     curve: Curves.easeOut,
                                         //   );
                                         // });

                                       });
                                     });
                                   }
                               }, icon: isTyping ?Icon(Icons.send,color: Colors.white,size: 20.0,):Icon(Icons.mic,color: Colors.white,size: 20.0,)),
                         )
                       ],
                     ),
                   ),
                 ),
               ),
              // SizedBox(height: 10.0,)
             ],
           ),
         ),
       ],
    );
  }
}


