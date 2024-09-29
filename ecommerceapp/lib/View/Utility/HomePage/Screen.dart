import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerceapp/Model/Product.dart';
import 'package:ecommerceapp/Theme/AppColor.dart';
import 'package:ecommerceapp/View/ProductDetailsPage/Screen.dart';
import 'package:ecommerceapp/Widget/MyTextBox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Scaffold(
      body: Obx(() {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30.0),
              _buildHeader(),
              _buildSearchField(),
              _buildCarousel(controller),
              _buildAvatarList(controller),
              _buildSpecialForYouSection(controller),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildCircleIcon('assets/icon/view_cozy.png'),
          _buildCircleIcon(Icons.notifications_none_outlined),
        ],
      ),
    );
  }

  Widget _buildCircleIcon(dynamic icon) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: kGeryLightColor,
      ),
      child: Center(
        child: icon is String
            ? Image.asset(icon, width: 20, height: 20) : Icon(icon, size: 20),
      ),
    );
  }

  Widget _buildSearchField() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: CustomTextField(
        hintText: "Search...",
        leadingIcon: Icon(Icons.search, color: kGeryColor),
        trailingIcon: Icon(Icons.info_outline, color: kGeryColor),
        borderRadius: 30.0,
        showDivider: true,
      ),
    );
  }

  Widget _buildCarousel(HomeController controller) {
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
            buildImage('assets/img/shoes.png'),
            buildImage('assets/img/womens.png'),
            buildImage('assets/img/mean.png'),
            buildImage('assets/img/beauty.png'),
            buildImage('assets/img/elec.png'),
          ],
        ),
        _buildCarouselIndicators(controller),
      ],
    );
  }

  Widget _buildCarouselIndicators(HomeController controller) {
    return Positioned(
      bottom: 10.0,
      child: GetBuilder<HomeController>(
        builder: (controller) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return Container(
                width: controller.currentIndex == index ? 16.0 : 18.0,
                height: 8.0,
                margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  color: controller.currentIndex == index ? kBlack : kGeryLightColor,
                  shape: controller.currentIndex == index ? BoxShape.rectangle : BoxShape.circle,
                  borderRadius: controller.currentIndex == index ? BorderRadius.circular(4.0) : null,
                  border: Border.all(
                    color: controller.currentIndex == index ? kWhite : kTransparent,
                    width: controller.currentIndex == index ? 1.0 : 0.0,
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }

  Widget _buildAvatarList(HomeController controller) {
    return SizedBox(
      height: 85,
      child: controller.products.isNotEmpty && controller.categories.isNotEmpty
          ? ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (context, index) {
          int productId = [14, 8, 3, 20][index];
          return Obx(() {
            var product = controller.products.firstWhere(
                  (product) => product.id == productId,
              orElse: () => Product(id: -1, title: '', price: 0.0, image: ''),
            );
            return product.id != -1
                ? Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
                 child: _buildAvatar(product, controller.categories[index]),
            ) : Container();
          });
        },
      )
          : Center(child: Text("No products available")),
    );
  }

  Widget _buildAvatar(Product product, String category) {
    return Column(
      children: [
        const SizedBox(height: 5.0),
        Container(
          width: 80.0,
          height: 55.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: kGeryColor, width: 1),
            image: DecorationImage(
              image: NetworkImage(product.image.toString()),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 4.0),
        Text(category, style: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),),
      ],
    );
  }

  Widget _buildSpecialForYouSection(HomeController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader("Special For You"),
        controller.products.isEmpty
            ? Center(child: CircularProgressIndicator(color: kButtonColor,)) : _buildProductGrid(controller),
        SizedBox(height: 70.0,),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
          Text("See all", style: TextStyle(color: kGeryColor, fontSize: 14.0, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildProductGrid(HomeController controller) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 12.0,),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 0.80,
      ),
      itemCount: controller.products.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: (){
              Get.to(
                    () => ProductDetailsScreen(),
                arguments: controller.products![index].id.toString(),
              );
            },
            child: _buildProductItem(controller.products[index]));
      },
    );
  }

  Widget _buildProductItem(Product product) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: kGeryColor, width: 0),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildFavoriteButton(),
          Expanded(
            child: Image.network(
              product.image.toString(),
              width: 80.0,
            ),
          ),
          _buildProductDetails(product),
        ],
      ),
    );
  }

  Widget _buildFavoriteButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 35,
          height: 33,
          decoration: BoxDecoration(
            color: kButtonColor,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(10),
            ),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border, color: kWhite, size: 20.0),
          ),
        ),
      ],
    );
  }

  Widget _buildProductDetails(Product product) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(product.title.toString(), maxLines: 1, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
          const SizedBox(height: 5),
          Text('\$${product.price!.toStringAsFixed(2)}', style: const TextStyle(fontSize: 14, color: kGeryColor),),
        ],
      ),
    );
  }

  Widget buildImage(String image) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Image.asset(image, fit: BoxFit.fill, width: double.infinity),
      ),
    );
  }
}
