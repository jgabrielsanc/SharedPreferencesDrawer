import 'package:flutter/material.dart';
import 'package:preferenciasusuariosapp/src/shared_prefs/user_preferences.dart';
import 'package:preferenciasusuariosapp/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  
  
  static final routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool _colorSecundario;
  int _genero;
  String _nombre;

  TextEditingController _editingController;

  final prefs = new PreferenciasUsuario();

  @override
  void initState() {
    super.initState();

    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;

    _editingController = new TextEditingController(text: prefs.nombre);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blueAccent,
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text('Settings', style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),),
          ),
          Divider(),
          SwitchListTile(
            value: _colorSecundario,
            title: Text('Color secundario'),
            onChanged: _setSelectedSwitch
          ),
          Divider(),
          RadioListTile(
            value: 1,
            title: Text('Masculino'),
            groupValue: _genero,
            onChanged: _setSelectedRadio
          ),
          RadioListTile(
            value: 2,
            title: Text('Feminino'),
            groupValue: _genero,
            onChanged: _setSelectedRadio
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _editingController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre de la persona usando el telefono'
              ),
              onChanged: (value) {
                prefs.nombre = value;
                _nombre = value;
                setState(() {
                  
                });
              },
            ),
          )
        ],
      )
    );
  }

  _setSelectedRadio(int valor) {

    prefs.genero = valor;
    _genero = valor;
    setState(() {});
  }

  void _setSelectedSwitch(bool value) {
    
    prefs.colorSecundario = value;
    _colorSecundario = value;
    setState((){});
          
  }
}