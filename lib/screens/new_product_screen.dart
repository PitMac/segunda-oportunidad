import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:segunda_oportu/provider/product_provider.dart';
import 'package:segunda_oportu/screens/success_product_screen.dart';
import 'package:segunda_oportu/widgets/style_widgets.dart';

enum TypeProduct { producto, comestible }

class NewProductScreen extends HookWidget {
  const NewProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = useState(TypeProduct.producto);

    final nombreController = useTextEditingController();
    final descripcionController = useTextEditingController();

    final productProvider = Provider.of<ProductProvider>(context);

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
              DottedBorder(
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
              RadioListTile(
                value: TypeProduct.producto,
                groupValue: product.value,
                activeColor: greenColor,
                onChanged: (value) {
                  product.value = value!;
                },
                title: const Text('Producto'),
              ),
              RadioListTile(
                value: TypeProduct.comestible,
                groupValue: product.value,
                activeColor: greenColor,
                onChanged: (value) {
                  product.value = value!;
                },
                title: const Text('Comestible'),
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
                    onPressed: () {
                      // productProvider.sendProduct(nombreController.text,
                      //     descripcionController.text, product.value);
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SuccessProductScreen(),
                        ),
                        (Route<dynamic> route) => false,
                      );
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
