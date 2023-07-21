import 'package:flutter/material.dart';
import 'package:segunda_oportu/widgets/style_widgets.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Jose Alexander'),
          actions: const [
            Icon(Icons.call),
            SizedBox(width: 10),
            Icon(Icons.info),
            SizedBox(width: 10),
          ],
        ),
        bottomSheet: SizedBox(
          height: 60,
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: greenColor,
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Mensaje',
                      suffixIcon: Icon(Icons.camera_alt_rounded),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.location_on_sharp),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.send),
              ),
            ],
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 70),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 0, right: 15),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Hola, te estoy escribiendo por la razon de que en este momento estoy requiriendo el producto que publicaste',
                ),
              )
            ],
          ),
        ));
  }
}
