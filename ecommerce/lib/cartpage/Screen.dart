// import 'package:ecommerce/cartpage/Controller.dart';
// import 'package:ecommerce/productdetailspage/Controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class CartScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Retrieve arguments if any
//     final arguments = Get.arguments as Map<String, dynamic>?;
//
//     // Optional: Extract specific arguments
//     final message = arguments?['message'] ?? '';
//     final product = arguments?['product'] as Map<String, dynamic>?;
//
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(kToolbarHeight),
//         child: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 Color(0xFF8EDEDA),
//                 Color(0xFFA2E6D1),
//               ],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//           child: AppBar(
//             backgroundColor: Colors.transparent,
//             elevation: 0,
//             centerTitle: true,
//             title: Text('Cart'),
//           ),
//         ),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (message.isNotEmpty)
//               Text(message, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             if (product != null)
//               Column(
//                 children: [
//                   Image.network(product['thumbnail']),
//                   Text('Product: ${product['title']}', style: TextStyle(fontSize: 16)),
//                   Text('Quantity: ${product['quantity']}', style: TextStyle(fontSize: 16)),
//                 ],
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:ecommerce/cartpage/Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {

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
            title: Text('Cart'),
          ),
        ),
      ),

    );
  }
}
