import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductProvider with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firebase = FirebaseFirestore.instance;
  List people = [];
  LinkedHashMap? currentUser;
  String? user;

  Future<List> getPeople(String email) async {
    people = [];
    CollectionReference collectionReference = firebase.collection('Usuarios');
    QuerySnapshot querySnapshot = await collectionReference.get();
    for (var person in querySnapshot.docs) {
      people.add(person.data());
    }
    findUser(email);
    notifyListeners();
    return people;
  }

  void findUser(String email) {
    currentUser = null;
    for (var element in people) {
      if (element['correo'] == email) {
        currentUser = element;
        print(currentUser);
      }
    }
  }

  sendProduct(String nombre, String descripcion, String typeProduct,
      String image, String usuario) {
    firebase.collection(typeProduct).add(
      {
        'nombre': nombre,
        'descripcion': descripcion,
        'image_url': image,
        'usuario': usuario,
      },
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
