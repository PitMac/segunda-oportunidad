import 'package:flutter/material.dart';
import 'package:segunda_oportu/widgets/style_widgets.dart';

Drawer drawerWidget() {
  return Drawer(
    backgroundColor: greenColor,
    child: const SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Perfil'),
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notificaciones'),
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Ayuda'),
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Quienes somos'),
          ),
        ],
      ),
    ),
  );
}
