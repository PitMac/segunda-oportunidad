import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:segunda_oportu/provider/auth_provider.dart';
import 'package:segunda_oportu/screens/home_screen.dart';
import 'package:segunda_oportu/widgets/style_widgets.dart';

class LoginScreen extends HookWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final obscurePassword = useState(true);

    final correoController = useTextEditingController();
    final passwordController = useTextEditingController();

    final authProvider = Provider.of<AuthProvider>(context);

    useEffect(() {
      if (authProvider.successLogin) {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
            (Route<dynamic> route) => false,
          );
        });
      }
      return null;
    }, [authProvider.successLogin]);
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
              TextField(
                controller: correoController,
                keyboardType: TextInputType.emailAddress,
                decoration: inputDecoration(null),
              ),
              const SizedBox(height: 20),
              const Text(
                'Contraseña',
                style: TextStyle(fontSize: 16),
              ),
              TextField(
                controller: passwordController,
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
              Text(authProvider.errorMessage != ''
                  ? 'Error: ${authProvider.errorMessage}'
                  : ''),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    style: buttonStyle,
                    onPressed: () async {
                      await authProvider.logIn(
                          correoController.text, passwordController.text);
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
