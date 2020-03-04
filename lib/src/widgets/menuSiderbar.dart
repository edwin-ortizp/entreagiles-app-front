import 'package:QuizLab/src/utils/preferencesUser.dart';
import 'package:flutter/material.dart';

class MenuSiderbar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final prefs = new PreferencesUser();
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: (prefs.colorSecundario) ? AssetImage('assets/imagenMenu1.jpg'): AssetImage('assets/banner.png'),
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
            leading: Icon(Icons.settings,color: Colors.indigoAccent[700],),
            title: Text('courses'),
            onTap: (){
              Navigator.pushReplacementNamed(context, 'course');
              
            } 
          ),
          ListTile(
            leading: Icon(Icons.settings,color: Colors.indigoAccent[700],),
            title: Text('Profile'),
            onTap: (){
              Navigator.pushReplacementNamed(context, 'userProfile');
              
            } 
          ),
          ListTile(
            leading: Icon(Icons.cancel,color: Colors.indigoAccent[700],),
            title: Text('Cerrar sesion'),
            onTap: (){
              Navigator.pushReplacementNamed(context, 'login');
              
            } 
          ),
          ListTile(
            leading: Icon(Icons.portrait,color: Colors.indigoAccent[700],),
            title: Text('Show curso'),
            onTap: (){
              Navigator.pushReplacementNamed(context, 'showCourses');
              
            } 
          )

        ],
      ) ,
    );
  }
}