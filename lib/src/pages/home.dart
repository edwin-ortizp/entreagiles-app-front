
import 'package:QuizLab/src/models/Course.dart';
import 'package:QuizLab/src/pages/settting/settings.dart';
import 'package:QuizLab/src/pages/user/userIndex.dart';
import 'package:QuizLab/src/providers/courseProvider.dart';
import 'package:QuizLab/src/utils/preferencesUser.dart';
import 'package:QuizLab/src/widgets/buttonBarBottom.dart';
import 'package:QuizLab/src/widgets/menuSiderbar.dart';
import 'package:flutter/material.dart';

import 'package:QuizLab/src/pages/auth/login.dart';
import 'package:QuizLab/src/providers/menuProvider.dart';
import 'package:QuizLab/src/utils/iconStringUtil.dart';

class HomePage extends StatelessWidget {
  final prefs = new PreferencesUser();
  final coursesProvider = new CourseProvider();
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 30,),
          //  _crearListado(),
            _cardUser(),
            _colum1(),
            Container(
              padding: EdgeInsets.only(left: 20.0),
              child: Text('Mis Cursos',style: Theme.of(context).textTheme.subhead,)
            ),
            SizedBox(height: 15.0,),
            _myCoursesLoad(),
            Container(
              padding: EdgeInsets.only(left: 20.0),
              child: Text('Todos los cursos',style: Theme.of(context).textTheme.subhead,)
            ),
            SizedBox(height: 15.0,),
            _allCoursesLoad(),
          ],
        ),
      ),
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
  Widget _colum1 (){



    return Table(

      children: [
        TableRow(
          children: [
            _cards(),
            _cards2()
            // _cards(),
            // _cards(),
          ]
        ),
        // TableRow(
        //   children: [
        //     _cards(),
        //     // _cards(),
        //     // _cards(),
        //   ]
        // )
      ],

    );

  }


  Widget _cards(){

    return Container(
      height: 100.0,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        // color:Color.fromRGBO(37,37,233,0.59),
        gradient: LinearGradient(
          colors: [Colors.indigoAccent[700],Colors.purple[400]]
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(height: 5.0,),
          Text('Tu Ranking',style: TextStyle(color: Colors.white),),
          Text('# 015454545',style: TextStyle(color: Colors.white,fontSize: 25),),
          SizedBox(height: 5.0,)
        ],
      ),
    );

  }

  Widget _cards2(){

    return Container(
      height: 100.0,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        // color:Color.fromRGBO(0,143,7,0.5),
        gradient: LinearGradient(
          colors: [Colors.greenAccent[700],Colors.green[100]]
          ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(height: 5.0,),
          Text('Eurocoins',style: TextStyle(color: Colors.white),),
          Text('5.4545',style: TextStyle(color: Colors.white,fontSize: 25),),
          SizedBox(height: 5.0,)
        ],
      ),
    );

  }

  Widget _cardNull(){

        return Column(
      children: <Widget>[
        Card(
      elevation: 10.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children:<Widget>[
           ListTile(
             leading: Icon(Icons.photo_album,color:Colors.purple[400]) ,
             title: Text('Titulo De la card'),
              subtitle: Text('Esto es un texto para ver como se ve la card'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                onPressed: (){},
                 child: Text('Cancelar')
                 ),
              FlatButton(
                onPressed: (){},
                 child: Text('OK')
                 )
            ],
            )
        ]
      )
    )
      ],
    );

  }
  Widget _cardUser(){

    return Column(
      children: <Widget>[
        Card(
          margin: EdgeInsets.symmetric(horizontal: 15.0),
          elevation: 10.5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Row(
        
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(5.0),
                // child: Text('shadisyai'),
              ),
              CircleAvatar(backgroundImage: NetworkImage('https://picsum.photos/200/300?random=1'),
              ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text('Kewin erikson calderon montano',style: TextStyle(fontSize: 15.0,color: Colors.black54),
                  ),
              ),
            ],
          ),
        )
      ],
    );

  }




  Widget _myCoursesLoad(){

    return FutureBuilder(
      future: coursesProvider.courseForUser(),
      builder: (BuildContext context, AsyncSnapshot<List<CourseModel>> snapshot) {

          
        if(snapshot.hasData){
          final myCourses = snapshot.data;
          return Container(
            height: 190.2,
            child: PageView.builder(
              pageSnapping: false,
              controller: PageController(
                initialPage:1,
                viewportFraction: 0.3,
              ),
            itemCount: myCourses.length,
            itemBuilder: (context, i) => _myCourses(context,myCourses[i]),
            ),
          );
        }else{

        return Center(
          child: CircularProgressIndicator(),
        );
        }
      // return Container();
      },
    );

  }


  Widget _allCoursesLoad(){

    return FutureBuilder(
      future: coursesProvider.allCourse(),
      builder: (BuildContext context, AsyncSnapshot<List<CourseModel>> snapshot) {

          
        if(snapshot.hasData){
          final myCourses = snapshot.data;
          return Container(
            height: 190.2,
            child: PageView.builder(
              pageSnapping: false,
              controller: PageController(
                initialPage:1,
                viewportFraction: 0.3,
              ),
            itemCount: myCourses.length,
            itemBuilder: (context, i) => _myCourses(context,myCourses[i]),
            ),
          );
        }else{

        return Center(
          child: CircularProgressIndicator(),
        );
        }
      // return Container();
      },
    );

  }



  Widget _myCourses(BuildContext context, CourseModel course){
  // Widget _myCourses(BuildContext context, CourseModel myCourse){
    // return myCourses{
    // }
      
  // return Container(
  //   margin: EdgeInsets.only(right: 15.0),
  //   child: Column(
  //     children: <Widget>[
  //       Padding(
  //               padding: const EdgeInsets.all(20.0),
  //               child: Text('${course.id}'),
  //             ),
  //             CircleAvatar(backgroundImage: NetworkImage('https://picsum.photos/200/300?random=${course.id}'),
  //             ),
  //               Padding(
  //                 padding: const EdgeInsets.all(10.0),
  //                 child: Text('${course.name} ',style: TextStyle(fontSize: 15.0,color: Colors.black54),
  //                 ),
  //             ),
  //     ],
  //   ),
  // );
  return Container(
    margin: EdgeInsets.only(right: 15.0),
    child: Column(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: FadeInImage(
            placeholder: AssetImage('assets/cat-loading.gif'),
          // , image: NetworkImage('https://novapixel.org/eureka/imgs/courses/$course.name.jpg'),
          image: NetworkImage('https://picsum.photos/200/300?random=${course.id}'),
          fit: BoxFit.cover,
          // width: 100.0,
          height: 120.0,
          ),
        ),
        SizedBox(height: 5.0,),
        Text(
          course.name,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.caption,
        )
      ],
    ),
  );
    
    
    
  //   return Dismissible(
  //       key: UniqueKey(),
  //       background: Container(
  //         color: Colors.red,
  //       ),
  //       child: Card(
  //       child: GestureDetector(
  //         child: Row(
  //           children: <Widget>[
  //             Padding(
  //               padding: const EdgeInsets.all(20.0),
  //               child: Text('${myCourse.id}'),
  //             ),
  //             CircleAvatar(backgroundImage: NetworkImage('https://picsum.photos/200/300?random=${myCourse.id}'),
  //             ),
  //               Padding(
  //                 padding: const EdgeInsets.all(10.0),
  //                 child: Text('${myCourse.name} ',style: TextStyle(fontSize: 15.0,color: Colors.black54),
  //                 ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  }



}