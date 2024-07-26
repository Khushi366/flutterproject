import 'package:ecommerce/login/Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {

  final controller =  Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF8EDEDA),
                Color(0xFFA2E6D1),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Text('Sign In'),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: controller.usernameController.value,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Email",

                contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: controller.passwordController.value,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Password",
                contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              ),
            ),
            SizedBox(height: 20,),
            Obx(() {
              return controller.isLoading.value
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                  onPressed: () {
                    final params = {
                      'username': controller.usernameController.value.text,
                      'password': controller.passwordController.value.text,
                    };
                    controller.login(params);
                  },
                  child: Text("Login"),
                );
              }),

          ],
        ),
      ),
    );
  }
}
