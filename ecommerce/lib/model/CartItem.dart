// // lib/model/cart_item.dart
//
// class CartItem {
//   final int id;
//   final String title;
//   final double price;
//   final int quantity;
//   final String thumbnail; // Add thumbnail property
//
//   CartItem({
//     required this.id,
//     required this.title,
//     required this.price,
//     required this.quantity,
//     required this.thumbnail, // Add thumbnail parameter
//   });
//
//   factory CartItem.fromJson(Map<String, dynamic> json) {
//     return CartItem(
//       id: json['id'],
//       title: json['title'],
//       price: json['price'].toDouble(),
//       quantity: json['quantity'],
//       thumbnail: json['thumbnail'] ?? '', // Handle missing thumbnail
//     );
//   }
// }
