import 'package:flutter/material.dart';
import 'package:practica_franciscojaner/preferences/preferences.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          const _DrawerHeader(),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text('Informació'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, 'Loged');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text('Configuració'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, 'Settings');
            },
          ),
          ListTile(
            leading: const Icon(Icons.close),
            title: const Text('Tencar Sessio'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, 'Home');
            },
          ),
        ],
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Container(),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/menu-img.jpg'), fit: BoxFit.cover)),
    );
  }
}
