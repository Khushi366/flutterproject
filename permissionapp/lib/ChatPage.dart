// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';
// // import 'package:flutter_contacts/flutter_contacts.dart';
// // import 'package:permission_handler/permission_handler.dart';
// //
// // class ChatPage extends StatefulWidget {
// //   const ChatPage({super.key});
// //
// //   @override
// //   State<ChatPage> createState() => _ChatPageState();
// // }
// //
// // class _ChatPageState extends State<ChatPage> {
// //
// //   static const platform = MethodChannel('com.example.permissionapp/contacts');
// //  // List<Map<String, String>> _contacts = [];
// //   List<Contact> _contacts = [];
// //   bool _isLoading = false;
// //
// //   Future<void> _readContacts() async {
// //     setState(() {
// //       _isLoading = true;
// //     });
// //     PermissionStatus status = await Permission.contacts.status;
// //     print('Initial contact permission status: $status');
// //
// //     if (status.isDenied || status.isRestricted || status.isPermanentlyDenied) {
// //       status = await Permission.contacts.request();
// //       print('Requested contact permission status: $status');
// //     }
// //
// //     if (status.isGranted) {
// //       print('Contacts permission granted');
// //       try {
// //         // final List<dynamic> contacts = await platform.invokeMethod('getContacts');
// //         // setState(() {
// //         //   _contacts = contacts.cast<Map<String, String>>();
// //         // });
// //         final List<Contact> contacts = await FlutterContacts.getContacts(
// //           withProperties: true,
// //           withPhoto: true,
// //         );
// //         setState(() {
// //           _contacts = contacts;
// //         });
// //       } on PlatformException catch (e) {
// //         print("Failed to get contacts: '${e.message}'.");
// //       }
// //     } else {
// //       print('Contacts permission denied');
// //     }
// //     setState(() {
// //       _isLoading = false;
// //     });
// //   }
// //
// //   Future<void> _requestGalleryPermission() async {
// //     // Request permission to access the gallery
// //     PermissionStatus status = await Permission.storage.status;
// //     if (status.isDenied || status.isRestricted || status.isPermanentlyDenied) {
// //       status = await Permission.storage.request();
// //     }
// //
// //     if (status.isGranted) {
// //       // Handle gallery access here
// //       // Example: You can now access the gallery
// //       print('Gallery permission granted');
// //     } else {
// //       print('Gallery permission denied');
// //     }
// //   }
// //
// //
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: Colors.teal,
// //         title: Text('Contacts'),
// //       ),
// //       body: Column(
// //         children: [
// //           Expanded(
// //             child:  _isLoading
// //                 ? Center(child: CircularProgressIndicator())
// //                 : _contacts.isEmpty
// //                 ? Center(
// //               child: Text(
// //                 'No contacts available',
// //                 style: TextStyle(fontSize: 18),
// //               ),
// //             )
// //                 : ListView.builder(
// //               itemCount: _contacts.length,
// //               itemBuilder: (context, index) {
// //                 final contact = _contacts[index];
// //                 String phoneNumber = contact.phones.isNotEmpty
// //                     ? contact.phones.first.number
// //                     : '--';
// //                 return ListTile(
// //                   title: Text('${contact.name.first} ${contact.name.last}'),
// //                   subtitle: Text(phoneNumber),
// //                 );
// //               },
// //             ),
// //           ),
// //           Container(
// //             height: 50.0,
// //             width: double.infinity,
// //             decoration: BoxDecoration(
// //               color: Colors.white,
// //               border: Border.all(
// //                 color: Colors.grey, // Border color
// //                 width: 1.0, // Border width
// //               ),
// //               borderRadius: BorderRadius.circular(30.0),
// //             ),
// //             child: Row(
// //               mainAxisAlignment: MainAxisAlignment.end,
// //               children: [
// //                 IconButton(
// //                   icon: Icon(Icons.phone_android_outlined),
// //                   onPressed: _readContacts,
// //                 ),
// //                 IconButton(
// //                   icon: Icon(Icons.photo_album_outlined),
// //                   onPressed: _requestGalleryPermission,
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
//
//
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_contacts/flutter_contacts.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:photo_manager/photo_manager.dart';
//
// class ChatPage extends StatefulWidget {
//   const ChatPage({Key? key}) : super(key: key);
//
//   @override
//   State<ChatPage> createState() => _ChatPageState();
// }
//
// class _ChatPageState extends State<ChatPage> {
//   List<Contact> _contacts = [];
//   //List<String> _imagePaths = [];
//   List<AssetEntity> _mediaFiles = [];
//
//   bool _isLoadingContacts = false;
//   bool _isLoadingGallery = false;
//
//   Future<void> _readContacts() async {
//     setState(() {
//       _isLoadingContacts = true;
//       _isLoadingGallery = false; // Ensure only one section is loading
//     });
//
//     PermissionStatus status = await Permission.contacts.status;
//     if (status.isDenied || status.isRestricted || status.isPermanentlyDenied) {
//       status = await Permission.contacts.request();
//     }
//
//     if (status.isGranted) {
//       try {
//         final List<Contact> contacts = await FlutterContacts.getContacts(
//           withProperties: true,
//           withPhoto: true,
//         );
//         setState(() {
//           _contacts = contacts;
//         });
//       } on PlatformException catch (e) {
//         print("Failed to get contacts: '${e.message}'.");
//       }
//     } else {
//       print('Contacts permission denied');
//     }
//
//     setState(() {
//       _isLoadingContacts = false;
//     });
//   }
//
//
//
// // storage permission.
//   Future<void> requestStoragePermission() async {
//     var status = await Permission.storage.status;
//     await Permission.storage.request();
//     if (status.isDenied) {
//       await Permission.storage.request();
//     }
//     if (await Permission.storage.isGranted) {
//
//       fetchAllMedia().then((mediaFiles) {
//         setState(() {
//           _mediaFiles = mediaFiles;
//         });
//       });
//
//     } else {
//       openAppSettings();
//     }
//   }
//
//   Future<List<AssetEntity>> fetchAllMedia() async {
//     // Request permission
//     List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
//       type: RequestType.image, // Fetch all types of media
//     );
//
//     // Fetch all media
//     List<AssetEntity> allMedia = [];
//     for (var album in albums) {
//       int assetCount = await album.assetCountAsync;
//       List<AssetEntity> mediaFiles = await album.getAssetListRange(
//         start: 0,
//         end: assetCount,
//       );
//       allMedia.addAll(mediaFiles);
//     }
//
//     return allMedia;
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     requestStoragePermission();
//
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.teal,
//         title: Text('Contacts & Gallery'),
//       ),
//       body: _isLoadingContacts
//           ? Center(child: CircularProgressIndicator())
//           : _isLoadingGallery
//           ? Center(child: CircularProgressIndicator())
//           : Column(
//         children: [
//           if (_contacts.isNotEmpty)
//             Expanded(
//               child: ListView.builder(
//                 itemCount: _contacts.length,
//                 itemBuilder: (context, index) {
//                   final contact = _contacts[index];
//                   String phoneNumber = contact.phones.isNotEmpty
//                       ? contact.phones.first.number
//                       : '--';
//                   return ListTile(
//                     title: Text(
//                         '${contact.name.first} ${contact.name.last}'),
//                     subtitle: Text(phoneNumber),
//                   );
//                 },
//               ),
//             ),
//           if (_mediaFiles.isNotEmpty)
//             Expanded(
//               child: GridView.builder(
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 4,
//                   mainAxisSpacing: 4,
//                 ),
//                 itemCount: _mediaFiles.length,
//                 itemBuilder: (context, index) {
//                   return FutureBuilder<Uint8List?>(
//                     future: _mediaFiles[index].thumbnailData,
//                     builder: (context, snapshot) {
//                       if (snapshot.connectionState == ConnectionState.done && snapshot.data != null) {
//                         return Image.memory(snapshot.data!, fit: BoxFit.cover);
//                       } else {
//                         return Center(child: Icon(Icons.photo,color: Colors.black12,));
//                       }
//                     },
//                   );
//                 },
//               ),
//             ),
//         ],
//       ),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Container(
//           height: 50.0,
//           width: double.infinity,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             border: Border.all(
//               color: Colors.grey,
//               width: 1.0,
//             ),
//             borderRadius: BorderRadius.circular(30.0),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               IconButton(
//                 icon: Icon(Icons.phone_android_outlined),
//                 onPressed: () {
//                   _readContacts();
//                   setState(() {
//                     _mediaFiles.clear(); // Clear image paths when switching to contacts
//                   });
//                 },
//               ),
//               IconButton(
//                 icon: Icon(Icons.photo_album_outlined),
//                 onPressed: () {
//                   requestStoragePermission();
//                   setState(() {
//                     _contacts.clear(); // Clear contacts when switching to gallery
//                   });
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
