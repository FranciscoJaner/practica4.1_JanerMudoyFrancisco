import 'package:flutter/material.dart';
import 'package:practica_franciscojaner/preferences/preferences.dart';
import 'package:practica_franciscojaner/widgets/widgets.dart';

class LogedPage extends StatelessWidget {
  const LogedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar de la pagina
      appBar: AppBar(
        title: const Text('Informació'),
        centerTitle: true,
      ),
      drawer: const SideMenu(), // Widget que ens crea el menu.
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              // Texte avon es monstra el nom de l'usuari per sebre que esteim logeats.
              'Benvingut ${Preferences.usuari}',
              style: const TextStyle(fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }
}
