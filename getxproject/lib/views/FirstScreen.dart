import 'package:flutter/material.dart';
import 'package:getxproject/views/SecondScreen.dart';
import 'package:get/get.dart';
class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: Text("FirstScreen",style: TextStyle(color: Colors.white),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
                onPressed: (){
                  Get.snackbar(
                      "Warning", "This is message",
                    margin: EdgeInsets.all(10),
                    snackPosition: SnackPosition.BOTTOM,

                  );
                  Get.defaultDialog(
                    title: "Confirmation",
                    middleText: "Do you want to go the second screen?",
                    textCancel: "No",
                    textConfirm: "Yes",
                    onConfirm: (){
                      Get.back();
                      Get.to(SecondScreen());
                    },
                    onCancel: (){
                      Get.back();
                    }
                  );


                //  Get.to(SecondScreen());

                }, child: Text("Submit")
            ),
          )
        ],
      ),
    );
  }
}
