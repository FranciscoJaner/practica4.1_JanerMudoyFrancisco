import 'package:flutter/material.dart';
import 'package:practica_franciscojaner/preferences/preferences.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  bool mirarvalor = false;
  @override
  Widget build(BuildContext context) {
    _getCredential();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Login',
              style: TextStyle(fontSize: 25),
            ),
            const Divider(),
            TextField(
              controller: _username,
              onChanged: (value) {
                Preferences.usuari = value;
              },
              decoration: const InputDecoration(
                labelText: 'Nom d\'usuari',
                icon: Icon(Icons.supervised_user_circle),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 3),
                ),
              ),
            ),
            const Divider(),
            TextField(
              controller: _password,
              obscureText: true,
              onChanged: (value) {
                Preferences.contrasena = value;
              },
              decoration: const InputDecoration(
                labelText: 'Contrasenya',
                icon: Icon(Icons.password),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 3),
                ),
              ),
            ),
            const Divider(),
            CheckboxListTile(
              value: mirarvalor,
              title: const Text('Recordarme'),
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (value) {
                _onChanged(value!);
              },
            ),
            const Divider(),
            _botons(context)
          ],
        ),
      ),
    );
  }

  _botons(BuildContext context) {
    // Metode de els dos botons que a la hora de pitjar enviar si els un de els dos textFields esta buid sortira un Alert que mos avisara.
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: ElevatedButton(
            onPressed: (() {
              if (_username.text.length != 0 && _password.text.length != 0) {
                Navigator.pushNamedAndRemoveUntil(
                    context, 'Loged', ((route) => false));
              } else {
                showDialog(
                  context: context,
                  builder: ((context) => AlertDialog(
                        title: const Text('Avis'),
                        content: const Text('Contrasenya o usuari incorrectes'),
                        actions: [
                          ElevatedButton(
                            onPressed: (() {
                              Navigator.pop(context);
                            }),
                            child: const Text('Okay'),
                          )
                        ],
                      )),
                );
              }
            }),
            child: const Text('Enviar'),
          ),
        ),
      ],
    );
  }

  _onChanged(bool value) async {
    // Metode que el que fa es mirar el valor del checkbox y li asigna a la variable mirarvalor i a las preferences el valors de el controlles.
    setState(() {
      mirarvalor = value;
      Preferences.checkValue = mirarvalor;
      Preferences.usuari = _username.text;
      Preferences.contrasena = _password.text;
      _getCredential();
    });
  }

  _getCredential() async {
    // Aquest metode el que fa es segons el valor que tengui mirar valor, es guardaran els camps o no fent com un especie de recordatori per no tenir que tornar a intorduir els camps.
    setState(() {
      mirarvalor = Preferences
          .checkValue; // Assignam a mirar valor el valor de la preferencia.
      if (mirarvalor != null) {
        // Si conte algo
        if (mirarvalor) {
          // Si es true asignara als controllers els valors de las preferences.
          _username.text = Preferences.usuari;
          _password.text = Preferences.contrasena;
        } else {
          // Si es false borrara els valors dels controlles y de las preferences.
          _username.clear();
          _password.clear();
          Preferences.clear();
        }
      } else {
        mirarvalor = false;
      }
    });
  }
}
