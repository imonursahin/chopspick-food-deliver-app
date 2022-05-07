import 'package:chopspick/model/OrderData.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrderService with ChangeNotifier {
  Future<void> addOrder(OrderData data) async {
    final CollectionReference _mainCollection =
        FirebaseFirestore.instance.collection('orders');
    DocumentReference documentReferencer = _mainCollection.doc();

    await _mainCollection.doc().collection("orders").add({});

    await documentReferencer.set(data.toJson());

    notifyListeners();
  }
}
