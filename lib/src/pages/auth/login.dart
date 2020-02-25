// Llamados Dependencias
import 'package:flutter/material.dart';
// Llamados Paginas
import 'package:QuizLab/src/bloc/provider.dart';
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
        gradient: LinearGradient(
          colors: <Color>[
            Color.fromRGBO(190, 63, 156, 1.0),
            Color.fromRGBO(150, 70, 200, 1.0),
            // Color.fromRGBO(r, g, b, opacity)

          ])
      ),    
    );

    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(255, 255, 255, 0.05)
      ),
    );


       final logoEureka = Container(
         padding:  EdgeInsets.only(top: 80.0),
          width: 400.0,
          height: 400.0,
          child: Column(
            children: <Widget>[
              Image.asset('assets/EurekaLogo.png'),
              SizedBox(height: 0.0,width: double.infinity,),
              Text('Bienvenido a Eureka!',style:TextStyle(color: Colors.white,fontSize:20.0 ) ,)
              // Image(image: NetworkImage('https://www.tom-archer.com/wp-content/uploads/2018/06/milford-sound-night-fine-art-photography-new-zealand.jpg')),
              // DecoratedBox(decoration: BoxDecoration( image: DecorationImage(image: AssetImage('assets/robot-loading.gif'))))
            ],
          ),
        );

    return Stack(
      children: <Widget>[
        fondo,
        Positioned(top: 220.0,left: 10,child: circulo),
        Positioned(top: -40.0,left: 350,child: circulo),
        Positioned(top: 90.0,left: 175,child: circulo),
        Positioned(top: 400.0,left: 175,child: circulo),
        Positioned(top: 650.0,left: 350,child: circulo),
        logoEureka
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
                color: Colors.white,
                //  color: Color.fromRGBO(0, 0, 0, 0.3),
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.purple[400],
                    blurRadius: 3.0,
                    offset: Offset(0.0, 1.0),
                    spreadRadius: 1.0

                  )
                ]
              ),
              child: Column(
                children: <Widget>[
                  Text('Login',style: TextStyle(fontSize: 20.0),),
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
            Text('¿Olvido su contraseña?'),
            SizedBox(height: 100.0,)
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
            icon: Icon(Icons.alternate_email,color: Colors.purple[400]),
            hintText:  'ejemplo.certmind.org',
            labelText: 'Correo electrónico',
            counterText: snapshot.data,
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
            icon: Icon(Icons.lock_outline,color: Colors.purple[400]),
            labelText: 'Contraseña',
              counterText: snapshot.data,
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
            color: Colors.purple[400],
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