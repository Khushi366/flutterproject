import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:petkart/Theme/AppColor.dart';
import 'package:petkart/Theme/DeviceLayout.dart';
import 'package:petkart/views/Utility/MyHomePage/demo.dart';
import 'package:petkart/widgets/MyTextBox.dart';

import 'Controller.dart';

class MyHomePage extends StatelessWidget {
  final controller = Get.put(HomeController());

  final List<String> categoryImages = [
    'assets/img/dogs.png',
    'assets/img/cat.png',

    'assets/img/fish.jfif',
    'assets/img/bird.png',
    'assets/img/rabbit.png',
    'assets/img/hamster.png',
  ];

  @override
  Widget build(BuildContext context) {
    var isTablet = DeviceLayout.isTablet(context);
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        backgroundColor: kPrimaryColorDark,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Expanded(
              child: customTextField(
                context: context,
                hintText: "Search PetKart",
                backgroundColor: kWhite,
                height: 42,
                padding: EdgeInsets.only(right: 10),
                hintPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                leadingIcon: Icon(Icons.search),
                trailingIcon: Icon(Icons.mic_none_sharp, color: kgrey,),
              ),
            ),
            SizedBox(width: 10), // Optional spacing between the text field and the action icon
            Icon(Icons.qr_code_scanner_rounded, color: kgrey),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: isTablet ? 50.0 : 5.0),
              Row(
                children: [
                  Text('Hello', style: Get.textTheme.headlineSmall),
                  SizedBox(width: 5.0),
                  Text('John', style: Get.textTheme.headlineSmall!.copyWith(color: kPrimaryColor, fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 5.0),
              Text('Latest Offers', style: Get.textTheme.bodyLarge!.copyWith(color: kgrey)),

              SizedBox(height: isTablet ? 50.0 : 10.0),

              CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 2 / 1, // Adjusted aspect ratio for larger images
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 1.0, // Adjusted viewport fraction for larger images
                  autoPlayAnimationDuration: Duration(seconds: 3),
                  onPageChanged: (index, reason) {
                    controller.changeIndex(index);
                  },
                ),
                items: [
                  buildImage('assets/img/petban.png'),
                  buildImage('assets/img/catban.png'),
                  buildImage('assets/img/fishban.png'),
                  buildImage('assets/img/animalsban.png'),
                  buildImage('assets/img/hostelban.png'),
                  buildImage('assets/img/vetban.png'),
                ],
              ),
              SizedBox(height: 20.0),
              GetBuilder<HomeController>(
                builder: (controller) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    6, (index) => buildIndicator(index, controller.currentIndex),
                  ),
                ),
              ),
              SizedBox(height: 40.0),

              GridView.builder(
                shrinkWrap: true, // Allows the GridView to scroll inside the Column
                physics: NeverScrollableScrollPhysics(), // Disable GridView's scrolling
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return buildCategory(categoryImages[index]); // Pass the image path to buildCategory
                },
              ),
              SizedBox(height: 50.0),

            ],
          ),
        ),
      ),
    );
  }

  Widget buildImage(String assetName) {
    return GestureDetector(
      onTap: (){

       Get.to(DemoScreen());
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color:kBorderColor.withOpacity(0.5), width: 3.0), // Outline border
          borderRadius: BorderRadius.circular(10.0), // Rounded corners
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0), // Same rounded corners
          child: Image.asset(
            assetName,
            fit: BoxFit.cover,
            width: double.infinity,// Ensure the image covers the container
          ),
        ),
      ),
    );
  }

  Widget buildIndicator(int index, int currentIndex) {
    return GestureDetector(
      onTap: () {
        controller.changeIndex(index);
      },
      child: Container(
        width: 8.0,
        height: 8.0,
        margin: EdgeInsets.symmetric(horizontal: 4.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: currentIndex == index ? kPrimaryColorDark : Colors.grey,
        ),
      ),
    );

  }

  Widget buildCategory(String imagePath) {
    return  Card(
      elevation: 5.0, // Adds shadow to the card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0), // Same rounded corners as the original container
        side: BorderSide(color: kBlack), // Border color and width
      ),
      child: Container(
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.circular(10.0), // Same rounded corners
        ),
        child: Container(
          decoration: BoxDecoration(
            color: kContainerColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          height: 100,
        ),
      ),
    );
  }
}
