import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:segunda_oportu/provider/product_provider.dart';
import 'package:segunda_oportu/screens/success_product_screen.dart';
import 'package:segunda_oportu/widgets/consts.dart';
import 'package:segunda_oportu/widgets/style_widgets.dart';

class NewProductScreen extends HookWidget {
  const NewProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nombreController = useTextEditingController();
    final descripcionController = useTextEditingController();
    final selectedImage = useState<File?>(null);
    final selectedCategory = useState<String>("Frutas");

    final productProvider = Provider.of<ProductProvider>(context);

    Future pickImageFromGallery() async {
      final returnedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (returnedImage != null) {
        selectedImage.value = File(returnedImage.path);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Articulo'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  pickImageFromGallery();
                },
                child: selectedImage.value != null
                    ? SizedBox(
                        height: 300,
                        width: double.infinity,
                        child: Image.file(
                          selectedImage.value!,
                          fit: BoxFit.cover,
                        ),
                      )
                    : DottedBorder(
                        radius: const Radius.circular(50),
                        color: Colors.black, //color of dotted/dash line
                        strokeWidth: 2, //thickness of dash/dots
                        dashPattern: const [10, 6],
                        child: const SizedBox(
                          width: double.infinity,
                          height: 200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.camera_alt_outlined, size: 100),
                              Text('Subir Imagen')
                            ],
                          ),
                        ),
                      ),
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: inputDecoration('Nombre del articulo'),
                controller: nombreController,
              ),
              const SizedBox(height: 20),
              const Text(
                'Escoja una categoria',
                style: TextStyle(fontSize: 16),
              ),
              DropdownButtonFormField(
                decoration: inputDecoration(null),
                value: categoryMap.entries
                    .firstWhere((element) => element.value == "Frutas")
                    .value,
                items: categoryMap.entries.map((item) {
                  return DropdownMenuItem(
                    value: item.value,
                    child: Text(item.key),
                  );
                }).toList(),
                onChanged: (value) {
                  selectedCategory.value = value!;
                },
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: inputDecoration('Describa el producto'),
                controller: descripcionController,
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: inputDecoration('Direccion de retiro'),
              ),
              const SizedBox(height: 50),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    style: buttonStyle,
                    onPressed: () async {
                      if (selectedImage.value != null) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SuccessProductScreen(),
                          ),
                          (Route<dynamic> route) => false,
                        );
                        final imageUrl = await productProvider
                            .uploadImage(selectedImage.value!);
                        // print(imageUrl);
                        productProvider.sendProduct(
                          nombreController.text,
                          descripcionController.text,
                          selectedCategory.value,
                          imageUrl!,
                        );
                      }
                    },
                    child: const Text(
                      'Subir articulo',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
