import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:segunda_oportu/screens/new_product_screen.dart';

class ProductProvider with ChangeNotifier {
  FirebaseFirestore firebase = FirebaseFirestore.instance;

  sendProduct(String nombre, String descripcion, TypeProduct typeProduct) {
    if (typeProduct.name == "producto") {
      firebase.collection("Productos").add(
        {'nombre': nombre, 'descripcion': descripcion},
      );
    } else {
      firebase.collection("Productos").add(
        {'nombre': nombre, 'descripcion': descripcion},
      );
    }
  }
}
