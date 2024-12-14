import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map/LoginPage/Screen.dart';
import 'package:map/Theme/AppColor.dart';
import 'Controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  // Instantiate the controller
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack12,
      appBar: AppBar(
        backgroundColor: kRed,
        title: const Text("Home Screen",style: TextStyle(color: kWhite),),
        centerTitle: true,
        leading:  IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_outlined,color: kWhite,),
            onPressed: () {
              Get.offAll(() => LoginScreen());
            },
          )
        //actions: [
        //           IconButton(
        //             icon: const Icon(Icons.exit_to_app),
        //             onPressed: () {
        //               AuthController.instance.signOut();
        //               Get.offAll(() => LoginScreen());
        //             },
        //           ),
        //         ],
      ),
      body: Obx(() {
        // Use Obx to listen to the changes in emailList and passwordList
        return controller.emailList.isEmpty
            ? const Center(child: Text("No user data found"))
            :  ListView.builder(
              itemCount: controller.emailList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: Text("Email: "+controller.emailList[index])),
                      IconButton(
                        onPressed: () => controller.deleteData(index),
                        icon: const Icon(Icons.delete),
                      )
                    ],
                  ),
                  subtitle: Text("Password: "+controller.passwordList[index]),
                );
              },
            );
          }),
        );
      }
    }
