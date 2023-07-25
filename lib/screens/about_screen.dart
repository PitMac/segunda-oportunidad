import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quienes somos'),
      ),
      body: const Center(
        child: Text('Quienes somos'),
      ),
    );
  }
}
