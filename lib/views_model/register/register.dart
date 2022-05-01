import 'package:chopspick/model/UserData.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
 
class Auth extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  UserData data = UserData();
  
  Future<User?> register(String name, String email, String password) async {
    final user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    data.name = name;
    data.email = email;

    await _firestore.collection("users").doc().set(data.toMap());

    notifyListeners();
  }
}
