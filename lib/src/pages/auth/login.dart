// Llamados Dependencias
import 'dart:typed_data';

import 'package:QuizLab/src/utils/alerts.dart';
import 'package:QuizLab/src/utils/preferencesUser.dart';
import 'package:flutter/material.dart';
// Llamados Paginas
import 'package:QuizLab/src/validations/provider.dart';
import 'package:QuizLab/src/providers/userProvider.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usersProvider = new UsersProvider();

  final _prefs = new PreferencesUser();
  Future<void> _launched;

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      body: Stack(
        children: <Widget>[
          // SizedBox(height: 50,),
          _logo( context ),
          _loginForm( context ),
        ],
      )
    );
  }

  Widget  _logo(BuildContext context){

    final size = MediaQuery.of(context).size;

    final fondo = Container(
      height: size.height * 1,  
      width:  double.infinity,
      decoration: BoxDecoration(
        color: Colors.white
        // gradient: LinearGradient(
        //   colors: <Color>[
        //     Color.fromRGBO(190, 63, 156, 1.0),
        //     Color.fromRGBO(150, 70, 200, 1.0),
        //     // Color.fromRGBO(r, g, b, opacity)

        //   ])
      ),    
    );
       final register =GestureDetector(
            onTap: () => setState(() {
                    _launched = _launchInBrowser('https://quizlab.app/public/index.php/login');
                  }),
          child: Container(
         padding: EdgeInsets.only(top:20, left:size.height*0.25 ),
            child: Text('¿Nuevo usuario?')
            ),
      );

       final logoEureka = Container(
         padding:  EdgeInsets.symmetric(horizontal: 30.0,vertical: 60.0),
          height: size.height * 1,
          child: Column(
            children: <Widget>[
              // register,
              SizedBox(height: 80),
              Image.asset('assets/QuizLab-Logo.png'),
            ],
          ),
        );
    return Stack(
      children: <Widget>[
        fondo,
        Padding(padding:EdgeInsets.symmetric(vertical: 20.0)
         ),
        logoEureka
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
                height: size.height * 0.35,
              )
              ),
            Container(
              width:size.width *0.95 ,
              margin: EdgeInsets.symmetric(vertical: 50.0),
              padding: EdgeInsets.symmetric(vertical: 50.0),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: <Widget>[
                  // Text('Login',style: TextStyle(fontSize: 20.0),),
                  Text('Bienvenido a QuizLab',style:TextStyle(color: Colors.black,fontSize:20.0 ) ,),
                  SizedBox( height: 20.0,),
                  _emailInput(bloc),
                   SizedBox( height: 30.0,),
                  _passwordInput(bloc),
                  SizedBox( height: 30.0,),
                  _button(bloc)
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget _emailInput(LoginBloc bloc){

      return StreamBuilder(
      stream: bloc.emailStream,
      
        builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          padding:  EdgeInsets.symmetric(horizontal: 10.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              // icon: Icon(Icons.alternate_email,color: Colors.indigoAccent[700]),
              hintText:  'example.quizlab.org',
              labelText: 'Correo electrónico',
              suffixIcon: Icon(Icons.alternate_email,color: Colors.indigoAccent[700],),
              border:   OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            ),
          errorText: snapshot.error
          ),
          onChanged: bloc.changeEmail,
        ),
      );
    },
    );

    }

    Widget _passwordInput(LoginBloc bloc){

      return StreamBuilder(
        stream: bloc.passwordStream,
        builder: (BuildContext context, AsyncSnapshot snapshot){

      return Container(
        padding:  EdgeInsets.symmetric(horizontal: 10.0),
        child: TextField(
          obscureText: true,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            border:   OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            // icon: Icon(Icons.lock_outline,color: Colors.indigoAccent[700]),
            labelText: 'Contraseña',
            suffixIcon: Icon(Icons.lock_outline,color: Colors.indigoAccent[700],),
            errorText: snapshot.error
          ),
           onChanged: bloc.changePassword,
        ),
      );
      },
    );

    }

    Widget _button(LoginBloc bloc){
      


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
            color: Colors.indigoAccent[700],
            textColor: Colors.white,
            onPressed: snapshot.hasData ? ()=> _login(bloc, context) : null
          );
        },
        );
    }

     _login(LoginBloc bloc, BuildContext context) async {

      Map info = await usersProvider.login(bloc.email, bloc.password);

      if( info['ok']){
        Navigator.pushReplacementNamed(context, 'buttonBarBottom');
      }else{
        alertLogin( context, info['mensaje'] );
      }



    // print('================');
    // print('Email: ${ bloc.email }');
    // print('Password: ${ bloc.password }');
    // print('================');

    // (_prefs.token) ? Navigator.pushReplacementNamed(context, 'home'):Navigator.pushReplacementNamed(context, 'login');

  }

     Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}