import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:self_practice/View/Profile/Controller.dart';
import 'package:self_practice/View/Profile/Screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController()); // Initialize ProfileController

    return Drawer(
      child: ListView(
        children: [
          Obx(() {
            return UserAccountsDrawerHeader(
              accountName: Text(controller.username.value),  // Display username
              accountEmail: Text(controller.email.value),     // Display email
              currentAccountPicture: controller.username.value.isNotEmpty
                  ? CircleAvatar(
                child: Text(controller.username.value[0].toUpperCase()),
                backgroundColor: Colors.white,
              )
                  : CircleAvatar(
                child: Icon(Icons.person),
              ),
              decoration: BoxDecoration(
                color: Color(0xFF233645),
              ),
            );
          }),

          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Profile"),
            onTap: () {
              Get.off(() => ProfileScreen());
            },
          ),
        ],
      ),
    );
  }
}
