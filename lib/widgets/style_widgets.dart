import 'package:flutter/material.dart';

Color greenColor = const Color.fromARGB(255, 58, 152, 185);
Color greenColor2 = const Color.fromARGB(255, 93, 234, 80);

ButtonStyle buttonStyle = ButtonStyle(
  elevation: MaterialStateProperty.resolveWith((states) => 0),
  textStyle: MaterialStateProperty.resolveWith((states) => const TextStyle(
        fontSize: 18,
      )),
  backgroundColor: MaterialStateColor.resolveWith((states) => greenColor),
  minimumSize: MaterialStateProperty.resolveWith(
    (states) => const Size(20, 50),
  ),
);
ButtonStyle buttonStyleW = ButtonStyle(
  elevation: MaterialStateProperty.resolveWith((states) => 0),
  textStyle: MaterialStateProperty.resolveWith((states) => const TextStyle(
        fontSize: 18,
      )),
  backgroundColor: MaterialStateColor.resolveWith((states) => Colors.green),
  minimumSize: MaterialStateProperty.resolveWith(
    (states) => const Size(20, 50),
  ),
);

InputDecoration inputDecoration(String? hint) {
  return InputDecoration(
    hintText: hint,
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: greenColor),
    ),
  );
}
