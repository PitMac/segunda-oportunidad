import 'package:flutter/material.dart';
import 'package:segunda_oportu/screens/condition_screen.dart';
import 'package:segunda_oportu/widgets/style_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio Sesión'),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  'Olvidaste la contraseña?',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              const Expanded(child: SizedBox()),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    style: buttonStyle,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ConditionScreen(),
                          ));
                    },
                    child: const Text(
                      'Inicio de sesion',
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
