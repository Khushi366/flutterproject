import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:self_practice/Theme/AppColor.dart';
import 'package:self_practice/Utility/MyHomePage/Screen.dart';
import 'package:self_practice/View/Profile/Controller.dart';

class ProfileScreen extends StatelessWidget {
  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile",style: TextStyle(color: kWhite),),
        centerTitle: true,
        backgroundColor: kAppBarColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: kWhite), // Set the back icon here
          onPressed: () {
            Get.off(()=> HomeScreen()); // Navigate back to the previous screen
          },
        ),
      ),
      body: Obx(() {
        return controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50,  // Adjust the size as needed
                  backgroundColor: Colors.blueAccent,
                  child: controller.username.value.isNotEmpty
                      ? Text(
                    controller.username.value[0].toUpperCase(),
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  )
                      : Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                "Username: ${controller.username.value}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                "Email: ${controller.email.value}",
                style: TextStyle(fontSize: 18),
              ),
              // Add other profile information here
            ],
          ),
        );
      }),
    );
  }
}
