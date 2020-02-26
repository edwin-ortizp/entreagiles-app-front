// Llamados Dependencias
import 'dart:typed_data';

import 'package:flutter/material.dart';
// Llamados Paginas
import 'package:QuizLab/src/validations/provider.dart';
import 'package:QuizLab/src/providers/userProvider.dart';

class LoginPage extends StatelessWidget {

  final usersProvider = new UsersProvider();

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      body: Stack(
        children: <Widget>[
          _crearFondo( context ),
          _loginForm( context ),
        ],
      )
    );
  }


  Widget  _crearFondo(BuildContext context){

    final size = MediaQuery.of(context).size;

    final fondo = Container(
      height: size.height * 0.4,  
      width:  double.infinity,
      decoration: BoxDecoration(
        // gradient: LinearGradient(
        //   colors: <Color>[
        //     Color.fromRGBO(190, 63, 156, 1.0),
        //     Color.fromRGBO(150, 70, 200, 1.0),
        //     // Color.fromRGBO(r, g, b, opacity)

        //   ])
      ),    
    );


       final logoEureka = Container(
         padding:  EdgeInsets.only(top: 80.0,left: 55.0),
          width: 350.0,
          height: 350.0,
          child: Column(
            children: <Widget>[
              // Text('¿Olvido su contraseña?'),
              Image.asset('assets/QuizLab-Logo.png'),
              SizedBox(height: 25.0,width: double.infinity,),
              Text('Bienvenido a QuizLab',style:TextStyle(color: Colors.black,fontSize:20.0 ) ,)
              // Image(image: NetworkImage('https://www.tom-archer.com/wp-content/uploads/2018/06/milford-sound-night-fine-art-photography-new-zealand.jpg')),
              // DecoratedBox(decoration: BoxDecoration( image: DecorationImage(image: AssetImage('assets/robot-loading.gif'))))
            ],
          ),
        );

    return Stack(
      children: <Widget>[
        fondo,
        Positioned(top: 80.0,left: 220,child: Text('¿Olvido su contraseña?'),),
        Positioned(top: 50.0,left: 0,child: logoEureka),
        // logoEureka
        // logoEureka
        // Positioned(top: 90.0,left: 15.0,child: logoEureka),
        // Positioned(top: 90.0,left: 175,child: ),
      
      ],
    );
  }


    Widget _loginForm(BuildContext context){

      final bloc = Provider.of(context);
      final size = MediaQuery.of(context).size;
      return SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SafeArea(
              child: Container(
                height: 190.0,
              )
              ),
            Container(
              width:size.width *0.85 ,
              margin: EdgeInsets.symmetric(vertical: 50.0),
              padding: EdgeInsets.symmetric(vertical: 50.0),
              decoration: BoxDecoration(
                // color: Colors.white,
                //  color: Color.fromRGBO(0, 0, 0, 0.3),
                borderRadius: BorderRadius.circular(20.0),
                // boxShadow: <BoxShadow>[
                //   BoxShadow(
                //     color: Colors.purple[400],
                //     blurRadius: 3.0,
                //     offset: Offset(0.0, 1.0),
                //     spreadRadius: 1.0

                //   )
                // ]
              ),
              child: Column(
                children: <Widget>[
                  // Text('Login',style: TextStyle(fontSize: 20.0),),
                  SizedBox( height: 20.0,),
                  _crearEmail(bloc),
                   SizedBox( height: 40.0,),
                  _crearpassword(bloc),
                  SizedBox( height: 30.0,),
                  _crearBoton(bloc)
                ],
              ),
            ),
            // Positioned(top: 650.0,left: 350,child: circulo),
            
            // SizedBox(height: 100.0,)
          ],
        ),
      );
    }

    Widget _crearEmail(LoginBloc bloc){

      return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){

      return Container(
        padding:  EdgeInsets.symmetric(horizontal: 10.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon(Icons.alternate_email,color: Colors.indigo[700]),
            hintText:  'ejemplo.certmind.org',
            labelText: 'Correo electrónico',
            errorText: snapshot.error
          ),
          onChanged: bloc.changeEmail,
        ),
      );

       },
    );

    }


    Widget _crearpassword(LoginBloc bloc){

      return StreamBuilder(
        stream: bloc.passwordStream,
        builder: (BuildContext context, AsyncSnapshot snapshot){

      return Container(
        padding:  EdgeInsets.symmetric(horizontal: 10.0),
        child: TextField(
          obscureText: true,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon(Icons.lock_outline,color: Colors.indigo[700]),
            labelText: 'Contraseña',
              errorText: snapshot.error
          ),
           onChanged: bloc.changePassword,
        ),
      );
      },
    );

    }

    Widget _crearBoton(LoginBloc bloc){
      


      return StreamBuilder(
        stream: bloc.formValidStream,
        builder: (BuildContext context, AsyncSnapshot snapshot){    
          return RaisedButton(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 80.0,vertical: 15.0),
              child: Text('Ingresar'),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 0.0,
            color: Colors.indigo[700],
            textColor: Colors.white,
            onPressed: snapshot.hasData ? ()=> _login(bloc, context) : null
          );
        },
        );
    }

     _login(LoginBloc bloc, BuildContext context) {

    usersProvider.login(bloc.email, bloc.password);

    // print('================');
    // print('Email: ${ bloc.email }');
    // print('Password: ${ bloc.password }');
    // print('================');

    // Navigator.pushReplacementNamed(context, 'home');

  }

}