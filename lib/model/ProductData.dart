class ProductData {
  late String name;
  late int price;
  late String url;
  late String quantity;

  ProductData(
      {required this.name,
      required this.price,
      required this.url,
      required this.quantity});

  ProductData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    url = json['url'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['price'] = price;
    data['url'] = url;
    data['quantity'] = quantity;

    return data;
  }
}
