// llamados de depenencias
import 'package:flutter/material.dart';

import 'package:apk_eureka/src/pages/auth/login.dart';
import 'package:apk_eureka/src/providers/menuProvider.dart';
import 'package:apk_eureka/src/utils/iconStringUtil.dart';


class HomePage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Eureka'),
        backgroundColor: Colors.purple[400],
      ),
      body: _lista(),
    );
  }

 Widget _lista() {

  // menuProvider.cargarData()
  return FutureBuilder(
    future: menuProvider.cargarData() ,
    initialData: [],
    builder: (context, AsyncSnapshot<List<dynamic>> snapshot){


      return ListView(
        children : _listaItems(snapshot.data,context),
      );
    },

    );

 }

  List<Widget>_listaItems(List<dynamic>data, BuildContext context) {

    final List<Widget> opciones = [];


    data.forEach((opt){

      final widgetTemp = ListTile(
        title: Text( opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.purple[400],),
        onTap: (){
          final route = MaterialPageRoute(
            builder: ( context )=> LoginPage()
            );

          Navigator.pushNamed(context, opt['ruta']);

        },
      );

    opciones..add( widgetTemp ) 
            ..add( Divider());
    });
    return opciones;
  }

}