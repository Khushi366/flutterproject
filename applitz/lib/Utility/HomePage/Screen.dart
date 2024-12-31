
import 'dart:developer';
import 'package:applitz/Theme/AppColor.dart';
import 'package:applitz/Widget/MyTextBox.dart';
import 'package:applitz/Widget/OtherButton.dart';
import 'package:applitz/Widget/PrimaryButton.dart';
import 'package:applitz/Widget/SecondaryButton.dart';
import 'package:applitz/Widget/TextFormFiledBox.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();

  Future<void> _handleButtonTap(BuildContext context) async {
    // Start loading
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing the loading dialog
      builder: (_) => Center(child: CircularProgressIndicator()),
    );

    // Simulate a delay
    await Future.delayed(Duration(seconds: 2));

    // Stop loading (dismiss the dialog)
    Navigator.pop(context);
    log("Button tapped and loading completed");
  }


  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 20.0,),

           //Textfiled
           customeTextBox(
             controller: _email,
             keyboard: TextInputType.emailAddress,
            // label: "dnmfbejhd",
             hintText: "Enter email address",
             prefixIcon: Icons.email,
            // borderRadius: BorderRadius.circular(60.0),

             enabledBorder: OutlineInputBorder(
               borderSide: BorderSide(color: kGrey),
               borderRadius: BorderRadius.circular(20.0),
             ),

             focusedBorder: OutlineInputBorder(
               borderSide: BorderSide(color: kRed),
               borderRadius: BorderRadius.circular(20.0),
             ),
           ),

            SizedBox(height: 20.0,),

            customeTextBox(
              controller: _pass,
              keyboard: TextInputType.number,
              obscureText: true,
              // label: "dnmfbejhd",
              hintText: "Enter password",
              prefixIcon: Icons.email,
              // borderRadius: BorderRadius.circular(60.0),

              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kGrey),
                borderRadius: BorderRadius.circular(20.0),
              ),

              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kRed),
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),

            //Textformfiled

            formField(
              controller: _email,
              keyboard: TextInputType.emailAddress,
              hintText: "Enter email address",
              prefixIcon: Icons.email,
              // borderRadius: BorderRadius.circular(60.0),

              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kGrey),
                borderRadius: BorderRadius.circular(20.0),
              ),

              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kRed),
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            formField(
              controller: _pass,
              keyboard: TextInputType.number,
              obscureText: true,
            //  label: "Enter password",
              hintText: "Enter password",
              prefixIcon: Icons.email,
              // borderRadius: BorderRadius.circular(60.0),

              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kGrey),
                borderRadius: BorderRadius.circular(20.0),
              ),

              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kRed),
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),


            PrimaryButton(
              height: 50.0,
              width: 310.0,
              title: 'Add',
              prefixIcon: Icons.ac_unit_outlined,
              suffixIcon: Icons.ac_unit_outlined,
              color: kGrey,
              borderRadius: BorderRadius.circular(10.0),
            ),

            SizedBox(height: 20.0,),

            PrimaryButton(
              height: 50.0,
              width: 310.0,
              title: 'Enter',
              prefixIcon: Icons.ac_unit_outlined,
              suffixIcon: Icons.ac_unit_outlined,
              color: kRed,
              borderRadius: BorderRadius.circular(10.0),
              onTap: () {
                log("Custom size button tapped");
              },
            ),

            SizedBox(height: 20.0,),
            SecondaryButton(
              height: 50.0,
              width: 310.0,
              title: "Login",
              prefixIcon: Icons.ac_unit_outlined,
            // /  suffixIcon: Icons.ac_unit_outlined,
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(25.0),
              onPressed: () {
                log("Custom size button tapped");
              },
            ),

            SizedBox(height: 20.0,),
            OtherButton(
              height: 65.0,
              width: 70.0,
              icon: Icons.favorite,
              iconColor: kRed,
              iconSize: 40.0,
              color: kGrey,
              borderRadius: BorderRadius.circular(10.0),
              onTap: () {
                log("Custom size button tapped");

              },
            )

          ],
        ),
      ),
    );
  }
}
