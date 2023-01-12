import 'package:flutter/material.dart';
import 'package:practica_franciscojaner/preferences/preferences.dart';
import 'screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Practica 4.1',
      initialRoute: 'Home',
      routes: {
        'Home': (context) => HomePage(),
        'Loged': (context) => const LogedPage(),
        'Settings': (context) => const SettingsPage()
      },
    );
  }
}
