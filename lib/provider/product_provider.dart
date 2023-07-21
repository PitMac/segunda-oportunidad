import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  FirebaseFirestore firebase = FirebaseFirestore.instance;

  sendProduct(String nombre, String descripcion, String typeProduct) {
    firebase.collection(typeProduct).add(
      {'nombre': nombre, 'descripcion': descripcion},
    );
  }
}
