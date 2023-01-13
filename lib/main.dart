import 'package:flutter/material.dart';
import 'package:practica_franciscojaner/preferences/preferences.dart';
import 'package:practica_franciscojaner/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences
      .init(); // Inicialitzam las preferencies quan inici la app aixi les podrem emplear.
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => ThemeProvider(
            isDarkMode: Preferences
                .isDarkMode), // Provaider per controlar l'estat de el tema oscur a la aplicaciós
      )
    ],
    child: MyApp(),
  ));
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
        // Rutes per poder anar entre pagines de forma mes senzilla
        'Home': (context) => HomePage(),
        'Loged': (context) => const LogedPage(),
        'Settings': (context) => const SettingsPage()
      },
      theme: Provider.of<ThemeProvider>(context)
          .currentTheme, // Tema que es controla desde el porvider.
    );
  }
}
