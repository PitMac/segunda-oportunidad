import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:segunda_oportu/provider/auth_provider.dart';
import 'package:segunda_oportu/screens/welcome_screen.dart';
import 'package:segunda_oportu/widgets/style_widgets.dart';

class ProfileScreen extends HookWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    final sobremiController = useTextEditingController();
    final megustaController = useTextEditingController();
    final nomegustaController = useTextEditingController();
    final selectedImage = useState<File?>(null);

    final authProvider = Provider.of<AuthProvider>(context);

    Future pickImageFromGallery() async {
      final returnedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (returnedImage != null) {
        selectedImage.value = File(returnedImage.path);
      }
    }

    useEffect(() {
      return null;
    }, []);

    Widget showImageW(String? image) {
      if (selectedImage.value == null && image == null) {
        return const CircleAvatar(
          backgroundColor: Colors.blue,
          radius: 100,
        );
      } else if (selectedImage.value != null && image == null) {
        return CircleAvatar(
          backgroundColor: Colors.blue,
          backgroundImage: FileImage(selectedImage.value!),
          radius: 100,
        );
      } else {
        return CircleAvatar(
          backgroundColor: Colors.blue,
          backgroundImage: NetworkImage(image!),
          radius: 100,
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        backgroundColor: greenColor,
      ),
      body: user == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : FutureBuilder<DocumentSnapshot>(
              future: FirebaseFirestore.instance
                  .collection("Usuarios")
                  .doc(user.uid)
                  .get(),
              builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text("Something went wrong");
                }

                if (snapshot.hasData && !snapshot.data!.exists) {
                  return const Text("Document does not exist");
                }

                if (snapshot.connectionState == ConnectionState.done) {
                  Map<String, dynamic> data =
                      snapshot.data?.data() as Map<String, dynamic>;

                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: double.infinity,
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: showImageW(data['image']),
                          ),
                          Center(
                            child: TextButton(
                              child: const Text(
                                'Cambiar foto de perfil',
                                style: TextStyle(color: Colors.blue),
                              ),
                              onPressed: () {
                                pickImageFromGallery();
                              },
                            ),
                          ),
                          Center(child: Text(user.email!)),
                          const Text(
                            'Sobre mi',
                            style: TextStyle(fontSize: 16),
                          ),
                          TextField(
                            controller: sobremiController,
                            decoration: inputDecoration(data['sobre_mi']),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Me gusta',
                            style: TextStyle(fontSize: 16),
                          ),
                          TextField(
                            controller: megustaController,
                            decoration: inputDecoration(null),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'No me gusta',
                            style: TextStyle(fontSize: 16),
                          ),
                          TextField(
                            controller: nomegustaController,
                            decoration: inputDecoration(null),
                          ),
                          const SizedBox(height: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              ElevatedButton(
                                style: buttonStyle,
                                onPressed: () async {
                                  final imageUrl = await authProvider
                                      .uploadImage(selectedImage.value!);

                                  authProvider.updateData(
                                    sobremiController.text,
                                    megustaController.text,
                                    nomegustaController.text,
                                    user.uid,
                                    imageUrl,
                                  );
                                },
                                child: const Text(
                                  'Actualizar',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Center(
                            child: TextButton.icon(
                              onPressed: () async {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const WelcomeScreen(),
                                  ),
                                  (Route<dynamic> route) => false,
                                );
                                await authProvider.signOut();
                              },
                              icon: const Icon(
                                Icons.exit_to_app,
                                color: Colors.black,
                              ),
                              label: const Text(
                                'Cerrar sesion',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }

                return const CircularProgressIndicator();
              }),
    );
  }
}
