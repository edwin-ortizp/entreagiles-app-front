import 'package:flutter/material.dart';

class MenuSiderbar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(),
              decoration: BoxDecoration(
                image: DecorationImage(
                image: AssetImage('assets/imagenMenu.jpg'),
                fit: BoxFit.cover,
                ),
              ),
          ),

          ListTile(
            leading: Icon(Icons.store,color: Colors.indigoAccent[700],),
            title: Text('Home'),
            onTap: (){
              Navigator.pushReplacementNamed(context, 'buttonBarBottom');
            } 
          ),
          ListTile(
<<<<<<< HEAD
            leading: Icon(Icons.account_circle,color: Colors.purple[400],),
            title: Text('Perfil'),
            onTap: (){
              Navigator.pushReplacementNamed(context, 'userProfile');
            } 
          ),
          ListTile(
            leading: Icon(Icons.people,color: Colors.purple[400],),
=======
            leading: Icon(Icons.people,color: Colors.indigoAccent[700],),
>>>>>>> feature/Sprint_02_login_token
            title: Text('Usuarios'),
            onTap: (){
              Navigator.pushReplacementNamed(context, 'users');
            } 
          ),
          ListTile(
            leading: Icon(Icons.settings,color: Colors.indigoAccent[700],),
            title: Text('Setting'),
            onTap: (){
              Navigator.pushReplacementNamed(context, 'settings');
              
            } 
          ),
          ListTile(
            leading: Icon(Icons.settings,color: Colors.indigoAccent[700],),
            title: Text('courses'),
            onTap: (){
              Navigator.pushReplacementNamed(context, 'course');
              
            } 
          ),
          ListTile(
            leading: Icon(Icons.cancel,color: Colors.indigoAccent[700],),
            title: Text('Cerrar secion'),
            onTap: (){
              Navigator.pushReplacementNamed(context, 'login');
              
            } 
          )

        ],
      ) ,
    );
  }
}