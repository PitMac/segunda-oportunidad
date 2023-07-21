import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:segunda_oportu/provider/auth_provider.dart';
import 'package:segunda_oportu/provider/product_provider.dart';
import 'package:segunda_oportu/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:segunda_oportu/widgets/style_widgets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: greenColor,
            selectedItemColor: Colors.white,
          ),
        ),
        title: 'Material App',
        home: const WelcomeScreen(),
      ),
    );
  }
}
