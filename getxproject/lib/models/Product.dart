class Product {
  String? pid;
  String? pname;
  String? qty;
  String? price;
  String? addedDatetime;

  Product({this.pid, this.pname, this.qty, this.price, this.addedDatetime});

  Product.fromJson(Map<String, dynamic> json) {
    pid = json['pid'];
    pname = json['pname'];
    qty = json['qty'];
    price = json['price'];
    addedDatetime = json['added_datetime'];
  }
}
