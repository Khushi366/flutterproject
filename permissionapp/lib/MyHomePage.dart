// import 'package:flutter/material.dart';
// import 'package:permissionapp/ChatPage.dart';
// import 'package:permissionapp/CustomeDrawer.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'LoginPage.dart';
// import 'ThemeNotifier.dart';
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     var themeNotifier = Provider.of<ThemeNotifier>(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.teal,
//         centerTitle: true,
//         title: Text("MyHomePage",style: TextStyle(color: Colors.white),),
//         actions: [
//           Switch(
//             value: themeNotifier.isDarkMode,
//             onChanged: (value) {
//               themeNotifier.toggleTheme();
//             },
//             activeColor: Colors.white,
//             inactiveThumbColor: Colors.grey,
//             inactiveTrackColor: Colors.grey.shade400,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: GestureDetector(
//                 onTap: () async {
//                   SharedPreferences prefs = await SharedPreferences.getInstance();
//                   prefs.remove("islogin");
//                   Navigator.of(context).pop();
//                   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage()));
//                 },
//                 child: Icon(Icons.logout,color: Colors.white,)),
//           )
//         ],
//       ),
//
//       drawer: MyDrawer(),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(
//               child: Text("Hellow")),
//           Center(
//               child: Text("I am Flutter Developer")),
//
//
//           ElevatedButton(
//               onPressed: (){
//
//           }, child: Text("Submit"))
//         ],
//       ),
//       // body: ListView.separated(
//       //     itemCount: 13,
//       //     itemBuilder: (context,index){
//       //
//       //       return GestureDetector(
//       //         onTap: (){
//       //           Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChatPage()));
//       //
//       //         },
//       //         child: ListTile(
//       //           leading: CircleAvatar(backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6lgwn1YvWp1Yazg6mTsUpPXDKgqwMFrdBcQ&s"),),
//       //           title: Text("Hello"),
//       //           subtitle: Text("Flutter Devloper"),
//       //           isThreeLine: true,
//       //         ),
//       //       );
//       //
//       //     },
//       //   separatorBuilder: (context, index) {
//       //     return Divider(height: 0,);
//       //   },
//       // ),
//
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:permissionapp/ChatPage.dart';
import 'package:permissionapp/CustomeDrawer.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'LoginPage.dart';
import 'ThemeNotifier.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TimeOfDay? _selectedTime;

  Future<void> _selectTime(BuildContext context) async {
     TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var themeNotifier = Provider.of<ThemeNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: Text("MyHomePage", style: TextStyle(color: Colors.white)),
        actions: [
          Switch(
            value: themeNotifier.isDarkMode,
            onChanged: (value) {
              themeNotifier.toggleTheme();
            },
            activeColor: Colors.white,
            inactiveThumbColor: Colors.grey,
            inactiveTrackColor: Colors.grey.shade400,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: GestureDetector(
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove("islogin");
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Icon(Icons.logout, color: Colors.white),
            ),
          )
        ],
      ),
      drawer: MyDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("Hello")),
          Center(child: Text("I am Flutter Developer")),
          ElevatedButton(
            onPressed: () {
              _selectTime(context);
            },
            child: Text("Pick Time"),
          ),
          if (_selectedTime != null)
            Text(
              'Selected Time: ${_selectedTime!.format(context)}',
              style: TextStyle(fontSize: 20),
            ),
          ElevatedButton(
            onPressed: () {},
            child: Text("Submit"),
          ),
        ],
      ),
    );
  }
}


