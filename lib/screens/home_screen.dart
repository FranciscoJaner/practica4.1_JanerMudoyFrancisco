import 'package:flutter/material.dart';
import 'package:practica_franciscojaner/preferences/preferences.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _username =
      TextEditingController(); // Controllers per poder gestionar el textfields i poder emplear o indicar els seus valors.
  final TextEditingController _password = TextEditingController();

  bool mirarvalor = false; // Variable que es el valor de el checkbox.
  @override
  Widget build(BuildContext context) {
    _getValor();
    return Scaffold(
      // App bar de la pagina
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
            // Imatge que es veu al principi de l'aplicació
            const CircleAvatar(
              backgroundImage: AssetImage('assets/loginIcon.png'),
              radius: 100,
            ),
            const Divider(),
            const Text(
              // Texte de login
              'Login',
              style: TextStyle(fontSize: 25),
            ),
            const Divider(),
            // Primer textfield en el cual introduirem el nom de usuari
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
            // TextField en el cual introduirem la contrasenya de l'usuari.
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
              // CheckBox que si esta activda guardara els valors de els textfields.
              value: mirarvalor,
              title: const Text('Recordarme'),
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (value) {
                _onChanged(value!);
              },
            ),
            const Divider(),
            _boto(context)
          ],
        ),
      ),
    );
  }

  // Metode que empleam per crear el boto.
  _boto(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: ElevatedButton(
            onPressed: (() {
              if (_username.text.length != 0 && _password.text.length != 0) {
                // Si els controlles no estan buids ens enviara a la pagina 'Loged'.
                Navigator.pushNamedAndRemoveUntil(
                    context, 'Loged', ((route) => false));
              } else {
                // Si algun esta buid ens monstrara aquest alert dialog.
                showDialog(
                  context: context,
                  builder: ((context) => AlertDialog(
                        title: const Text('Avis'),
                        content: const Text('Contrasenya o usuari buits'),
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
    // Metode que el que fa es mirar el valor del checkbox i quan canvia li asigna a la variable mirarvalor i a las preferences el valors de el controllers.
    setState(() {
      mirarvalor = value;
      Preferences.checkValue = mirarvalor;
      Preferences.usuari = _username.text;
      Preferences.contrasena = _password.text;
      _getValor();
    });
  }

  _getValor() async {
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
