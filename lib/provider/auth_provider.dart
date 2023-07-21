import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  String errorMessage = '';
  bool successLogin = false;

  signUp(String nombre, String apellido, String correo, String password) async {
    UserCredential userCredential = await auth
        .createUserWithEmailAndPassword(email: correo, password: password)
        .then((value) {
      firebaseFirestore.collection("Usuarios").doc(value.user!.uid).set(
        {
          'nombre': nombre,
          'apellido': apellido,
          'correo': correo,
          'contraseña': password
        },
      );

      return value;
    });
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

  updateData(String sobreMi, String meGusta, String noGusta, String id,
      String? image) {
    firebaseFirestore.collection("Usuarios").doc(id).update({
      'sobre_mi': sobreMi,
      'me_gusta': meGusta,
      'no_gusta': noGusta,
      'image': image
    });
  }

  logIn(String correo, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: correo, password: password);
      successLogin = true;
      errorMessage = '';
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        errorMessage = 'No se encontró usuario con ese correo.';
        notifyListeners();
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Contraseña incorrecta.';
        notifyListeners();
      }
      print(e);
      successLogin = false;
      notifyListeners();
    }
  }

  Future<void> signOut() async {
    successLogin = false;
    notifyListeners();
    await FirebaseAuth.instance.signOut();
  }
}
