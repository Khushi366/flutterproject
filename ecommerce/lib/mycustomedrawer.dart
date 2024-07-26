import 'package:ecommerce/AllUserPage/Screen.dart';
import 'package:ecommerce/MyHomePage/Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // padding: const EdgeInsets.all(8.0),
        children: [
          // UserAccountsDrawerHeader(
          //   accountName: Text(""+firstName.toString()),
          //   accountEmail: Text(""+email.toString()),
          //
          //   currentAccountPicture: image.isNotEmpty
          //       ? FadeInImage.assetNetwork(
          //     placeholder: '',
          //     image: image,
          //     width: 100,
          //     placeholderErrorBuilder: (context, error, stackTrace) {
          //       return SizedBox(
          //           width: 5.0,
          //           height: 6.0,
          //           child: CircularProgressIndicator(color: Colors.white,));
          //     },
          //   ) : CircleAvatar(
          //     child: Icon(Icons.person),
          //   ),
          //   decoration: BoxDecoration(
          //     color: Color(0xFF233645),
          //   ),
          // ),

          SizedBox(height: 50.0,),
          ListTile(
            leading: const Icon(Icons.all_out),
            title: const Text("All User Cart"),
            onTap: () {
              Get.to(AllUserScreen());
            },
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text("MyHomePage"),
            onTap: () {
              Get.to(MyHomeScreen());
            },
          ),
        ],
      ),
    );
  }

}
