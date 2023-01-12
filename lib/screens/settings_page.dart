import 'package:flutter/material.dart';
import 'package:practica_franciscojaner/preferences/preferences.dart';
import 'package:practica_franciscojaner/widgets/drawer.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Opciones'),
        centerTitle: true,
      ),
      drawer: const SideMenu(),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextFormField(
                initialValue: Preferences.usuari,
                onChanged: ((value) {
                  Preferences.usuari = value;
                  setState(() {});
                }),
                decoration: InputDecoration(
                  labelText: 'Canviar nom',
                ),
              )
            ],
          )),
    );
  }
}
