import 'package:flutter/material.dart';
import 'package:segunda_oportu/screens/home_screen.dart';
import 'package:segunda_oportu/widgets/style_widgets.dart';

class SuccessProductScreen extends StatelessWidget {
  const SuccessProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            const SizedBox(height: 80),
            const Icon(Icons.check_circle_outline_rounded, size: 130),
            const SizedBox(height: 30),
            const Text(
              'Gracias por ayudar!',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const SizedBox(height: 30),
            const Text(
              'Tu articulo fue subido con exito!',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const Expanded(child: SizedBox()),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                      (Route<dynamic> route) => false,
                    );
                  },
                  style: buttonStyle,
                  child: const Text(
                    'Volver a Inicio',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
