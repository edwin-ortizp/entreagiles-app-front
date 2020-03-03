import 'package:flutter/material.dart';

class MenuSiderbarProfile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
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
              leading: Icon(Icons.add_circle,color: Colors.purple[400],),
              title: Text('Recargar creditos'),
              onTap: (){
                Navigator.pushReplacementNamed(context, 'home');
              } 
            ),
            ListTile(
              leading: Icon(Icons.perm_contact_calendar,color: Colors.purple[400],),
              title: Text('Organizaciones'),
              onTap: (){
                Navigator.pushReplacementNamed(context, 'userProfile');
              } 
            ),
            ListTile(
              leading: Icon(Icons.assessment,color: Colors.purple[400],),
              title: Text('Estadisticas de uso'),
              onTap: (){
                Navigator.pushReplacementNamed(context, 'users');
              } 
            ),
            ListTile(
              leading: Icon(Icons.monetization_on,color: Colors.purple[400],),
              title: Text('Ganar monedas'),
              onTap: (){
                Navigator.pushReplacementNamed(context, 'users');
              } 
            )

          ],
        ) ,
      ),
    );
  }
}