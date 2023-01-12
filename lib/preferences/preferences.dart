import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _preferences;

  static String _usuari = '';
  static String _contrasena = '';
  static int _genere = 1;
  static bool _checkvalue = false;

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future clear() async {
    _preferences.clear();
  }

  static bool get checkValue {
    return _preferences.getBool('logeat') ?? _checkvalue;
  }

  static set checkValue(bool value) {
    _checkvalue = value;
    _preferences.setBool('logeat', value);
  }

  static String get usuari {
    return _preferences.getString('nom') ?? _usuari;
  }

  static set usuari(String value) {
    _usuari = value;
    _preferences.setString('nom', value);
  }

  static String get contrasena {
    return _preferences.getString('contrasena') ?? _contrasena;
  }

  static set contrasena(String value) {
    _contrasena = value;
    _preferences.setString('contrasena', value);
  }

  static int get genere {
    return _preferences.getInt('genere') ?? _genere;
  }

  static set genere(int value) {
    _genere = value;
    _preferences.setInt('genere', value);
  }
}
