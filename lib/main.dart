import 'package:apk_eureka/src/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:apk_eureka/src/routes/route.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:apk_eureka/src/bloc/provider.dart';



import 'package:apk_eureka/src/routes/route.dart';
 
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
        initialRoute: 'home',
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