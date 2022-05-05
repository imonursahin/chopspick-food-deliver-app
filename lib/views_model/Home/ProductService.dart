import 'package:chopspick/model/ProductData.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductService with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final List<ProductData> productList = [];

  List<ProductData> get getProductList => productList;

  getProducts() async {
    CollectionReference productCollect = _firestore.collection('products');

    var productDocs = await productCollect.get();

    for (var item in productDocs.docs) {
      DocumentReference profuctRef =
          _firestore.collection('products').doc(item.id);
      var productDoc = await profuctRef.get();
      var productData = productDoc.data() as Map<String, dynamic>;
      if (productData.isNotEmpty) {
        productList.add(ProductData(
            name: productData['name'],
            price: productData['price'],
            url: productData['url'],
            quantity: productData['quantity']));
      }
    }

    notifyListeners();
  }
}
