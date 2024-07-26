// import 'dart:developer';
//
// import 'package:flutter/material.dart';
// import 'package:propsmart/helper/ApiHandler.dart';
// import 'package:propsmart/resources/UrlResources.dart';
// import 'package:propsmart/views/auth/Login.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class CustomDrawer extends StatefulWidget {
//   const CustomDrawer({super.key});
//
//   @override
//   State<CustomDrawer> createState() => _CustomDrawerState();
// }
//
// class _CustomDrawerState extends State<CustomDrawer> {
//   var firstName = "";
//   var lastname="";
//
//   getData()async
//   {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       firstName = prefs.getString("firstName").toString();
//     });
//
//         await ApiHandler.getLogin(UrlResources.PRODUCT_LOGIN_AUTH,
//             headers: {
//               'Authorization': 'Bearer ' + prefs.getString("token").toString(),
//             }).then((json) async {
//               log(json.toString());
//               setState(() {
//                 lastname = json["lastName"].toString();
//               });
//
//         });
//
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getData();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Home",style: TextStyle(color: Colors.white),),
//         backgroundColor: Colors.green,
//       ),
//       body: const Center(),
//       drawer: Drawer(
//         child: ListView(
//           padding: const EdgeInsets.all(8.0),
//           children: [
//             SizedBox(height: 50.0,),
//             ListTile(
//               leading: const Icon(Icons.add),
//               title: const Text("Add Product"),
//               onTap: () {
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.view_agenda),
//               title: const Text("View Product"),
//               onTap: () {
//
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.add),
//               title: const Text("Add Employee"),
//               onTap: () {
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.view_agenda),
//               title: const Text("View Employee"),
//               onTap: () {
//               },
//             ),
//           ],
//         ),
//       ), //Drawer
//     );
//   }
// }
//
