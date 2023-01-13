import 'package:flutter/material.dart';
import 'package:practica_franciscojaner/preferences/preferences.dart';
import 'package:practica_franciscojaner/widgets/drawer.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // AppBar de la pagina
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        drawer:
            const SideMenu(), // Widget que empleam com a drawer que hem creat a la carpeta widgets.
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Configuració',
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.w300),
                ),
                const Divider(),
                SwitchListTile(
                    // Widget el qual canvia el tema de la aplicacio de clar a obscur.
                    value: Preferences.isDarkMode,
                    title: const Text('Mode oscur'),
                    onChanged: (value) {
                      Preferences.isDarkMode = value;
                      final themeProvider =
                          Provider.of<ThemeProvider>(context, listen: false);
                      value
                          ? themeProvider.setDarkMode()
                          : themeProvider.setLightMode();
                      setState(() {});
                    }),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    // Text field que el que fa es canviar el valor de la preference de usuari per el que introduim, basicament es un canvi de nom.
                    initialValue: Preferences.usuari,
                    onChanged: (value) {
                      Preferences.usuari = value;
                      setState(() {});
                    },
                    decoration: const InputDecoration(
                        labelText: 'Canviar Nom',
                        helperText: 'Nom de l\'usuari'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    // Text field que el que fa es canviar el valor de la preference de usuari per el que introduim, basicament es un canvi de nom.
                    initialValue: Preferences.contrasena,
                    obscureText: true,
                    onChanged: (value) {
                      Preferences.contrasena = value;
                      setState(() {});
                    },
                    decoration: const InputDecoration(
                        labelText: 'Canviar contrasenya',
                        helperText: 'Contrasenya'),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
