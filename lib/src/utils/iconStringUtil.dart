import 'package:flutter/material.dart';

final _icons =  <String, IconData>{

  'people' : Icons.people,

};

Icon getIcon ( String nombreIcono){

return Icon( _icons[nombreIcono], color: Colors.purple[400] );

}