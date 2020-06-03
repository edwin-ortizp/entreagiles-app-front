import 'package:QuizLab/src/utils/preferencesUser.dart';
import 'package:QuizLab/src/widgets/buttonBarBottom.dart';
import 'package:flutter/material.dart';

// import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:QuizLab/src/routes/route.dart';
import 'package:QuizLab/src/validations/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';



// import 'package:QuizLab/src/routes/route.dart';
 
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //  ConnectionStatusSingleton connectionStatus = ConnectionStatusSingleton.getInstance();
        // connectionStatus.initialize();
  final prefs = new PreferencesUser();
  
  await prefs.intPrefs();
  runApp(MyApp());
} 
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prefs = new PreferencesUser();
    return Provider(
      child: MaterialApp(
        title: 'QuizLab',
        // theme: ThemeData(fontFamily: 'TTFirs'),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          // ... app-specific localization delegate[s] here
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('es'), // English
        ],
        // para declara la pagina   de inicio de la apk
        // initialRoute: 'login',
        initialRoute: (prefs.ultimaPagina != null) ? prefs.ultimaPagina : 'login',
        // Rutas de la aplicacion
        routes:getApplicationRoutes(),
        onGenerateRoute: ( RouteSettings  settings ){

          print('ruta llamada: ${settings.name}');

          return MaterialPageRoute(
            builder: (BuildContext context) => ButtonBarBottom());

        },
        theme: ThemeData(
          primarySwatch:(prefs.colorSecundario)? Colors.grey :Colors.grey,fontFamily: 'TTFirs',
        ),
      ),
    );
  }
}