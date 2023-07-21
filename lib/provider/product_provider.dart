import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductProvider with ChangeNotifier {
  FirebaseFirestore firebase = FirebaseFirestore.instance;

  sendProduct(
      String nombre, String descripcion, String typeProduct, String image) {
    firebase.collection(typeProduct).add(
      {'nombre': nombre, 'descripcion': descripcion, 'image_url': image},
    );
  }

  Future<String?> uploadImage(File imageFile) async {
    final url = Uri.parse(
        'https://api.cloudinary.com/v1_1/djbdnzumr/image/upload?upload_preset=yrj1kt8q');

    final imageUploadRequest = http.MultipartRequest(
      'POST',
      url,
    );

    final file = await http.MultipartFile.fromPath('file', imageFile.path);

    imageUploadRequest.files.add(file);

    final streamResponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streamResponse);
    if (resp.statusCode != 200 && resp.statusCode != 201) {
      print('Wrooong');
      print(resp.body);
      return null;
    }
    final decodeData = json.decode(resp.body);
    return decodeData['secure_url'];
  }
}
