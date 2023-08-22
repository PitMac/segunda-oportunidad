import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:segunda_oportu/provider/auth_provider.dart';
import 'package:segunda_oportu/widgets/dialog.dart';
import 'package:segunda_oportu/widgets/style_widgets.dart';

class PasswordScreen extends HookWidget {
  const PasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final correoController = useTextEditingController();

    final authProvider = Provider.of<AuthProvider>(context);

    useEffect(() {
      return null;
    }, []);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resetear contraseña'),
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
                      if (correoController.value.text.isEmpty) {
                        showMyDialog(context, 'Rellene todos los campos');
                        return;
                      } else if (!RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                      ).hasMatch(correoController.value.text)) {
                        showMyDialog(context, 'Correo no valido');
                        return;
                      }
                      await authProvider.resetPassword(correoController.text);
                    },
                    child: const Text(
                      'Enviar',
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
