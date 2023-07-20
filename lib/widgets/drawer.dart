import 'package:flutter/material.dart';
import 'package:segunda_oportu/screens/profile_screen.dart';
import 'package:segunda_oportu/widgets/style_widgets.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: greenColor,
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Perfil'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileScreen(),
                    ));
              },
            ),
            const ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notificaciones'),
            ),
            const ListTile(
              leading: Icon(Icons.help),
              title: Text('Ayuda'),
            ),
            const ListTile(
              leading: Icon(Icons.people),
              title: Text('Quienes somos'),
            ),
          ],
        ),
      ),
    );
  }
}
