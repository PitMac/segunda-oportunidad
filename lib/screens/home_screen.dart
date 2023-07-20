import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:segunda_oportu/screens/home_list_screen.dart';
import 'package:segunda_oportu/screens/messages_screen.dart';
import 'package:segunda_oportu/screens/new_product_screen.dart';
import 'package:segunda_oportu/widgets/drawer.dart';
import 'package:segunda_oportu/widgets/style_widgets.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final index = useState(0);

    final screens = [
      const HomeListScreen(),
      const MessagesScreen(),
    ];
    return Scaffold(
      endDrawer: const DrawerWidget(),
      appBar: index.value == 0
          ? AppBar(
              title: const Text('Inicio'),
            )
          : null,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NewProductScreen(),
              ));
        },
        backgroundColor: greenColor,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: screens[index.value],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index.value,
        onTap: (value) {
          index.value = value;
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.email), label: 'Mensajes'),
        ],
      ),
    );
  }
}
