
import 'package:QuizLab/src/pages/settting/settings.dart';
import 'package:QuizLab/src/pages/user/userIndex.dart';
import 'package:QuizLab/src/utils/preferencesUser.dart';
import 'package:QuizLab/src/widgets/buttonBarBottom.dart';
import 'package:QuizLab/src/widgets/menuSiderbar.dart';
import 'package:flutter/material.dart';

import 'package:QuizLab/src/pages/auth/login.dart';
import 'package:QuizLab/src/providers/menuProvider.dart';
import 'package:QuizLab/src/utils/iconStringUtil.dart';

class HomePage extends StatelessWidget {
  final prefs = new PreferencesUser();
  // static final String routeName = 'home';
  @override
  Widget build(BuildContext context) {
    // prefs.ultimaPagina = HomePage.routeName;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Welcome ${prefs.nombre}',style:(prefs.colorSecundario) ? TextStyle(color: Colors.black):TextStyle(color: Colors.black)),
        // backgroundColor: Colors.purple[400],
        iconTheme:(prefs.colorSecundario) ? new IconThemeData(color: Colors.white): new IconThemeData(color: Colors.black),
        backgroundColor:(prefs.colorSecundario) ? Colors.purple[400] : Colors.white
      ),
      drawer: MenuSiderbar(),
      // body: _callPage(0),
      // bottomNavigationBar: _bottomNavigatioBar(context),
    );
  }

  Widget _lista() {

  // menuProvider.cargarData()
  return FutureBuilder(
    future: menuProvider.cargarData() ,
    initialData: [],
    builder: (context, AsyncSnapshot<List<dynamic>> snapshot){


      return ListView(
        children : _listaItems(snapshot.data,context),
      );
    },

    );

 }

  List<Widget>_listaItems(List<dynamic>data, BuildContext context) {

    final List<Widget> opciones = [];


    data.forEach((opt){

      final widgetTemp = ListTile(
        title: Text( opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.purple[400],),
        onTap: (){
          final route = MaterialPageRoute(
            builder: ( context )=> LoginPage()
            );

          Navigator.pushNamed(context, opt['ruta']);

        },
      );

    opciones..add( widgetTemp ) 
            ..add( Divider());
    });
    return opciones;
  }

  // Widget _callPage(int page){

  //   switch(page){

  //     // case 0: return HomePage();
  //     case 0: return HomePage();
  //     case 1: return UsersIndex();
  //     case 2: return SettingPage();
  //     default:
  //     return SettingPage();

  //   }

  // }

  // Widget _bottomNavigatioBar(context){

  //   return BottomNavigationBar(
  //       currentIndex: 0,
  //       onTap: (index){},
  //       items: [
  //          BottomNavigationBarItem(
  //           icon: Icon( Icons.home,size: 30.0,),
  //           title: Container(),
  //          ),
  //          BottomNavigationBarItem(
  //           icon: Icon( Icons.supervised_user_circle,size: 30.0,),
  //           title: Container(),
  //          ),
  //          BottomNavigationBarItem(
  //           icon: Icon( Icons.settings,size: 30.0,),
  //           title: Container(), 
  //          ),
  //         ],
  //      );


  // }

}