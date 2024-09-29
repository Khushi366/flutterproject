import 'dart:convert';
import 'dart:developer';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerceapp/Theme/AppColor.dart';
import 'package:ecommerceapp/Theme/DeviceLayout.dart';
import 'package:ecommerceapp/View/CartPage/Screen.dart';
import 'package:ecommerceapp/Widget/OtherButton.dart';
import 'package:ecommerceapp/Widget/PrimaryButton.dart';
import 'package:ecommerceapp/Widget/SecondaryButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibration/vibration.dart';
import 'Controller.dart';


class ProductDetailsScreen extends StatelessWidget {
  final controller = Get.put(ProductDetailsController());


  @override
  Widget build(BuildContext context) {
    bool isTablet = DeviceLayout.isTablet(context);
    return Scaffold(
      backgroundColor: kWhite,
      body: SingleChildScrollView(
        child: Obx(() {
          if (controller.product.value.id == null) {
            return Center(child: CircularProgressIndicator(color: kButtonColor,));
          }
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: isTablet ? 30.0 : 20.0), // Adjust the top padding dynamically
                _buildTopBar(context),
                SizedBox(height: 30.0),
                _buildImageCarousel(controller),
                _buildProductInfo(controller),
                _buildColorOptions(controller),
                SizedBox(height: 30.0),
                _buildToggleButtons(controller,isTablet),
                _buildDescription(controller),
                _buildAddToCartButton(controller,isTablet),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildIconButton(
          icon: Icons.arrow_back_ios_new_outlined,
          onPressed: () => Navigator.of(context).pop(),
        ),
        Expanded(child: SizedBox()), // Filler space
        buildIconButton(
          icon: Icons.share_outlined,
          onPressed: () {
          },
        ),
        SizedBox(width: 10.0),
         buildIconButton(
          icon: Icons.favorite_border,
          onPressed: () {
          },
        ),
      ],
    );
  }

  Widget _buildImageCarousel(ProductDetailsController controller) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 16 / 9,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 1.0,
            autoPlayAnimationDuration: const Duration(seconds: 3),
            onPageChanged: (index, reason) {
              controller.changeIndex(index);
            },
          ),
          items: [
            // Assuming controller.product.value.images is a list of URLs
            controller.product.value.image!.toString(),
          ].map((imageUrl) {
            return Builder(
              builder: (BuildContext context) {
                return Image.network(imageUrl, fit: BoxFit.cover,);
              },
            );
          }).toList(),
        ),
        _buildCarouselIndicators(controller),
      ],
    );
  }

  Widget _buildCarouselIndicators(ProductDetailsController controller) {
    return Positioned(
      bottom: 10.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(5, (index) {
          return Container(
            width: controller.currentIndex.value == index ? 16.0 : 8.0,
            height: 8.0,
            margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
            decoration: BoxDecoration(
              color: controller.currentIndex.value == index ? kBlack : kGeryLightColor,
              borderRadius: controller.currentIndex == index ? BorderRadius.circular(4.0) : null,
              border: Border.all(
                color: controller.currentIndex.value == index ? kWhite : kTransparent,
                width: controller.currentIndex.value == index ? 1.0 : 0.0,
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildProductInfo(ProductDetailsController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.0),
        Text(
          controller.product.value.title.toString(),
          maxLines: 1,
          style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5.0),
        Text(
          '\$${controller.product.value.price}',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Seller: Tariqul Islam",
              maxLines: 1,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        _buildRatingInfo(controller),
      ],
    );
  }

  Widget _buildRatingInfo(ProductDetailsController controller) {
    return Row(
      children: [
        Container(
          width: 40.0,
          height: 22.0,
          decoration: BoxDecoration(
            color: kButtonColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star, size: 11.0, color: kWhite),
              Text(
                controller.product.value.rating!.rate.toString(),
                style: TextStyle(fontSize: 10.0, color: kWhite, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(width: 5.0),
        Text(
          '(${controller.product.value.rating!.count} Reviews)',
          style: TextStyle(fontSize: 12.0, color: kGeryColor, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildColorOptions(ProductDetailsController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15.0),
        Text("Color", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
        SizedBox(height: 10.0),
        SizedBox(
          height: 40.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5, // Number of color options
            itemBuilder: (context, index) {
              List<Color> colorOptions = [
                kCircle1Color,
                kBlack,
                kCircle3Color,
                kCircle4Color,
                kGeryLightColor,
              ];

              return GestureDetector(
                onTap: () {
                  controller.changeColorIndex(index);
                },
                child: Obx(() {
                  return Container(
                    padding: const EdgeInsets.all(2.0),
                    decoration: controller.selectedColorIndex.value == index
                        ? BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: kGeryColor, width: 3.0),
                    )
                        : null,
                    child: Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: colorOptions[index],
                        shape: BoxShape.circle,
                      ),
                    ),
                  );
                }),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildToggleButtons(ProductDetailsController controller, bool isTablet) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: isTablet ? MainAxisAlignment.start : MainAxisAlignment.spaceBetween,
        children: [
          _buildToggleButton(
            text: "Description",
            isSelected: controller.selectedButtonIndex.value == 1,
            onTap: () => controller.changeSelectedButtonIndex(1),
          ),
          _buildToggleButton(
            text: "Specifications",
            isSelected: controller.selectedButtonIndex.value == 2,
            onTap: () => controller.changeSelectedButtonIndex(2),
          ),
          _buildToggleButton(
            text: "Reviews",
            isSelected: controller.selectedButtonIndex.value == 3,
            onTap: () => controller.changeSelectedButtonIndex(3),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleButton({
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: isSelected ? kButtonColor : kWhite,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(text, style: TextStyle(color: isSelected ? kWhite : kBlack, fontWeight: FontWeight.bold,),
        ),
      ),
    );
  }

  Widget _buildDescription(ProductDetailsController controller) {
    String description;
    switch (controller.selectedButtonIndex.value) {
      case 1:
        description = controller.product.value.description!.toString();
        break;
      case 2:
        description = "Specifications:\n\n- Processor: Intel Core i7\n- RAM: 16GB\n- Storage: 512GB SSD\n- Display: 15.6 inches, 1920 x 1080\n- Battery Life: Up to 10 hours\n- Operating System: Windows 11\n- Weight: 4.2 lbs\n\nThis laptop provides exceptional performance for both gaming and productivity tasks, making it an ideal choice for professionals and gamers alike.";
        break;
      case 3:
        description = "Reviews:\n\n1. \"This laptop is amazing! It runs all my programs smoothly, and the battery life is incredible. I can easily use it for an entire day without charging.\"\n\n2. \"The display is stunning, and I love watching movies on it. The sound quality is also impressive.\"\n\n3. \"I had some issues with the delivery, but the customer service was very helpful and resolved my issue quickly.\"\n\n4. \"Overall, I am very satisfied with my purchase. Highly recommended for anyone looking for a reliable laptop!\"";
        break;
      default:
        description = "";
    }

    return Column(
      children: [
        SizedBox(height: 20.0),
        Text(description, textAlign: TextAlign.justify, style: TextStyle(fontSize: 14.0, color: kGeryColor),),
        SizedBox(height: 20.0),
      ],
    );
  }

  Widget _buildAddToCartButton(ProductDetailsController controller, bool isTablet) {
    return customIconButton(
      onPressed: () {},
      backgroundColor: kBlack,
      iconColor: kWhite,
      width: isTablet ? 310 : Get.width,
      height: 65.0,
      isCircular: false,
      borderRadius: 30.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildQuantitySelector(controller), // Pass the controller
          CustomButton(
            onPressed: () async {
              if (await Vibration.hasVibrator()?? false) {
                Vibration.vibrate(duration: 100); // Vibrate for 100 milliseconds
              }
              // Retrieve userId from SharedPreferences
              SharedPreferences prefs = await SharedPreferences.getInstance();
              String? userId = prefs.getString("userId");
              // Check if userId is valid
              if (userId == null) {
                Get.snackbar(
                  'Error',
                  'User ID not found. Please log in again.',
                  snackPosition: SnackPosition.BOTTOM,
                );
                return; // Exit if userId is null
              }
              // Prepare the parameters for the API call
              Map<String, dynamic> params = {
                "userId": userId, // User ID retrieved from SharedPreferences
                "date": DateTime.now().toIso8601String(), // Current date and time
                "products": [
                  {
                    "productId": controller.pid.value, // Product ID from the controller
                    "quantity": controller.quantity.value, // Selected quantity
                  }
                ],
              };
              log('Params to add to cart: ${jsonEncode(params)}');
              // Call the addToCart method and check for success
              bool success = await controller.addToCart(params);
              if (success) {
                Get.to(() => CartScreen());
              } else {
                Get.snackbar(
                  'Error',
                  'Failed to add item to cart.',
                  snackPosition: SnackPosition.BOTTOM,
                );
              }
            },
            width: 160,
            height: 20,
            buttonText: "Add to Cart",
            textSize: 16.0,
            borderRadius: 30.0,
          ),
        ],
      ),
    );
  }

  Widget _buildQuantitySelector(ProductDetailsController controller) {
    return Container(
      width: 120,
      height: 40,
      decoration: BoxDecoration(
        color: kTransparent,
        borderRadius: BorderRadius.circular(30.0),
        border: Border.all(color: kWhite, width: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              controller.decrementQuantity(); // Decrease quantity
            },
            icon: Icon(Icons.remove, color: kWhite, size: 20.0),
          ),
          Obx(() {
            return Text("${controller.quantity.value}", style: TextStyle(color: kWhite, fontSize: 14.0, fontWeight: FontWeight.bold,),
            );
          }),
          IconButton(
            onPressed: () {
              controller.incrementQuantity(); // Increase quantity
            },
            icon: Icon(Icons.add, color: kWhite, size: 20.0),
          ),
        ],
      ),
    );
  }
}
