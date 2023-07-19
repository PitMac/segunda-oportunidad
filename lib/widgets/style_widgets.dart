import 'package:flutter/material.dart';

ButtonStyle buttonStyle = ButtonStyle(
  elevation: MaterialStateProperty.resolveWith((states) => 0),
  backgroundColor: MaterialStateColor.resolveWith(
      (states) => const Color.fromARGB(255, 93, 234, 80)),
  minimumSize: MaterialStateProperty.resolveWith(
    (states) => const Size(20, 50),
  ),
);

Color greenColor = const Color.fromARGB(255, 93, 234, 80);
