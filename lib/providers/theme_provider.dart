import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  // Classe provider que controla l'estat de el tema de la aplicació
  ThemeData currentTheme;

  ThemeProvider({required bool isDarkMode})
      : currentTheme = isDarkMode ? ThemeData.dark() : ThemeData.light();

  setLightMode() {
    currentTheme = ThemeData.light();
    notifyListeners();
  }

  setDarkMode() {
    currentTheme = ThemeData.dark();
    notifyListeners();
  }
}
