import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:segunda_oportu/provider/product_provider.dart';
import 'package:segunda_oportu/widgets/style_widgets.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProductScreen extends HookWidget {
  final DocumentSnapshot<Object?> document;
  const ProductScreen({Key? key, required this.document}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
    final productProvider = Provider.of<ProductProvider>(context);
    const url = 'https://api.whatsapp.com/send?phone=593';

    useEffect(() {
      productProvider.getPeople(data['usuario']);
      return null;
    }, []);
    return Scaffold(
      bottomSheet: Container(
        margin: const EdgeInsets.all(10),
        width: double.infinity,
        child: ElevatedButton(
          style: buttonStyleW,
          onPressed: () async {
            if (await canLaunchUrlString(
                url + productProvider.currentUser!['numero'])) {
              await launchUrlString(
                  url + productProvider.currentUser!['numero']);
            }
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
                child: Image.asset('assets/whatsapp.png'),
              ),
              const SizedBox(width: 10),
              const Text(
                'Enviar mensaje',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text('Articulo seleccionado'),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.warning_amber_rounded))
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 300,
                child: Image.network(
                  data['image_url'],
                ),
              ),
              Text(
                data['nombre'],
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                data['descripcion'],
                style: const TextStyle(fontSize: 17),
              ),
              ListTile(
                title: Text(
                  productProvider.currentUser != null
                      ? productProvider.currentUser!['nombre'] +
                          " " +
                          productProvider.currentUser!['apellido']
                      : 'Cargando..',
                  style: const TextStyle(fontSize: 17),
                ),
                leading: const Text('Usuario: '),
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.blue,
                    ),
                    Text(
                      'Portoviejo',
                      style: TextStyle(fontSize: 17, color: Colors.blue),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 200,
                child: Image.network(
                  'https://map.viamichelin.com/map/carte?map=viamichelin&z=10&lat=-1.06553&lon=-80.45398&width=550&height=382&format=png&version=latest&layer=background&debug_pattern=.*',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
