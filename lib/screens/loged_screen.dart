import 'package:flutter/material.dart';
import 'package:practica_franciscojaner/preferences/preferences.dart';
import 'package:practica_franciscojaner/widgets/widgets.dart';

class LogedPage extends StatelessWidget {
  const LogedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informació'),
        centerTitle: true,
      ),
      drawer: const SideMenu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Benvingut ${Preferences.usuari}',
              style: TextStyle(fontSize: 30),
            ),
          ),
          Center(
            child: Text(''),
          )
        ],
      ),
    );
  }
}
