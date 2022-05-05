class ProductData {
  late String name;
  late int price;
  late String url;

  ProductData({required this.name, required this.price, required this.url});

  ProductData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['price'] = price;
    data['url'] = url;

    return data;
  }
}
