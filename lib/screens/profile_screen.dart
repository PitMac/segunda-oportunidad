import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:segunda_oportu/widgets/style_widgets.dart';

class ProfileScreen extends HookWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 100,
                ),
              ),
              Center(
                child: TextButton(
                  child: const Text(
                    'Cambiar foto de perfil',
                    style: TextStyle(color: Colors.blue),
                  ),
                  onPressed: () {},
                ),
              ),
              const Text(
                'Sobre ti',
                style: TextStyle(fontSize: 16),
              ),
              TextField(
                decoration: inputDecoration(null),
              ),
              const SizedBox(height: 20),
              const Text(
                'Me gusta',
                style: TextStyle(fontSize: 16),
              ),
              TextField(
                decoration: inputDecoration(null),
              ),
              const SizedBox(height: 20),
              const Text(
                'No me gusta',
                style: TextStyle(fontSize: 16),
              ),
              TextField(
                decoration: inputDecoration(null),
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    style: buttonStyle,
                    onPressed: () {},
                    child: const Text(
                      'Actualizar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Center(
                child: TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.exit_to_app,
                    color: Colors.black,
                  ),
                  label: const Text(
                    'Cerrar sesion',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
