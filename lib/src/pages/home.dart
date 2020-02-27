
import 'package:QuizLab/src/widgets/menuSiderbar.dart';
import 'package:flutter/material.dart';
import 'package:QuizLab/src/pages/auth/login.dart';
import 'package:QuizLab/src/providers/menuProvider.dart';
import 'package:QuizLab/src/utils/iconStringUtil.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // BorderRadiusGeometry _borderRadius = BorderRadius.circular(50);

      
      

      // body: _lista(),
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Mis Cursos',style:TextStyle(color: Colors.black,fontSize:20.0 ) ,),
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Colors.black),
      ),
      drawer: MenuSiderbar(),
      backgroundColor: Colors.white,
          body: 
           Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
    
          _cardTipo1(context),
          
        ],
      )
      
    ); 
    
  }
 


Widget _cardTipo1(BuildContext context){
    final size = MediaQuery.of(context).size;
    // final fondo = Container(height: size.height * 0.4, width:  double.infinity,decoration: BoxDecoration(
    
    //   ),    
    // );

    return Card(
      margin: EdgeInsets.all(20.0),
      elevation: 10.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),

      child: Column(
        children:<Widget>[
           ListTile(
            //  leading: Icon(Icons.photo_album,color:Colors.purple[400]) ,
             title: Text('Mis Cursos'),
              // subtitle: Text('Esto es un texto para ver como se ve la card'),
          ),
       
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            
            
            Image.asset('assets/prueba1.png',
            height: size.height * 0.14,
            ),
            Text(
              'Upps! Esto está muy vacío que tal si visitas la tienda',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          // Positioned(top: 80.0,left: 220,child: Text('¿Olvido su contraseña?'),),
            //  Text('Upps! Esto está muy vacío que tal si visitas la tienda',textScaleFactor: 1.0,overflow: TextOverflow.ellipsis,softWrap: true),
              
            ],
            ),
            

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                onPressed: (){},
                 child: Text('Ver todos',style:TextStyle(color: Colors.blueAccent,fontSize:15.0 )),
                 ),
            
            ],
            )


        ]
      )
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