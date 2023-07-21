import 'package:flutter/material.dart';
import 'package:segunda_oportu/screens/login_screen.dart';
import 'package:segunda_oportu/widgets/style_widgets.dart';

class SuccessRegisterScreen extends StatelessWidget {
  const SuccessRegisterScreen({Key? key}) : super(key: key);

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
              'Felicidades!',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const SizedBox(height: 30),
            const Text(
              'Tu registro fue exitoso!',
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
                        builder: (context) => const LoginScreen(),
                      ),
                      (Route<dynamic> route) => false,
                    );
                  },
                  style: buttonStyle,
                  child: const Text(
                    'Siguiente',
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
