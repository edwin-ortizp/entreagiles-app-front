import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';


class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        children: <Widget>[
          topBar(),
          HomePageContent(),
        ],
      ),
    );
  }

  SizedBox topBar() {
    return SizedBox(
      height: 150,
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          PurpleBar(),
          CircleAvatar(),
        ],
      ),
    );
  }
}

class PurpleBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ControlledAnimation(
      duration: Duration(milliseconds: 600),
      tween: Tween<double>(begin: 0, end: 150),
      builder: (context, animation) {
        return Container(
          padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
          height: animation,
          width: double.infinity,
          color: Colors.purple[200],
          child: ListView( children: <Widget>[
            ListTile(
              title: new Center (
                child: Text('Alexander Ortiz',
                  style: TextStyle(color: Colors.white, fontSize: 30.0))),
                subtitle: new Center (child: Text('alexander@gesthor.org',
                  style: TextStyle(fontSize: 15.0))),
              ),
            ]
          ),
        );
      }
    );
  }
}

class CircleAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ControlledAnimation(
      duration: Duration(milliseconds: 600),
      delay: Duration(milliseconds: (300 * 2).round()),
      curve: Curves.elasticOut,
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, scaleValue) {
        return Positioned(
          top: 100,
          left: size.width / 2 - 50,
          child: Transform.scale(
            scale: scaleValue,
            alignment: Alignment.center,
            child: purpleCircle(),
          ),
        );
      },
    );
  }

  Widget purpleCircle() {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.purple[400],
        image: DecorationImage(
          image: AssetImage('assets/images/finn.jpg'),
          fit: BoxFit.cover,
        ),
        border: Border.all(
          width: 4,
          color: Colors.purple[400]
        ),
      ),
    );
  }
}

class HomePageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: <Widget>[
          largeWhitespace(),
          contentPlaceHolder(),
        ],
      ),
    );
  }

  Widget contentPlaceHolder() {
    return ControlledAnimation(
      duration: Duration(milliseconds: 600),
      delay: Duration(milliseconds: (300 * 3).round()),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, opacityValue) {
        return Opacity(
          opacity: opacityValue,
          child: Column(children: <Widget>[
          _nameField('Nombres'),
          smallWhitespace(),
          _nameField('Apellidos'),
          smallWhitespace(),
          _emailField(),
          smallWhitespace(),
          _phoneField(),
          smallWhitespace(),
          _saveButton()
          ]),
        );
      },
    );
  }

  Widget largeWhitespace() => SizedBox(height: 60);

  Widget smallWhitespace() => SizedBox(height: 8);

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

Widget _saveButton(){

  return RaisedButton.icon(
    onPressed: () {},
    icon: Icon(Icons.save, color: Colors.white,),
    color: Colors.purple[400],
    label: Text('Guardar', 
      style: TextStyle(
      fontSize: 20.0,
      color: Colors.white,),
    ),
    shape: RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(18.0),
),
  );

}