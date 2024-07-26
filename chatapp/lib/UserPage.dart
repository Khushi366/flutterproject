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
                 child: StreamBuilder(
                   stream: FirebaseFirestore.instance.collection("users").doc(senderid).collection("chats")
                       .doc(widget.receiverid).collection("messages").orderBy("timestamp",descending: true).snapshots(),
                   builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot)
                   {
                     if(snapshot.hasData)
                       {
                         if(snapshot.data!.size<=0)
                           {
                             return Center(
                               child: Text("No messages"),
                             );
                           }
                         else
                           {
                             String? lastDisplayedDate;

                             return ListView(
                               reverse: false,
                               controller: _scrollController,
                               children: snapshot.data!.docs.map((document){
                                 var timestamp = document["timestamp"];
                                 var formattedTimestamp = formatTimestamp(timestamp);
                                 bool isCurrentUserMessage = document["senderid"] == senderid;
                                 var newday = formatTimestampWithDate(timestamp);

                                 bool isNewDay = newday != lastDisplayedDate;

                                 // If it's a new day, update the last displayed date and show the date indicator
                                 if (isNewDay) {
                                   lastDisplayedDate = newday;
                                 }
                                 log(newday);

                                     return Column(
                                       children: [
                                         if (isNewDay)

                                           Text(
                                             newday,
                                             style: TextStyle(color: Colors.grey),
                                           ),
                                         GestureDetector(
                                           onLongPress: (){
                                             if(isCurrentUserMessage)
                                               {
                                                 showDialog(
                                                     context: context,
                                                     builder: (BuildContext context){
                                                       return AlertDialog(
                                                         title: Text("Delete Message"),
                                                         content: Text(
                                                             "Are you sure you want to delete this message?"),
                                                         actions: [
                                                           TextButton(
                                                             onPressed: () {
                                                               Navigator.of(context).pop();
                                                             },
                                                             child: Text("Cancel"),
                                                           ),

                                                          TextButton(
                                                              onPressed: ()async{
                                                                //senderid delete
                                                                await FirebaseFirestore.instance.collection("users")
                                                                    .doc(senderid)
                                                                    .collection("chats")
                                                                    .doc(widget.receiverid)
                                                                    .collection("messages")
                                                                    .where("messageid",isEqualTo: document["messageid"]).get().then((documents) async{

                                                                      // delete image from firebasestorage

                                                                  if(documents.docs.first["type"]=="image")
                                                                  {
                                                                    var imageUrl = documents.docs.first["msg"];
                                                                    var uri = Uri.parse(imageUrl);
                                                                    var imageName = uri.pathSegments.last;
                                                                   // var imageName = imageUrl.split('/').last;

                                                                    log(imageName);

                                                                    await FirebaseStorage.instance.ref(imageName).delete().then((value) async{
                                                                      await FirebaseFirestore.instance.collection("users")
                                                                          .doc(senderid)
                                                                          .collection("chats")
                                                                          .doc(widget.receiverid)
                                                                          .collection("messages")
                                                                          .doc(documents.docs.first.id).delete().then((value) async{
                                                                        await FirebaseFirestore.instance.collection("users")
                                                                            .doc(widget.receiverid)
                                                                            .collection("chats")
                                                                            .doc(senderid)
                                                                            .collection("messages")
                                                                            .doc(documents.docs.first.id).delete();
                                                                      });
                                                                    }).catchError((error) {
                                                                      // Handle errors here
                                                                      if(error.code == 'object-not-found'){
                                                                        log("The image does not exist or has already been deleted.");

                                                                      }
                                                                      else {
                                                                        log("Error deleting image: "+ error);
                                                                      }
                                                                    });
                                                                  }
                                                                  else
                                                                    {
                                                                      await FirebaseFirestore.instance.collection("users")
                                                                          .doc(senderid)
                                                                          .collection("chats")
                                                                          .doc(widget.receiverid)
                                                                          .collection("messages")
                                                                          .doc(documents.docs.first.id).delete().then((value) async{

                                                                        await FirebaseFirestore.instance.collection("users")
                                                                            .doc(widget.receiverid)
                                                                            .collection("chats")
                                                                            .doc(senderid)
                                                                            .collection("messages")
                                                                            .doc(documents.docs.first.id).delete();
                                                                      });
                                                                    }

                                                                });

                                                                Navigator.of(context).pop();
                                                              }, child: Text("Delete"),
                                                          )
                                                         ],
                                                       );

                                                     }
                                                 );
                                               }
                                           },
                                           child: isCurrentUserMessage
                                           ?Align(
                                             alignment: Alignment.centerRight,
                                             child: Container(
                                               margin: EdgeInsets.all(10.0),
                                               padding: EdgeInsets.all(10.0),
                                               color: Color(0xFF2B3595),

                                               child: GestureDetector(
                                                   onTap: (){
                                                     if(document["type"]=="image")
                                                     {
                                                       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ImageDownload(imageUrl: document["msg"].toString(),)));

                                                     } },
                                                   child: Column(
                                                     children: [
                                                       (document["type"]=="image")?Image.network(document["msg"].toString(),width: 100.0,):Text(document["msg"].toString(),style: TextStyle(color: Colors.white),),
                                                       Text(
                                                         formattedTimestamp,
                                                         style: TextStyle(color: Colors.white),
                                                       ),
                                                     ],
                                                  ),
                                               ),
                                             ),
                                           )

                                          :Align(
                                           alignment: Alignment.centerLeft,
                                           child: Container(
                                             margin: EdgeInsets.all(10.0),
                                             padding: EdgeInsets.all(10.0),
                                             color: Color(0xFFE7EAED),
                                             child: GestureDetector(
                                                 onTap: (){
                                                   if(document["type"]=="image")
                                                   {
                                                     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ImageDownload(imageUrl: document["msg"].toString(),)));

                                                   }
                                                   },
                                                 child: Column(
                                                   children: [
                                                     (document["type"]=="image")?Image.network(document["msg"].toString(),width: 100.0,):Text(document["msg"].toString(),style: TextStyle(color: Color(0xFF1D3B55)),),
                                                     Text(
                                                       formattedTimestamp,
                                                       style: TextStyle(color: Colors.white),
                                                     ),
                                                   ],
                                                 )
                                             ),
                                           ),
                                           ),
                                         ),
                                       ],
                                     );
                               }).toList(),
                             );
                           }
                       }
                     else
                       {
                         return Center(
                           child: CircularProgressIndicator(),
                         );
                       }
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

                                         await FirebaseStorage.instance.ref(filename).putFile(myfile!).whenComplete((){}).then((filedata) async{
                                           await filedata.ref.getDownloadURL().then((fileurl) async{
                                                await FirebaseFirestore.instance.collection("users").doc(senderid).collection("chats")
                                                    .doc(widget.receiverid).collection("messages").add({
                                                "msg":fileurl,
                                                "senderid":senderid,
                                                "receiverid":widget.receiverid,
                                                "type":"image",
                                                "messageid":messageid,
                                                "timestamp":DateTime.now().millisecondsSinceEpoch
                                                }).then((value) async{
                                                    await FirebaseFirestore.instance.collection("users").doc(widget.receiverid)
                                                        .collection("chats").doc(senderid).collection("messages").add({
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

                                         var messageid= uuid.v4().toString();
                                         await FirebaseStorage.instance.ref(filename).putFile(myfile!).whenComplete((){}).then((filedata) async{
                                           await filedata.ref.getDownloadURL().then((fileurl) async{
                                             await FirebaseFirestore.instance.collection("users").doc(senderid).collection("chats")
                                                 .doc(widget.receiverid).collection("messages").add({
                                               "msg":fileurl,
                                               "senderid":senderid,
                                               "receiverid":widget.receiverid,
                                               "type":"image",
                                               "messageid":messageid,
                                               "timestamp":DateTime.now().millisecondsSinceEpoch
                                             }).then((value) async{
                                               await FirebaseFirestore.instance.collection("users").doc(widget.receiverid)
                                                   .collection("chats").doc(senderid).collection("messages").add({
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
                                     var uuid = Uuid();
                                     var messageid= uuid.v4().toString();
                                     await FirebaseFirestore.instance.collection("users").doc(senderid).collection("chats")
                                         .doc(widget.receiverid).collection("messages").add({
                                       "msg":msg,
                                       "senderid":senderid,
                                       "receiverid":widget.receiverid,
                                       "type":"text",
                                       "messageid":messageid,
                                       "timestamp":DateTime.now().millisecondsSinceEpoch
                                     }).then((value) async{
                                       await FirebaseFirestore.instance.collection("users").doc(widget.receiverid)
                                           .collection("chats").doc(senderid).collection("messages").add({
                                         "msg":msg,
                                         "senderid":senderid,
                                         "receiverid":widget.receiverid,
                                         "type":"text",
                                         "messageid":messageid,
                                         "timestamp":DateTime.now().millisecondsSinceEpoch
                                       }).then((value){
                                         log("Message Sent");

                                         WidgetsBinding.instance!.addPostFrameCallback((_) {
                                           _scrollController.animateTo(
                                             0.0,
                                             duration: Duration(milliseconds: 1),
                                             curve: Curves.easeOut,
                                           );
                                         });

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
//BubbleSpecialOne(
//   text: (document["type"] == "image")
//       ? null
//       : document["msg"].toString(),
//   color: Colors.transparent, // Set any default color if needed
//   textStyle: TextStyle(
//     fontSize: 16.0, // Adjust font size as needed
//     color: (document["type"] == "image") ? Colors.transparent : Colors.white,
//     // Adjust text color as needed
//   ),
//   // Add other properties like isSender, tail, constraints, etc. as needed
// )