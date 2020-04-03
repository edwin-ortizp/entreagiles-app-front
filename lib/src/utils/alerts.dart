import 'package:flutter/material.dart';

void alertLogin(BuildContext context, String mesaje ){

  showDialog(
    context: context,
    builder: ( context){
      return AlertDialog(
          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          title:  Text('Información incorrecta'),
          content:  Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // FlutterLogo(size: 100.0,),
              SizedBox(height: 30.0),
              FadeInImage(
                image: NetworkImage('assets/cat-loading.gif'),
                placeholder:AssetImage('assets/robot-loading.gif') ,
                fadeInDuration: Duration(milliseconds: 200),
                height: 100.0,
                fit: BoxFit.cover,
                ),
                SizedBox(height: 20,),
              Text(mesaje),
            ],
          ),
          actions: <Widget>[
            
            FlatButton(onPressed: () {Navigator.of(context).pop();}, child: Text('OK'),textColor: Colors.indigoAccent[700],)
          ],
        );
       }
      );
}
void alertInterner(BuildContext context ){

  showDialog(
    context: context,
    builder: ( context){
      return AlertDialog(
          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          title:  Text('Información incorrecta'),
          content:  Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // FlutterLogo(size: 100.0,),
              SizedBox(height: 30.0),
              FadeInImage(
                image: NetworkImage('assets/cat-loading.gif'),
                placeholder:AssetImage('assets/robot-loading.gif') ,
                fadeInDuration: Duration(milliseconds: 200),
                height: 100.0,
                fit: BoxFit.cover,
                ),
                SizedBox(height: 20,),
              Text('no interne'),
            ],
          ),
          actions: <Widget>[
            
            FlatButton(onPressed: () {Navigator.of(context).pop();}, child: Text('OK'),textColor: Colors.indigoAccent[700],)
          ],
        );
       }
      );
}


// AlertDialog(
//         title: Text('Información incorrecta'),
//         content: Text(mesaje),
//         actions: <Widget>[
//           FlatButton(onPressed: () => Navigator.of(context).pop(), child: Text('Ok'))
//         ],
//       );
//     }
//     );