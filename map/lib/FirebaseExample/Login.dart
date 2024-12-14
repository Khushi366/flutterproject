// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:map/FirebaseExample/Register.dart';
// import 'package:map/Theme/AppColor.dart';
// import 'package:map/Widget/Button.dart';
// import 'package:map/Widget/ContainerBox.dart';
// import 'package:map/Widget/CustomeTextField.dart';
//
// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});
//
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: kBlack12,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(18.0),
//           child: Column(
//             children: [
//               SizedBox(height: 30.0,),
//               Row(
//                 children: [
//                   MyContainer(
//                       height: 50.0,
//                       width: 50.0,
//                       color: kWhite,
//                       icon:  Icons.arrow_back_ios_new_outlined,
//                       onTap: () {
//
//                       }
//                   ),
//                 ],
//               ),
//               SizedBox(height: 30.0,),
//               Text("Welcome back! Glad to see you, Again!",style: TextStyle(fontSize:28.0,fontWeight: FontWeight.bold),),
//               SizedBox(height: 30.0,),
//
//               formField(
//                   hintText: "Enter your email"
//               ),
//               formField(
//                   hintText: "Enter your password",
//                   obscureText: true,
//                   suffixIcon: Icons.remove_red_eye_outlined
//               ),
//               SizedBox(height: 10.0,),
//
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Text("Forgot Password?",),
//                 ],
//               ),
//               SizedBox(height: 20.0,),
//               PrimaryButton(
//                 height: 55.0,
//                 title: 'Login',
//                 color: kRed,
//               ),
//               SizedBox(height: 25.0,),
//               Text("Or Login with"),
//               SizedBox(height: 20.0,),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Column(
//                     children: [
//                       MyContainer(
//                           height: 65,
//                           width: 130,
//                           color: kWhite,
//                           icon:  Icons.document_scanner_outlined
//                       ),
//                       SizedBox(height: 10.0,),
//                       Text("Guest",style: TextStyle(fontSize:14.0,fontWeight: FontWeight.bold),),
//                     ],
//                   ),
//                   SizedBox(width: 10.0,),
//                   Column(
//                     children: [
//                       MyContainer(
//                           height: 65,
//                           width: 130,
//                           color: kWhite,
//                           icon:  Icons.ac_unit_outlined
//                       ),
//                       SizedBox(height: 10.0,),
//                       Text("Apple",style: TextStyle(fontSize:14.0,fontWeight: FontWeight.bold),),
//                     ],
//                   ),
//                 ],
//               ),
//               SizedBox(height: 50.0,),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text("Don't have an account",style: TextStyle(fontSize:14.0,fontWeight: FontWeight.bold),),
//                   InkWell(
//                       onTap: (){
//                         Get.to(()=> RegisterPage());
//                       },
//                       child: Text("?Register Now",style: TextStyle(fontSize:14.0,fontWeight: FontWeight.bold,color: kRed),)),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
