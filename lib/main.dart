import 'package:QuizLab/src/utils/preferencesUser.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:QuizLab/src/routes/route.dart';
import 'package:QuizLab/src/pages/home.dart';
import 'package:QuizLab/src/validations/provider.dart';



// import 'package:QuizLab/src/routes/route.dart';
 
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
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

        // para declara la pagina   de inicio de la apk
        // initialRoute: 'buttonBarBottom',
        initialRoute: prefs.ultimaPagina,
        // Rutas de la aplicacion
        routes:getApplicationRoutes(),
        onGenerateRoute: ( RouteSettings  settings ){

          print('ruta llamada: ${settings.name}');

          return MaterialPageRoute(
            builder: (BuildContext context) => HomePage());

        },
        theme: ThemeData(
          primaryColor: Colors.indigoAccent[700],
        ),
      ),
    );
  }
}