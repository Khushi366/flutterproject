import 'package:dioexample/LoginPage/Controller.dart';
import 'package:dioexample/ProductPage/Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {

  final LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    // TextEditingController _username = TextEditingController();
    // TextEditingController _pass = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text("DummyLogin",style: TextStyle(fontSize: 20.0,color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 20.0,),
            TextField(
              controller: controller.username,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Email",
                contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              ),
            ),

            SizedBox(height: 20.0,),

            TextField(
              controller: controller.password,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "password",
                contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              ),
            ),

            SizedBox(height: 20.0,),

            ElevatedButton(
                onPressed: () async{


                  var status = await controller.login();
                  if(status==true)
                    {
                      Get.to(ProductScreen());
                    }
                  else {
                    // Optionally show an error message
                    Get.snackbar(
                      'Login Failed',
                      'Please check your credentials',
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  }


            }, child: Text("Login"))
          ],
        ),
      ),
    );
  }
}
