import 'package:QuizLab/src/utils/preferencesUser.dart';
import 'package:QuizLab/src/widgets/menuSiderbar.dart';
import 'package:flutter/material.dart';
import 'package:QuizLab/src/pages/auth/login.dart';
import 'package:QuizLab/src/providers/menuProvider.dart';
import 'package:QuizLab/src/utils/iconStringUtil.dart';


class CourseShow extends StatelessWidget {
  final prefs = new PreferencesUser();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        centerTitle: true,
        title: Text('Courses',style:(prefs.colorSecundario) ? TextStyle(color: Colors.black):TextStyle(color: Colors.black)),
        // backgroundColor: Colors.purple[400],
        iconTheme:(prefs.colorSecundario) ? new IconThemeData(color: Colors.white): new IconThemeData(color: Colors.black),
        backgroundColor:(prefs.colorSecundario) ? Colors.purple[400] : Colors.white
      ),
      drawer: MenuSiderbar(),
      backgroundColor: Colors.white,

          body: 
          ListView(children: <Widget>[
 Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
      
      _cardconimagen(context),
      _cardexpansiontile(context),
      _cardexpansiontiletipo2(context),



          ],
          ),
        ],
      )   
    );    
  }

  Widget _cardconimagen(BuildContext context){
    final size = MediaQuery.of(context).size;

            return Center(
              child: Card(
                margin: EdgeInsets.all(20.0),
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                    child: Container(
                       width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: 260.0,
                    decoration: BoxDecoration(
                    image: DecorationImage (
                    fit: BoxFit.fill,
                    image: NetworkImage(
                    "https://miro.medium.com/max/2560/1*vgN2zojqiIYu23JPVuaSiA.jpeg"
      
                    )
                    )
                      
                    ),
                    ),
             )
            ],
          )
           )
          
        );   

        
    }
  Widget _cardexpansiontile(BuildContext context){
  return Center(
    child: Card(
      margin: EdgeInsets.all(20.0),
      shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ExpansionTile(
        leading: Icon(
          Icons.video_call,color: Colors.indigoAccent[700]),
        trailing:  Icon(Icons.add,color: Colors.indigoAccent[700],),      
        title: Text("Introducion al curso"),
        children: <Widget>[
              Text("Prueba de curso numero1")
        ],

              )
            ],
          ),
    
      ),
    );

  }
  Widget _cardexpansiontiletipo2(BuildContext context){
  return Center(
   
    child: Card(
      
     
      margin: EdgeInsets.all(20.0),
      elevation: 8,
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ExpansionTile(
        
        trailing:  Icon(Icons.add,color: Colors.indigoAccent[700],),   


        title: Text("Modulo 1"),
        subtitle: Text("Introducion al curso"),
        children: <Widget>[
          const ListTile(
          leading: Icon(Icons.video_call,color: Colors.indigoAccent,),
          //  Icon(Icons.album, size: 50),
          title: Text('Video de introducción'),
          subtitle: Text('subtitulo'),
          trailing: Icon(Icons.check_box_outline_blank, color: Colors.grey), 
          ),
          const ListTile(
          leading: Icon(Icons.video_call,color: Colors.indigoAccent,),
          //  Icon(Icons.album, size: 50),
          title: Text('Video de introducción'),
          subtitle: Text('subtitulo'),
          trailing: Icon(Icons.check_box, color: Colors.greenAccent), 
          ),
          const ListTile(
          leading: Icon(Icons.description, color: Colors.green),
          //  Icon(Icons.album, size: 50),
          title: Text('Esquema de certificacion aaaaaaaaaaaaaaa'),
          subtitle: Text('subtitulo'),
          trailing: Icon(Icons.check_box_outline_blank, color: Colors.grey), 
          ),
          const ListTile(
          leading: Icon(Icons.description, color: Colors.green),
          //  Icon(Icons.album, size: 50),
          title: Text('Esquema de certificacion aaaaaaaaaaaaaaa'),
          subtitle: Text('subtitulo'),
          trailing: Icon(Icons.check_box, color: Colors.greenAccent),  
          ),
              // Text("Prueba de curso numero1")


        ],

              )
            ],
          ),
    
      ),
    );

  }
  }