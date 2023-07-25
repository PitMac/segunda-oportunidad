import 'package:flutter/material.dart';
import 'package:segunda_oportu/screens/message_screen.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mensajes'),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            ListTile(
              title: const Text('Jose Alexander'),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              trailing: const Icon(Icons.arrow_forward_ios_sharp),
              tileColor: Colors.blue[100],
              subtitle: const Text(
                'Hola, te estoy escribiendo por la razon de que en este momento estoy requiriendo el producto que publicaste',
                style: TextStyle(overflow: TextOverflow.ellipsis),
              ),
              leading: const CircleAvatar(
                backgroundColor: Colors.yellow,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MessageScreen(),
                    ));
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              title: const Text('Manuel Cepeda'),
              trailing: const Icon(Icons.arrow_forward_ios_sharp),
              tileColor: Colors.grey[100],
              subtitle: const Text(
                'Hola, te estoy escribiendo por la razon de que en este momento',
                style: TextStyle(overflow: TextOverflow.ellipsis),
              ),
              leading: const CircleAvatar(
                backgroundColor: Colors.purple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
