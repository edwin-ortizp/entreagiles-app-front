import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget{
  @override 
  _EditScreenState createState() => new _EditScreenState();
}

class _EditScreenState extends State<EditProfileScreen> {
  @override 
  Widget build(BuildContext context){
    return new Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        child: Column(children: <Widget>[
          _nameField('Nombres'),
          Divider(),
          _nameField('Apellidos'),
          Divider(),
          _emailField(),
          Divider(),
          _phoneField()
        ],)
      ),
    );
  }
    
}

Widget _nameField(String data){
  return TextField(
      // autofocus: true, es para activar  al entrar el texto
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        border:   OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        hintText: '$data',
        helperText: '$data',
        suffixIcon: Icon(Icons.text_fields,color: Colors.purple[400],),
        icon: Icon(Icons.account_circle,color: Colors.purple[400])
      ),
      // onChanged: (valor) => setState(() {
      //   _email = valor;
      //   })
    );

}

Widget _emailField() {
    
      return TextField(
      // autofocus: true, es para activar  al entrar el texto
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border:   OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        hintText: 'Email',
        helperText: 'Email',
        suffixIcon: Icon(Icons.alternate_email,color: Colors.purple[400],),
        icon: Icon(Icons.email,color: Colors.purple[400])
      ),
      // onChanged: (valor) =>setState(() {
      //   _email = valor;
      //   })
    );
  }

Widget _phoneField() {
    
      return TextField(
      // autofocus: true, es para activar  al entrar el texto
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        border:   OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        hintText: 'Telefono',
        helperText: 'Telefono',
        suffixIcon: Icon(Icons.phonelink_setup,color: Colors.purple[400],),
        icon: Icon(Icons.phone_iphone,color: Colors.purple[400])
      ),
      // onChanged: (valor) =>setState(() {
      //   _email = valor;
      //   })
    );
  }