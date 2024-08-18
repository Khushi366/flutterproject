import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:self_practice/ProductPage/Screen.dart';
import 'package:self_practice/Theme/AppColor.dart';
import 'package:self_practice/Utility/MyDrawer.dart';
import 'package:self_practice/View/Auth/Login/Screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Controller.dart'; // Import your HomeController

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Products",style: TextStyle(color: kWhite),),
        backgroundColor: kAppBarColor,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: ()async{
                SharedPreferences prefs = await SharedPreferences.getInstance();
                 prefs.clear();
                Get.offAll(() => LoginScreen());
              }, icon: Icon(Icons.logout))
        ],
      ),
        drawer: MyDrawer(),
        body: Obx(()=>
          controller.allData.isEmpty
          ?Center(child: CircularProgressIndicator()) // Show loading spinner
         : GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns in the grid
              crossAxisSpacing: 8.0, // Horizontal spacing between grid items
              mainAxisSpacing: 8.0, // Vertical spacing between grid items
              childAspectRatio: 0.75, // Aspect ratio of each grid item
            ),
            itemCount: controller.allData.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){
                  Get.to(
                        () => ProductDetailsScreen(),
                    arguments: controller.allData![index].id.toString(),

                  );
                },
                child: _buildProductCard(
                  controller.allData[index].image.toString(),
                  controller.allData[index].title.toString(),
                  controller.allData[index].price.toString(),
                ),
              );
            },
           )
      )
    );
  }
  Widget _buildProductCard(String image, String title, String price) {
    return Container(
      margin: EdgeInsets.all(2.0),
      padding: EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        border: Border.all(color: kAppBarColor),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                SizedBox(height: 4.0),
                Text(
                  '\$${price}',
                  style: TextStyle(color: Colors.green),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

