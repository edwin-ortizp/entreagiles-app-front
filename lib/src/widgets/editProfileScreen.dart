// import 'dart:js';

import 'package:QuizLab/src/utils/preferencesUser.dart';
import 'package:QuizLab/src/widgets/menuSidebarProfile.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';


class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({
    Key key,
  }) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final prefs = new PreferencesUser();
  bool _colorSecundario = true;
  @override
   void initState() {
    super.initState();
    // prefs.ultimaPagina = SettingPage.routeName;
    _colorSecundario = prefs.colorSecundario;
  }
  Widget build(BuildContext context) {
  Color color = (prefs.colorSecundario)? Colors.purple[400] : Colors.indigoAccent[400];
  theme: ThemeData (primarySwatch:(prefs.colorSecundario)?  Colors.purple :Colors.red ) ;
    return Scaffold(
        appBar: AppBar(
          title: Text('Perfil'),
          leading: IconButton(
            tooltip: 'Previous choice',
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
             Navigator.of(context).popAndPushNamed('settings');
            },
          ),
          backgroundColor: (prefs.colorSecundario) ? Colors.purple[400] : Colors.white,
          ),
      resizeToAvoidBottomPadding: false,
      endDrawer: MenuSiderbarProfile(),
      //  SingleChildScrollView(
      //       child: Container(
      body: SingleChildScrollView(
              child: Container(
          child: Column(
            children: <Widget>[
              topBar(context,color),
              _homePageContent(color),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox topBar(BuildContext context,color) {
    return SizedBox(
      height: 150,
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          _purpleBar(),
          _circleAvatar(context,color),
        ],
      ),
    );
  }

Widget _purpleBar() {
    return ControlledAnimation(
      duration: Duration(milliseconds: 600),
      tween: Tween<double>(begin: 0, end: 150),
      builder: (context, animation) {
        return Container(
          padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
          height: animation,
          width: double.infinity,
          color: (prefs.colorSecundario) ? Colors.purple[200]:Colors.white70 ,
          child: ListView( children: <Widget>[
            ListTile(
              title: new Center (
                child: Text('Alexander Ortiz',
                  style: (prefs.colorSecundario) ? TextStyle(color: Colors.white, fontSize: 30.0) :TextStyle(color: Colors.grey[400], fontSize: 30.0) 
                  ),
                ),
                subtitle: new Center (child: Text('alexander@gesthor.org',
                  style: TextStyle(fontSize: 15.0))),
              ),
            ]
          ),
        );
      }
    );
  }

Widget _circleAvatar(BuildContext context,color){
    final size = MediaQuery.of(context).size;
    return ControlledAnimation(
      duration: Duration(milliseconds: 600),
      delay: Duration(milliseconds: (300 * 2).round()),
      curve: Curves.elasticOut,
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, scaleValue) {
        return Positioned(
          top: 100,
          left: size.width / 2 - 50,
          child: Transform.scale(
            scale: scaleValue,
            alignment: Alignment.center,
            child: _purpleCircle(color),
          ),
        );
      },
    );
  }

  Widget _purpleCircle(color) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: color,
        image: DecorationImage(
          image: AssetImage('assets/images/finn.jpg'),
          fit: BoxFit.cover,
        ),
        border: Border.all(
          width: 4,
          color: color
        ),
      ),
    );
  }

Widget _homePageContent(color) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: <Widget>[
          largeWhitespace(),
          contentPlaceHolder(color),
        ],
      ),
    );
  }

  Widget contentPlaceHolder(color) {
    return ControlledAnimation(
      duration: Duration(milliseconds: 600),
      delay: Duration(milliseconds: (300 * 3).round()),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, opacityValue) {
        return Opacity(
            opacity: opacityValue,
            child: Column(children: <Widget>[
            _colorSecundary(),
            _nameField('Nombres',color),
            smallWhitespace(),
            _nameField('Apellidos',color),
            smallWhitespace(),
            _emailField(color),
            smallWhitespace(),
            _phoneField(color),
            smallWhitespace(),
            _saveButton(color)
            ]),
          );
      },
    );
  }

  Widget largeWhitespace() => SizedBox(height: 60);

  Widget smallWhitespace() => SizedBox(height: 8);

Widget _nameField(String data,color){
  return TextField(
      // autofocus: true, es para activar  al entrar el texto
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        border:   OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        hintText: '$data',
        helperText: '$data',
        suffixIcon: Icon(Icons.text_fields,color: color,),
        icon: Icon(Icons.account_circle,color: color)
      ),
      // onChanged: (valor) => setState(() {
      //   _email = valor;
      //   })
    );

}

Widget _emailField(color) {
    
      return TextField(
      // autofocus: true, es para activar  al entrar el texto
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border:   OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        hintText: 'Email',
        helperText: 'Email',
        suffixIcon: Icon(Icons.alternate_email,color: color,),
        icon: Icon(Icons.email,color: color)
      ),
      // onChanged: (valor) =>setState(() {
      //   _email = valor;
      //   })
    );
  }

Widget _phoneField(color) {
    
      return TextField(
      // autofocus: true, es para activar  al entrar el texto
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        border:   OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        hintText: 'Telefono',
        helperText: 'Telefono',
        suffixIcon: Icon(Icons.phonelink_setup,color: color,),
        icon: Icon(Icons.phone_iphone,color: color)
      ),
      // onChanged: (valor) =>setState(() {
      //   _email = valor;
      //   })
    );
  }

Widget _saveButton(color){

  return RaisedButton.icon(
    onPressed: () {},
    icon: Icon(Icons.save, color: Colors.white,),
    color: color,
    label: Text('Guardar', 
      style: TextStyle(
      fontSize: 20.0,
      color: Colors.white,),
    ),
    shape: RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(18.0),
    ),
    );

  }
  Widget _colorSecundary(){

    return Center(
      child: SwitchListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 80),
        value: _colorSecundario, 
        title: Text('Color secundario',style: TextStyle(fontSize: 16,color: Colors.grey[700]),),
        onChanged: (value){
          setState(() {
          _colorSecundario = value;
          prefs.colorSecundario = value;
          });
        },
      ),
    );
  }
}


