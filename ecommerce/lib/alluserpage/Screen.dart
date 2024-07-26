import 'package:ecommerce/AllUserPage/Controller.dart';
import 'package:ecommerce/mycustomedrawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllUserScreen extends StatelessWidget {
  final controller = Get.put(AllUserController());

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
            title: Text('All User'),
          ),
        ),
      ),
      //drawer: MyDrawer(),
      body: Obx(() => controller.isLoading.value
          ? Center(child: CircularProgressIndicator())
          : controller.allUserData.isEmpty
          ? Center(child: Text('No products available'))
          : ListView.builder(
        itemCount: controller.allUserData!.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(8.0),
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      controller.allUserData![index].id.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: (controller.allUserData![index].products ?? []).map((item) {
                    return Text(
                      item.title.toString(),
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          );
        },
      ),
      ),
    );
  }
}
