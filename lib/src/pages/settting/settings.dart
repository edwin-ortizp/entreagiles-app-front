import 'package:QuizLab/src/utils/preferencesUser.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/menuSiderbar.dart';

class SettingPage extends StatefulWidget {
  // static final String routeName = 'settings';
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _colorSecundario = true;
  int _genero;
  String _nombre = 'Kewin';

  TextEditingController _textController;
  final prefs = new PreferencesUser()
;
  @override
  void initState() {
    super.initState();
    // prefs.ultimaPagina = SettingPage.routeName;
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    _nombre = prefs.nombre;
    _textController = new TextEditingController(text: _nombre);
  }
  _setSelectedGenero( int valor){
    prefs.genero = valor;
    _genero = valor;
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Settings',style:(prefs.colorSecundario) ? TextStyle(color: Colors.white):TextStyle(color: Colors.black),),
        iconTheme:(prefs.colorSecundario) ? new IconThemeData(color: Colors.white): new IconThemeData(color: Colors.black),
        backgroundColor:(prefs.colorSecundario) ? Colors.purple[400] : Colors.white
      ),
      drawer: MenuSiderbar(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text('Settings',style: TextStyle(fontSize: 45.0,fontWeight: FontWeight.bold),),
          ),

            Divider(),
            SwitchListTile(
              value: _colorSecundario, 
              title: Text('Color secundario'),
              onChanged: (value){
                setState(() {
                _colorSecundario = value;
                prefs.colorSecundario = value;
                });
              },
              ),
              RadioListTile(
                value: 1, 
                title:Text('Masculino') ,
                groupValue: _genero,
                onChanged: _setSelectedGenero,

                ),
              RadioListTile(
                value: 2, 
                title:Text('Femenino') ,
                groupValue: _genero,
                onChanged: _setSelectedGenero
                ),

              Divider(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    labelText: 'Nombre',
                    helperText: 'Nombre persona'
                  ),
                  onChanged: (value){
                    prefs.nombre = value;
                  },
                ),
              ),

        ],
      ),
    );
  }
}