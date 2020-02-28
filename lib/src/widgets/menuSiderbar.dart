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
                fit: BoxFit.cover
                ),
              ),
          ),

          ListTile(
            leading: Icon(Icons.store,color: Colors.purple[400],),
            title: Text('Home'),
            onTap: (){
              Navigator.pushReplacementNamed(context, 'home');
            } 
          ),
          ListTile(
            leading: Icon(Icons.account_circle,color: Colors.purple[400],),
            title: Text('Perfil'),
            onTap: (){
              Navigator.pushReplacementNamed(context, 'userProfile');
            } 
          ),
          ListTile(
            leading: Icon(Icons.people,color: Colors.purple[400],),
            title: Text('Usuarios'),
            onTap: (){
              Navigator.pushReplacementNamed(context, 'users');
            } 
          )

        ],
      ) ,
    );
  }
}