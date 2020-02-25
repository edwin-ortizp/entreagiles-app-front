import 'package:flutter/material.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:QuizLab/src/routes/route.dart';
import 'package:QuizLab/src/pages/home.dart';
import 'package:QuizLab/src/validations/provider.dart';



import 'package:QuizLab/src/routes/route.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Provider(
      child: MaterialApp(
        title: 'Componetes Flutter',
        debugShowCheckedModeBanner: false,
        // localizationsDelegates: [
        //   // ... app-specific localization delegate[s] here
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate,
        //   GlobalCupertinoLocalizations.delegate,
        // ],
        // supportedLocales: [
        //   const Locale('es'), // English
        // ],
        // home: HomePage()
        initialRoute: 'login',
        // Rutas de la aplicacion
        routes:getApplicationRoutes(),
        onGenerateRoute: ( RouteSettings  settings ){

          print('ruta llamada: ${settings.name}');

          return MaterialPageRoute(
            builder: (BuildContext context) => HomePage());

        },
        theme: ThemeData(
          primaryColor: Colors.purple[400],
        ),
      ),
    );
  }
}