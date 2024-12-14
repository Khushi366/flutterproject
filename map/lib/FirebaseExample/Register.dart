// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:map/FirebaseExample/Login.dart';
// import 'package:map/Theme/AppColor.dart';
// import 'package:map/Widget/Button.dart';
// import 'package:map/Widget/ContainerBox.dart';
// import 'package:map/Widget/CustomeTextField.dart';
//
// class RegisterPage extends StatefulWidget {
//   const RegisterPage({super.key});
//
//   @override
//   State<RegisterPage> createState() => _RegisterPageState();
// }
//
// class _RegisterPageState extends State<RegisterPage> {
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
//                         Get.to(()=>LoginPage());
//                       }
//                   ),
//                 ],
//               ),
//               SizedBox(height: 30.0,),
//               Text("Hellow! Register to get started",style: TextStyle(fontSize:28.0,fontWeight: FontWeight.bold),),
//               SizedBox(height: 30.0,),
//
//              formField(
//                hintText: "Username"
//              ),
//               formField(
//                   hintText: "Email"
//               ),
//               formField(
//                   hintText: "Password",
//                   obscureText: true,
//               ),
//               formField(
//                   hintText: "ConfirmPassword"
//               ),
//               SizedBox(height: 20.0,),
//               PrimaryButton(
//                 height: 55.0,
//                 title: 'Register',
//                 color: kRed,
//               ),
//               SizedBox(height: 25.0,),
//               Text("Or Register with"),
//               SizedBox(height: 20.0,),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   MyContainer(
//                       height: 65,
//                       width: 130,
//                       color: kWhite,
//                       icon:  Icons.document_scanner_outlined
//                   ),
//                   SizedBox(width: 10.0,),
//                   MyContainer(
//                       height: 65,
//                       width: 130,
//                       color: kWhite,
//                       icon:  Icons.ac_unit_outlined
//                   ),
//                 ],
//               ),
//               SizedBox(height: 50.0,),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text("Already have an account",style: TextStyle(fontSize:14.0,fontWeight: FontWeight.bold),),
//                   InkWell(
//                       onTap: (){
//                          Get.to(()=>LoginPage());
//                        // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage()));
//                       },
//                       child: Text("?Login Now",style: TextStyle(fontSize:14.0,fontWeight: FontWeight.bold,color: kRed),)),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
