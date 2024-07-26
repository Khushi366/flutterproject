// import 'package:ecommerce/model/CartItem.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class CartController extends GetxController {
//   // var cartItems = <CartItem>[].obs;
//   // var cartItemCount = 0.obs;
//   //
//   // // Function to update cart items
//   // void updateCartData(Map<String, dynamic> data) {
//   //   cartItems.clear();
//   //   for (var item in data['products']) {
//   //     cartItems.add(CartItem.fromJson(item));
//   //   }
//   //   cartItemCount.value = data['totalQuantity'];
//   // }
//   var cartProductTitle = ''.obs;
//   var cartProductQuantity = 0.obs;
//   var cartProductThumbnail = ''.obs;
//   var cartItemCount = 0.obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     _loadCartData();
//   }
//
//   Future<void> _loadCartData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     cartProductTitle.value = prefs.getString('cartProductTitle') ?? '';
//     cartProductQuantity.value = prefs.getInt('cartProductQuantity') ?? 0;
//     cartProductThumbnail.value = prefs.getString('cartProductThumbnail') ?? '';
//   }
//
//   Future<void> addProductToCart(CartItem item) async {
//     // Update the cart item count
//     cartItemCount.value += item.quantity;
//
//     // Save to SharedPreferences
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setInt('cartItemCount', cartItemCount.value);
//     prefs.setString('cartProductTitle', item.title);
//     prefs.setInt('cartProductQuantity', item.quantity);
//     prefs.setString('cartProductThumbnail', item.thumbnail);
//   }
//
//
// }
