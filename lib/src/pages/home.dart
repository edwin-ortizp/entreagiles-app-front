import 'dart:async';
import 'dart:ui';

import 'package:QuizLab/src/models/Course.dart';
import 'package:QuizLab/src/providers/conex_provider.dart';
import 'package:QuizLab/src/providers/courseProvider.dart';
import 'package:QuizLab/src/utils/courses_bloc.dart';
import 'package:QuizLab/src/utils/preferencesUser.dart';
import 'package:QuizLab/src/validations/provider.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

import 'package:QuizLab/src/pages/auth/login.dart';
import 'package:QuizLab/src/providers/menuProvider.dart';
import 'package:QuizLab/src/utils/iconStringUtil.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
  // final Function nextAllCourses;
}

class _HomePageState extends State<HomePage> {
  final prefs = new PreferencesUser();

  final coursesProvider = new CourseProvider();
  final _pageController = new PageController(
    initialPage: 1,
    viewportFraction: 0.3
    );

    bool isButtonDisabled;

 Future<void> _launched;
   @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if(prefs.myCourses == null){
    Timer.run((){
     _preLoading(context);
    });
    }
  
    var  mycoursesMicrolearning=  coursesProvider.courseForUserMicrolearning();
    _myCoursesLoad();
    _myCoursesMicrolearning();
    // });
  var myCourses = prefs.myCourses;
  }

  @override
  Widget build(BuildContext context) {
  var  mycourses=  coursesProvider.courseForUser();
  var  mycoursesMicrolearning=  coursesProvider.courseForUserMicrolearning();
  var  mycoursesSimulators=  coursesProvider.courseForUserSimulators();
    final myCoursesBloc = Provider.myCoursesBloc(context);
    // myCoursesBloc.cargarCurso();
    // coursesProvider.missingCourses();
    coursesProvider.courseForUser();
    // Se utilizan para poder activar la funcion del course
  // print("no cursos ${nocourses}");
    print("${prefs.myCourses}");
    // prefs.ultimaPagina = HomePage.routeName;
    return Scaffold(
      backgroundColor: (prefs.colorSecundario)? Colors.grey[850] :Color(0xFFEFEEEE),
      appBar: AppBar(
      bottomOpacity: 0.0,
      elevation: 0.0,
          centerTitle: true,
          // title: Text('Welcome ${prefs.nombre}',
          //     style: (prefs.colorSecundario)
          //         ? TextStyle(color: Colors.white)
          //         : TextStyle(color: Colors.black)),
          title:(prefs.colorSecundario) ? Image.asset('assets/logo-blanco.png',fit: BoxFit.cover,height: 42,):Image.asset('assets/QuizLab-Logo.png',fit: BoxFit.cover,height: 32),
          // backgroundColor: Colors.purple[400],
          iconTheme: (prefs.colorSecundario)
              ? new IconThemeData(color: Colors.white)
              : new IconThemeData(color: Colors.black),
          backgroundColor:
              (prefs.colorSecundario) ? Colors.grey[850] : Color(0xFFEFEEEE)
            
          ),

      // drawer: MenuSiderbar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            // Se cargar los widgets necesarios en el body 
            _cardUser(),
            SizedBox(height: 15.0,),
            _colum1(),
            (prefs.myCourses == true )? _carouselHead("Tus Cursos Virtuales", Colors.indigoAccent[700], Colors.orange,context, 'myCourses'):(prefs.myCourses == null )?Text(''):Text(''),
            SizedBox(height: 15.0,),
            (prefs.myCourses  == true)?_myCoursesLoad():(prefs.myCourses == null )?Text(''):_cardNull(),SizedBox(height: 15.0,),
            (prefs.mycoursesMicrolearning == true )?_carouselHead("Tus Cursos de Microlearning", Colors.purpleAccent[700],Colors.orange, context, 'myCoursesMicrolearning'):(prefs.mycoursesMicrolearning == null )?Text(''):Text(''),
            SizedBox(height: 15.0,),
            (prefs.mycoursesMicrolearning  == true)?_myCoursesMicrolearning():(prefs.mycoursesSimulators == null )?Text(''):_allCourses(),
            (prefs.mycoursesSimulators == true )?_carouselHead("Tus Simuladores", Colors.purpleAccent[700],Colors.orange, context, 'mySimulators'):(prefs.mycoursesSimulators == null )?Text(''):Text(''),
            SizedBox(height: 15.0,),
            (prefs.mycoursesSimulators  == true)?_myCoursesSimulators():(prefs.mycoursesSimulators == null )?Text(''):Text(''),
          ],
        ),
      ),
    );
  }

  Widget _lista() {
    // menuProvider.cargarData()
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listaItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];

    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.purple[400],
        ),
        onTap: () {
          final route = MaterialPageRoute(builder: (context) => LoginPage());

          Navigator.pushNamed(context, opt['ruta']);
        },
      );

      opciones..add(widgetTemp)..add(Divider());
    });
    return opciones;
  }

  Widget _colum1() {
    return Table(
      children: [
        TableRow(children: [
          _cardRanking(),
          _cardCoins(),
        ]),
      ],
    );
  }

  Widget _cardRanking() {
    return Container(
      height: 100.0,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        boxShadow: [
                  BoxShadow(
                    color: (prefs.colorSecundario) ? Colors.grey[800] :Colors.white.withOpacity(0.8),
                    offset: (prefs.colorSecundario) ? Offset (-0.5,-0.5) : Offset(-6.0, -6.0),
                    blurRadius:(prefs.colorSecundario) ? 1.0 : 16.0,
                    spreadRadius: (prefs.colorSecundario)  ? 1.0 : 0.0,
                  ),
                  BoxShadow(
                    color: (prefs.colorSecundario) ? Colors.grey[900] : Colors.black.withOpacity(0.1),
                    offset: (prefs.colorSecundario) ? Offset(2.0, 2.0) : Offset(6.0, 6.0),
                    blurRadius: (prefs.colorSecundario) ? 1.0 : 16.0,
                    spreadRadius: (prefs.colorSecundario)  ? 1.0 : 0.0,
                  ),
                ],
                color: (prefs.colorSecundario) ? Colors.grey[850] : Color(0xFFEFEEEE),
                borderRadius: BorderRadius.circular(20.0),
        // gradient: LinearGradient(
        //     colors: [Colors.indigoAccent[700], Colors.purple[400]]),
        // borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(height: 5.0,),
          Text('Tu Ranking',style: TextStyle(color:(prefs.colorSecundario) ? Colors.grey : Colors.black45),),
          Text('# 0',style: TextStyle(color:(prefs.colorSecundario) ? Colors.grey : Colors.black45, fontSize: 25),),
          SizedBox(height: 5.0,)
        ],
      ),
    );
  }

  Widget _cardCoins() {
    return Container(
      height: 100.0,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
         boxShadow: [
              BoxShadow(
                color: (prefs.colorSecundario) ? Colors.grey[800] :Colors.white.withOpacity(0.8),
                offset: (prefs.colorSecundario) ? Offset (-0.5,-0.5) : Offset(-6.0, -6.0),
                blurRadius:(prefs.colorSecundario) ? 1.0 : 16.0,
                spreadRadius: (prefs.colorSecundario)  ? 1.0 : 0.0,
              ),
              BoxShadow(
                color: (prefs.colorSecundario) ? Colors.grey[900] : Colors.black.withOpacity(0.1),
                offset: (prefs.colorSecundario) ? Offset(2.0, 2.0) : Offset(6.0, 6.0),
                blurRadius: (prefs.colorSecundario) ? 1.0 : 16.0,
                spreadRadius: (prefs.colorSecundario)  ? 1.0 : 0.0,
              ),
            ],
            color: (prefs.colorSecundario) ? Colors.grey[850] : Color(0xFFEFEEEE),
            borderRadius: BorderRadius.circular(20.0),
        // gradient: LinearGradient(
        //     colors: [Colors.greenAccent[700], Colors.green[100]]),
        // borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(height: 5.0,),
          Text('Créditos',style: TextStyle(color:(prefs.colorSecundario) ? Colors.grey : Colors.black45),),
          Text('0',style: TextStyle(color:(prefs.colorSecundario) ? Colors.grey : Colors.black45, fontSize: 25),),
          SizedBox(height: 5.0)
        ],
      ),
    );
  }

  Widget _cardNull() {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 35.0),
          decoration: BoxDecoration(

            boxShadow: [
              BoxShadow(
                color: (prefs.colorSecundario) ? Colors.grey[800] :Colors.white.withOpacity(0.8),
                offset: (prefs.colorSecundario) ? Offset (-0.5,-0.5) : Offset(-6.0, -6.0),
                blurRadius:(prefs.colorSecundario) ? 1.0 : 16.0,
                spreadRadius: (prefs.colorSecundario)  ? 1.0 : 0.0,
              ),
              BoxShadow(
                color: (prefs.colorSecundario) ? Colors.grey[900] : Colors.black.withOpacity(0.1),
                offset: (prefs.colorSecundario) ? Offset(2.0, 2.0) : Offset(6.0, 6.0),
                blurRadius: (prefs.colorSecundario) ? 1.0 : 16.0,
                spreadRadius: (prefs.colorSecundario)  ? 1.0 : 0.0,
              ),
            ],

          color: (prefs.colorSecundario) ? Colors.grey[850] : Color(0xFFEFEEEE),
          borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(children: <Widget>[
              ListTile(
                leading: Icon(Icons.do_not_disturb_alt, color:(prefs.colorSecundario) ?  Colors.grey:Colors.black45),
                title: Text('No tienes ningún curso matriculado !!',style:(prefs.colorSecundario) ? TextStyle(color: Colors.grey):TextStyle(color: Colors.black)),
                subtitle: Text('Por favor contacta al proveedor de cursos',style:(prefs.colorSecundario) ? TextStyle(color: Colors.grey):TextStyle(color: Colors.black54)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  // FlatButton(onPressed: () {}, child: Text('Cancelar')),
                //   FlatButton(
                //     onPressed: () => setState(() {
                //      _launched = _launchInBrowser('http://quizlab.app/');
                // }),
                //      child: Text('ir'))
                SizedBox(height: 15,)
                ],
              )
            ])
            )
      ],
    );
  }

  Widget _allCourses(){
      return Center(

    child: Text("No tienes ningun curso Microlearning",
        style: TextStyle(
            color:(prefs.colorSecundario) ?  Colors.grey:Colors.indigoAccent[700],
            fontSize: 15,
            fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
        maxLines: 3,),
  );
  }

  Widget _cardUser() {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15.0),
          // elevation: 10.5,
          // shape:
          //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: (prefs.colorSecundario) ? Colors.grey[800] :Colors.white.withOpacity(0.8),
                offset: (prefs.colorSecundario) ? Offset (-0.5,-0.5) : Offset(-6.0, -6.0),
                blurRadius:(prefs.colorSecundario) ? 1.0 : 16.0,
                spreadRadius: (prefs.colorSecundario)  ? 1.0 : 0.0,
              ),
              BoxShadow(
                color: (prefs.colorSecundario) ? Colors.grey[900] : Colors.black.withOpacity(0.1),
                offset: (prefs.colorSecundario) ? Offset(2.0, 2.0) : Offset(6.0, 6.0),
                blurRadius: (prefs.colorSecundario) ? 1.0 : 16.0,
                spreadRadius: 1.0
              ),
            ],
            color: (prefs.colorSecundario) ? Colors.grey[850] : Color(0xFFEFEEEE),
            borderRadius: BorderRadius.circular(20.0),
  ),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(5.0),
              ),
              CircleAvatar(
                backgroundImage:
                    // NetworkImage('https://picsum.photos/200/300?random=1'),
                    AssetImage('assets/user.png'),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                  child: Text(
                   (prefs.userFistname == null)? 'Te damos la bienvenida a QuizLab!': '${prefs.userFistname} ${prefs.userLastname}',
                    style: TextStyle(fontSize: 15.0, color:(prefs.colorSecundario) ? Colors.grey : Colors.black54),
                  ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _myCoursesLoad() {
    return FutureBuilder(
      future: coursesProvider.courseForUser(),
      builder:
          (BuildContext context, AsyncSnapshot<List<CourseModel>> snapshot) {
        if (snapshot.hasData) {
          final myCourses = snapshot.data;
          print(myCourses.length);

          return Container(
            height: 150.2,
            child: PageView.builder(
              pageSnapping: false,
              controller: PageController(
                initialPage: 1,
                viewportFraction: 0.3,
              ),
              itemCount: myCourses.length,
              itemBuilder: (context, i) => _courses(context, myCourses[i]),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  // Widget _allCoursesLoad() {
  //   return StreamBuilder(
  //     stream: coursesProvider.allCoursesStream,
  //     builder:
  //         (BuildContext context, AsyncSnapshot<List<CourseModel>> snapshot) {
  //       if (snapshot.hasData) {
  //         final allCourses = snapshot.data;
  //         nextAllCourses: coursesProvider.missingCourses;
  //         _pageController.addListener((){
  //           if (_pageController.position.pixels >= _pageController.position.maxScrollExtent - 200){
  //           nextAllCourses();
  //                       }
  //                     });
  //                     return Container(
  //                       height: 150.2,
  //                       child: PageView.builder(
  //                         pageSnapping: true,
  //                         // reverse:true,
  //                         // physics:ScrollPhysics(),
  //                         // controller: PageController(
  //                         //   initialPage: 3,
  //                         //   viewportFraction: 0.3,
  //                         // ),
  //                         controller: _pageController,
  //                         itemCount: allCourses.length,
  //                         itemBuilder: (context, i) => _courses(context, allCourses[i]),
  //                       ),
  //                     );
  //                   } else {
  //                     return Center(
  //                       child: CircularProgressIndicator(),
  //                     );
  //                   }
  //                 },
  //               );
  //             }
  Widget _myCoursesMicrolearning() {
    return StreamBuilder(
      stream: coursesProvider.myCoursesMicrolearningStream,
      builder:
          (BuildContext context, AsyncSnapshot<List<CourseModel>> snapshot) {
        if (snapshot.hasData) {
          final allCourses = snapshot.data;
          nextAllCourses: coursesProvider.courseForUserMicrolearning;
          // _pageController.addListener((){
          //   if (_pageController.position.pixels >= _pageController.position.maxScrollExtent - 200){
          //   nextAllCourses();
          //               }
          //             });
                      return Container(
                        height: 150.2,
                        child: PageView.builder(
                          pageSnapping: true,
                          // reverse:true,
                          // physics:ScrollPhysics(),
                          // controller: PageController(
                          //   initialPage: 3,
                          //   viewportFraction: 0.3,
                          // ),
                          controller: _pageController,
                          itemCount: allCourses.length,
                          itemBuilder: (context, i) => _courses(context, allCourses[i]),
                        ),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                );
              }
  Widget _myCoursesSimulators() {
    return StreamBuilder(
      stream: coursesProvider.myCoursesSimulatorsStream,
      builder:
          (BuildContext context, AsyncSnapshot<List<CourseModel>> snapshot) {
        if (snapshot.hasData) {
          final allCourses = snapshot.data;
          nextAllCourses: coursesProvider.courseForUserSimulators;
          // _pageController.addListener((){
            // if (_pageController.position.pixels >= _pageController.position.maxScrollExtent - 200){
            // nextAllCourses();
            //             }
                      // });
                      return Container(
                        height: 150.2,
                        child: PageView.builder(
                          pageSnapping: true,
                          // reverse:true,
                          // physics:ScrollPhysics(),
                          // controller: PageController(
                          //   initialPage: 3,
                          //   viewportFraction: 0.3,
                          // ),
                          controller: _pageController,
                          itemCount: allCourses.length,
                          itemBuilder: (context, i) => _courses(context, allCourses[i]),
                        ),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                );
              }
            
              Widget _courses(BuildContext context, CourseModel course) {
                return Container(
                  margin: EdgeInsets.only(right: 15.0),
                  child: GestureDetector(
                    onTap:  () {
                      // Navigator.pushNamed(context, 'courseShow',arguments: course);
                      setState(() {
                        
                      checkInternetConnectivity(course);
                      });
                    },
                    child: Stack(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: FadeInImage(
                            placeholder: AssetImage('assets/cargando1.gif'),
                            fadeInDuration: Duration(milliseconds: 200),
                            
                            image:( course.imagePath == null || course.imagePath == "") 
                              ? AssetImage('assets/banner.png') 
                              : NetworkImage(
                                '${course.imagePath}'),
                                // 'https://ep01.epimg.net/elpais/imagenes/2019/10/30/album/1572424649_614672_1572453030_noticia_normal.jpg'),
                            fit: BoxFit.cover,
                            // width: 100.0,
                            height: 120.0,
                            width: 100,
                          ),
                        ),
                        SizedBox( height: 5.0,),
                        Container(
                          height: 120.0,
                          width: 100,
                           decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(20.0),
                            //   color:Color.fromRGBO(37,37,233,0.29),
                            boxShadow: [
                              BoxShadow(
                                color: (prefs.colorSecundario) ? Colors.grey[900].withOpacity(0.8) :Colors.white.withOpacity(0.8),
                                offset: (prefs.colorSecundario) ? Offset (-3.5,-3.5) : Offset(-6.0, -6.0),
                                blurRadius:(prefs.colorSecundario) ? 6.5 : 16.0,
                                spreadRadius: (prefs.colorSecundario)  ? 1.0 : 0.0,
                              ),
                              BoxShadow(
                                color: (prefs.colorSecundario) ? Colors.grey[800].withOpacity(0.1) : Colors.black.withOpacity(0.1),
                                offset: (prefs.colorSecundario) ? Offset(1.0, 1.0) : Offset(6.0, 6.0),
                                blurRadius: (prefs.colorSecundario) ? 1.0 : 16.0,
                                spreadRadius: (prefs.colorSecundario)  ? 0.0 : 0.0,
                              ),
                            ],
                            color: (prefs.colorSecundario) ? Colors.grey[850].withOpacity(0.7) : Colors.transparent,
                             borderRadius: BorderRadius.circular(16.0),
                            ),
                          child: Center(
                            // child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5)),
                            
                            child: Tooltip(
                              message: '${course.name}',
                              verticalOffset: 48,
                              height: 24,
                              child: Text(
                                course.name,
                                // TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                // style: Theme.of(context).textTheme.caption,
                                style: TextStyle(color: Colors.white, fontSize: 15,fontFamily: 'TTFirsBlods'),textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }
            
              Widget _carouselButton(
                  String text, Color textColor, BuildContext context, String route,
                  {double height = 0, bool isPrimaryCard = false}) {
                return GestureDetector(
                  onTap: () => Navigator.pushNamed(context, route),
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: height),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: (prefs.colorSecundario) ? Colors.grey[800] :Colors.white.withOpacity(0.8),
                            offset: (prefs.colorSecundario) ? Offset (-0.5,-0.5) : Offset(-6.0, -6.0),
                            blurRadius:(prefs.colorSecundario) ? 1.0 : 16.0,
                            spreadRadius: (prefs.colorSecundario)  ? 1.0 : 0.0,
                          ),
                          BoxShadow(
                            color: (prefs.colorSecundario) ? Colors.grey[900] : Colors.black.withOpacity(0.1),
                            offset: (prefs.colorSecundario) ? Offset(2.0, 2.0) : Offset(6.0, 6.0),
                            blurRadius: (prefs.colorSecundario) ? 1.0 : 16.0,
                            spreadRadius: (prefs.colorSecundario)  ? 1.0 : 0.0,
                          ),
                        ],
                        color: (prefs.colorSecundario) ? Colors.grey[850] : Color(0xFFEFEEEE),
                        borderRadius: BorderRadius.circular(20.0),

                      // borderRadius: BorderRadius.all(Radius.circular(15)),
                      // color: textColor.withAlpha(isPrimaryCard ? 200 : 50),
                    ),
                    child: Text(
                      text,
                      style: TextStyle(
                          color:(prefs.colorSecundario) ? Colors.grey : Colors.black45, fontSize: 12),
                    ),
                  ),
                );
              }
            
              Widget _carouselHead(
                String title,
                Color primary,
                Color textColor,
                BuildContext context,
                String route,
              ) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        title,
                        style: TextStyle(color:(prefs.colorSecundario) ? Colors.grey : Colors.black, fontWeight: FontWeight.bold),
                      ),
                         _carouselButton("Ver todos", primary, context, route)
                    ],
                  ),
                );
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
            
              void nextAllCourses() {}
    void _preLoading(BuildContext context){
    
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context){

        return GestureDetector(
                  child: AlertDialog(
                    
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            title:  Text('Danos un momento ',style: TextStyle(color:(prefs.colorSecundario) ? Colors.grey :Colors.black),),
            content:  Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Estamos Cargando tus datos',style: TextStyle(color:(prefs.colorSecundario) ? Colors.grey :Colors.black),),
                // FlutterLogo(size: 100.0,),
                SizedBox(height: 30.0),
                FadeInImage(
                  image: AssetImage('assets/robot-loading.gif'),
                  placeholder:AssetImage('assets/cargando1.gif') ,
                  fadeInDuration: Duration(milliseconds: 200),
                  height: 100.0,
                  fit: BoxFit.cover,
                  )
              ],
            ),
            // actions: <Widget>[
            //   FlatButton(onPressed:  () => refresh(), child: Text('ok'),textColor: Colors.purple[300],),
            //   // FlatButton(onPressed: () {Navigator.of(context).pop();}, child: Text('OK'),textColor: Colors.purple[300],)
            // ],
          ),
        );
      }
       );
        setState(() {
           refresh();

         });
  }
    Future<Null> refresh()async{
    final duration = new Duration( seconds:2);
    new Timer(duration, (){
      Navigator.of(context).pushNamed("buttonBarBottom");
    });
    return Future.delayed(duration);
  }



  checkInternetConnectivity(course) async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      _showDialog();
    } else{
      Navigator.pushNamed(context, 'courseShow',arguments: course);
    }
    
  }

  _showDialog() {
    showDialog(
      context: context,
       barrierDismissible: false,
      builder: (context) {
        return GestureDetector(
                  child: AlertDialog(
                    backgroundColor:(prefs.colorSecundario) ? Colors.grey[850] : Color(0xFFEFEEEE),
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            title:  Text('!!Sin Conexión a internet!!',style: TextStyle(color:(prefs.colorSecundario) ? Colors.grey :Colors.black),),
            content:  Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // Text('Estamos Cargando tus datos'),
                // FlutterLogo(size: 100.0,),
                SizedBox(height: 30.0),
                 FadeInImage(
                  image: AssetImage('assets/sinconexion.gif'),
                  placeholder:AssetImage('assets/cargando1.gif') ,
                  fadeInDuration: Duration(milliseconds: 10),
                  height: 100.0,
                  fit: BoxFit.cover,
                  )
              ],
            ),
             actions: <Widget>[
            FlatButton( 

              child: Text('Ok'),
              onPressed: () {
               setState(() {
               (isButtonDisabled != true)? refresh():null;
               isButtonDisabled= true;
               });
              },
            )
          ],
          // crossAxisAlignment: CrossAxisAlignment.center,
          ),
        );
      }
    );
  }
 
}
