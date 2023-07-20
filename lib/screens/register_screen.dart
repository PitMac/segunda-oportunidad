import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:segunda_oportu/screens/success_register_screen.dart';
import 'package:segunda_oportu/widgets/style_widgets.dart';

class RegisterScreen extends HookWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final obscurePassword = useState(true);
    final otherPassword = useState(true);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro'),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Nombre',
                  style: TextStyle(fontSize: 16),
                ),
                TextField(
                  decoration: inputDecoration(null),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Apellido',
                  style: TextStyle(fontSize: 16),
                ),
                TextField(
                  decoration: inputDecoration(null),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Correo Electronico',
                  style: TextStyle(fontSize: 16),
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: inputDecoration(null),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Contraseña',
                  style: TextStyle(fontSize: 16),
                ),
                TextField(
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: greenColor),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        obscurePassword.value = !obscurePassword.value;
                      },
                      icon: Icon(
                        obscurePassword.value
                            ? Icons.remove_red_eye_outlined
                            : Icons.remove_red_eye,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  obscureText: obscurePassword.value,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Repita Contraseña',
                  style: TextStyle(fontSize: 16),
                ),
                TextField(
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: greenColor),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        otherPassword.value = !otherPassword.value;
                      },
                      icon: Icon(
                        otherPassword.value
                            ? Icons.remove_red_eye_outlined
                            : Icons.remove_red_eye,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  obscureText: otherPassword.value,
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 200,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      style: buttonStyle,
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SuccessRegisterScreen(),
                          ),
                          (Route<dynamic> route) => false,
                        );
                      },
                      child: const Text(
                        'Registrar',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Necesitas Ayuda?',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
