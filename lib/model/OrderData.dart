import 'package:chopspick/model/OrderItem.dart';
 
class OrderData {
  late List<OrderItem> orderItem;
  late String description;
  late int totalPrice;

  OrderData(
      {required this.orderItem,
      required this.description,
      required this.totalPrice});

  OrderData.fromJson(Map<String, dynamic> json) {
    orderItem = json['orderItem'];
    description = json['description'];
    totalPrice = json['totalPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderItem'] = orderItem;
    data['description'] = description;
    data['totalPrice'] = totalPrice;

    return data;
  }
}
