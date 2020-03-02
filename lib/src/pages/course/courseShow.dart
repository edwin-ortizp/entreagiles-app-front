import 'package:QuizLab/src/widgets/menuSiderbar.dart';
import 'package:flutter/material.dart';
import 'package:QuizLab/src/pages/auth/login.dart';
import 'package:QuizLab/src/providers/menuProvider.dart';
import 'package:QuizLab/src/utils/iconStringUtil.dart';


class CourseShow extends StatelessWidget {
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
  }

