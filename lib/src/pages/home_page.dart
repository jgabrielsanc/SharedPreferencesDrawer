import 'package:flutter/material.dart';
import 'package:preferenciasusuariosapp/src/shared_prefs/user_preferences.dart';
import 'package:preferenciasusuariosapp/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {

  static final String routeName = 'home';
  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Preferencias de Usuarios"),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blueAccent,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Color secundario: ${(prefs.colorSecundario ? 'SI' : 'NO')}'),
          Divider(),
          Text('Genero: ${(prefs.genero == 1 ? 'M' : 'F')}'),
          Divider(),
          Text('Nombre Usuario: ${(prefs.nombre)}'),
          Divider(),
        ],
      ),
    );
  }
}