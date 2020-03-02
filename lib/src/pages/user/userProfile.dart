// Llamados Dependencias
import 'package:QuizLab/src/widgets/menuSidebarProfile.dart';
import 'package:flutter/material.dart';
// Llamados Paginas
// import 'package:QuizLab/src/providers/userProvider.dart';

class UserProfile extends StatelessWidget {
  // final usersProvider = new UsersProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
        backgroundColor: Colors.purple[400],
      ),
      drawer: MenuSiderbarProfile(),
      body: Column(children: <Widget>[
        Padding(padding: EdgeInsets.only(top: 60.0)),

        _header('Alexander Ortiz', 'alexander@gesthor.org')
        // _menuOptions('Editar mi perfil'),
        // _menuOptions('Recargar creditos'),
        // _menuOptions('Organizaciones'),
        // _menuOptions('Estadisticas de uso'),
        // _menuOptions('Ganar monedas'),
      ]),
    );
  }

  Widget _menuOptions(String texto) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(padding: EdgeInsets.only(left: 60.0)),
        Icon(
          Icons.account_box,
          color: Colors.pink,
          size: 30,
        ),
        Padding(padding: EdgeInsets.all(7.0)),
        Text(
          '$texto',
          style: TextStyle(color: Colors.grey, fontSize: 25),
        ),
        Padding(padding: EdgeInsets.only(bottom: 60.0)),
      ],
    );
  }

  Widget _header(String nombre, correo) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          radius: 45.0,
          backgroundImage: NetworkImage('https://via.placeholder.com/150'),
          backgroundColor: Colors.transparent,
        ),
        Padding(padding: EdgeInsets.all(7.0)),
        Column(
          children: <Widget>[
            Text(
              '$nombre',
              style: TextStyle(color: Colors.black, fontSize: 40.0),
            ),
            Text(
              '$correo',
              style: TextStyle(color: Colors.grey, fontSize: 20.0),
            ),
          ],
        ),
      ],
    );
  }

  Widget _formEdit(){
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        child: Column(children: <Widget>[

        ],)
      ),
    );
  }
}
