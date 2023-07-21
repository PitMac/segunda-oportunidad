import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ProductScreen extends HookWidget {
  DocumentSnapshot<Object?> document;
  ProductScreen({Key? key, required this.document}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
    return Scaffold(
      body: Center(
        child: Text(data['nombre']),
      ),
    );
  }
}
