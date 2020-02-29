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
              Navigator.pushReplacementNamed(context, 'home');
            } 
          ),
          ListTile(
            leading: Icon(Icons.people,color: Colors.indigoAccent[700],),
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