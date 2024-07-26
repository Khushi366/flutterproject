import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxproject/views/employee/AddEmployee.dart';
import 'package:getxproject/views/product/AddProduct.dart';
import 'employee/ViewEmployee.dart';
import 'product/ViewProduct.dart';

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
            leading: const Icon(Icons.add),
            title: const Text("Add Product"),
            onTap: () {
             Get.to(AddProduct());
            },
          ),
          ListTile(
            leading: const Icon(Icons.view_agenda),
            title: const Text("View Product"),
            onTap: () {
              Get.to(ViewProduct());
            },
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text("Add Employee"),
            onTap: () {
              Get.to(AddEmployee());
            },
          ),
          ListTile(
            leading: const Icon(Icons.view_agenda),
            title: const Text("View Employee"),
            onTap: () {
              Get.to(ViewEmployee());

            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Profile"),
            onTap: () {
              //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyProfile()));

            },
          ),
        ],
      ),
    );
  }

}
