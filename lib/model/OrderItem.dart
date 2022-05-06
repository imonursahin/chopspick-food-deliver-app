import 'package:chopspick/model/ProductData.dart';

class OrderItem {
  late ProductData product;
  late int quantity;

  OrderItem({required this.product, required this.quantity});

  OrderItem.fromJson(Map<String, dynamic> json) {
    product = json['product'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product'] = product;
    data['quantity'] = quantity;

    return data;
  }
}
