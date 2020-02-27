
import 'package:QuizLab/src/widgets/menuSiderbar.dart';
import 'package:flutter/material.dart';
import 'package:QuizLab/src/pages/auth/login.dart';
import 'package:QuizLab/src/providers/menuProvider.dart';
import 'package:QuizLab/src/utils/iconStringUtil.dart';

// ----------------------



class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          ListView(children: <Widget>[
 Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
      
      _cardTipo3(context),
      _cardTipo4(context),
      _cardTipo2(context),

      _cardTipo1(context),

          ],
          ),
        ],
      )   
    );    
  }
 
          


Widget _cardTipo1(BuildContext context){
    final size = MediaQuery.of(context).size;

    return Card(
      margin: EdgeInsets.all(20.0),
      elevation: 10.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),

      child: Column(
        children:<Widget>[
           ListTile(
             title: Text('Mis Cursos'),
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


Widget _cardTipo2(BuildContext context){
    final size = MediaQuery.of(context).size;

    return SizedBox( 
      
      height: 250,
      width: 160,
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
     

      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          children:<Widget>[
             ListTile(          
               title: Text('Tu perfil',
            ),),
         

Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
Container(
        width: 80.0,
        height: 80.0,
        decoration: new BoxDecoration(
            shape: BoxShape.circle,
            image: new DecorationImage(
            fit: BoxFit.fill,
            image: new NetworkImage(
                   "https://i.imgur.com/BoN9kdC.png")
                   )
)),

],),

            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
             
              Text(
                'Edwin Alexander Ortiz',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold,
                fontSize:20.0),
              )
              ],
              ),
              
          ]
        ),
      )
    );
  }

  Widget _cardTipo3(BuildContext context){
    final size = MediaQuery.of(context).size;

    return SizedBox( 
      
      height: 125,
      width: 160,
     
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),

      child: Card(
      //  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Container(
        decoration: new BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent[700],Colors.deepPurple[400]],
            stops: [0.2,0.8],
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.bottomRight
          )
        ),

        // color: Colors.greenAccent[400],
        child: Column(
          children:<Widget>[
             ListTile(          
                title: Text('Tu Ranking',style: TextStyle(color: Colors.white))
               
               ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

              Text(
                 '#513.256',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold,
                fontSize:23.0,color: Colors.white),
              )
              ],
              ),
              
          ]
        ),
      ))
    );
  }

  Widget _cardTipo4(BuildContext context){
    final size = MediaQuery.of(context).size;

    return SizedBox( 
      
      height: 125,
      width: 160,
     
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),

      child: Card(
      //  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Container(
        decoration: new BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.greenAccent[700],Colors.tealAccent[400]],
            stops: [0.2,0.8],
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.bottomRight
          )
        ),

        // color: Colors.greenAccent[400],
        child: Column(
          children:<Widget>[
             ListTile(          
               title: Text('Eurecoins',style: TextStyle(color: Colors.white))
               
               ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

              Text(
                '0',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold,
                fontSize:23.0,color: Colors.white),
              )
              ],
              ),
              
          ]
        ),
      ))
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