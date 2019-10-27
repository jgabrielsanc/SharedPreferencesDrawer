import 'package:flutter/material.dart';
import 'package:preferenciasusuariosapp/src/widgets/menu_widget.dart';

class SettingsPage extends StatelessWidget {
  
  
  static final routeName = 'settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      drawer: MenuWidget(),
      body: Center(
        child: Text('Ajustes Page'),
      ),
    );
  }
}