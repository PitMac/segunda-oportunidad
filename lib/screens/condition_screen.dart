import 'package:flutter/material.dart';
import 'package:segunda_oportu/screens/welcome_screen.dart';
import 'package:segunda_oportu/widgets/style_widgets.dart';

class ConditionScreen extends StatelessWidget {
  const ConditionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 15),
              Text(
                '¡Bienvenido/a a nuestra comunidad!',
                style: TextStyle(
                  color: greenColor,
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 15),
              Image.asset(
                'assets/condition.png',
                height: 200,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 15),
              const Text(
                  'Nos alegra que hayas decidido unirte a nosotros para compartir lo que no necesites. Queremos recordarte que nuestra aplicacion no solo ayuda a la comunidad sino tambien al medio ambiente a reducir la cantidad de residuos en el mundo.'),
              const Text('''

Antes de Comenzar

Queremos darte alguna reglas importantes:

1. Se respetuoso con los demas usuarios.

2. No compartas articulos o alimentos que no esten en buenas condiciones.

3.No utilices la plataforma para fines comerciales o de lucro personal.
'''),
              const Expanded(child: SizedBox()),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: buttonStyle,
                    child: const Text(
                      'Estoy de acuerdo',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WelcomeScreen(),
                          ));
                    },
                    child: const Text(
                      'Volver al Inicio',
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
