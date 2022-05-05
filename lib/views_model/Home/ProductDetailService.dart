import 'package:flutter/material.dart';

class ProductDetailService with ChangeNotifier {
  int quantity = 1;

  int showQuantity() {
    return quantity;
  }

  void upQuantity() {
    quantity = quantity + 1;
    notifyListeners();
  }

  void downQuantity() {
    quantity = quantity - 1;
    if (quantity < 1) {
      quantity = 1;
    }

    notifyListeners();
  }
}
