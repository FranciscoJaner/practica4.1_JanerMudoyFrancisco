import 'package:flutter/material.dart';

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
            // Valor de el menu que ens torna a la pagina 'Loged'.
            leading: const Icon(Icons.info),
            title: const Text('Informació'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, 'Loged');
            },
          ),
          ListTile(
            // Valor de el menu que ens torna a la pagina 'Settings'.
            leading: const Icon(Icons.settings_outlined),
            title: const Text('Configuració'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, 'Settings');
            },
          ),
          ListTile(
            // Valor de el menu que ens torna a la pagina 'Home'.
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

// Classe que ens coloca la imatge del menu.
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
            image: AssetImage('assets/menu-img2.jpg'), fit: BoxFit.cover),
      ),
    );
  }
}
