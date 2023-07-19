import 'package:flutter/material.dart';
import 'package:segunda_oportu/widgets/style_widgets.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool obscurePassword = true;
  bool otherPassword = true;

  @override
  Widget build(BuildContext context) {
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
                const TextField(),
                const SizedBox(height: 20),
                const Text(
                  'Apellido',
                  style: TextStyle(fontSize: 16),
                ),
                const TextField(),
                const SizedBox(height: 20),
                const Text(
                  'Correo Electronico',
                  style: TextStyle(fontSize: 16),
                ),
                const TextField(
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Contraseña',
                  style: TextStyle(fontSize: 16),
                ),
                TextField(
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscurePassword = !obscurePassword;
                        });
                      },
                      icon: Icon(
                        obscurePassword
                            ? Icons.remove_red_eye_outlined
                            : Icons.remove_red_eye,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  obscureText: obscurePassword,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Repita Contraseña',
                  style: TextStyle(fontSize: 16),
                ),
                TextField(
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          otherPassword = !otherPassword;
                        });
                      },
                      icon: Icon(
                        otherPassword
                            ? Icons.remove_red_eye_outlined
                            : Icons.remove_red_eye,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  obscureText: otherPassword,
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
                      onPressed: () {},
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
