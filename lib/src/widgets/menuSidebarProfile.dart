import 'package:QuizLab/src/utils/preferencesUser.dart';
import 'package:flutter/material.dart';

class MenuSiderbarProfile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
     final prefs = new PreferencesUser();
    return Drawer(
      child: Container(
         color:(prefs.colorSecundario)?Colors.grey[850] :Color(0xFFEFEEEE),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Container(),
                decoration: BoxDecoration(
                  image: DecorationImage(
                  image: (prefs.colorSecundario) ? AssetImage('assets/imagenMenudark.png'): AssetImage('assets/imagenMenuwhile.jpg'),
                  fit: BoxFit.cover
                  ),
                ),
            ),
  
            // ListTile(
            //   leading: Icon(Icons.add_circle,color: (prefs.colorSecundario) ?Colors.purple[400]:Colors.indigoAccent[700],),
            //   title: Text('Recargar creditos'),
            //   onTap: (){
            //     Navigator.pushReplacementNamed(context, 'home');
            //   } 
            // ),
            // ListTile(
            //   leading: Icon(Icons.perm_contact_calendar,color: (prefs.colorSecundario) ?Colors.purple[400]:Colors.indigoAccent[700],),
            //   title: Text('Organizaciones'),
            //   onTap: (){
            //     Navigator.pushReplacementNamed(context, 'userProfile');
            //   } 
            // ),
            // ListTile(
            //   leading: Icon(Icons.assessment,color: (prefs.colorSecundario) ?Colors.purple[400]:Colors.indigoAccent[700],),
            //   title: Text('Estadisticas de uso'),
            //   onTap: (){
            //     Navigator.pushReplacementNamed(context, 'users');
            //   } 
            // ),
            // ListTile(
            //   leading: Icon(Icons.monetization_on,color: (prefs.colorSecundario) ?Colors.purple[400]:Colors.indigoAccent[700],),
            //   title: Text('Ganar monedas'),
            //   onTap: (){
            //     Navigator.pushReplacementNamed(context, 'conec');
            //   } 
            // ),
              ListTile(
            leading: Icon(Icons.cancel,color: Colors.grey,),
            title: Text('Cerrar sesion',style: TextStyle(color:(prefs.colorSecundario) ? Colors.grey :Colors.black),),
            onTap: (){
              Navigator.pushReplacementNamed(context, 'login');
               prefs.token= null;
               prefs.ultimaPagina= null;
            } 
          ),
          ],
        ) ,
      ),
    );
  }
}