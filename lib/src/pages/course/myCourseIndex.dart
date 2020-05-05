import 'dart:async';

import 'package:QuizLab/src/models/Course.dart';
import 'package:QuizLab/src/pages/home.dart';
import 'package:QuizLab/src/providers/courseProvider.dart';
import 'package:QuizLab/src/utils/preferencesUser.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';

class MyCourseIndex extends StatefulWidget {
  @override
  _MyCourseIndexState createState() => _MyCourseIndexState();
}

class _MyCourseIndexState extends State<MyCourseIndex> {
  double width;

  final prefs = new PreferencesUser();

  final coursesProvider = new CourseProvider();
  bool isButtonDisabled;
  Future<void> _launched;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    //  print(width);
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text('Courses',
                style: (prefs.colorSecundario)
                    ? TextStyle(color: Colors.black)
                    : TextStyle(color: Colors.black)),
            // backgroundColor: Colors.purple[400],
            iconTheme: (prefs.colorSecundario)
                ? new IconThemeData(color: Colors.white)
                : new IconThemeData(color: Colors.black),
            backgroundColor:
                (prefs.colorSecundario) ? Colors.purple[400] : Colors.white),
        body: SingleChildScrollView(
            child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              _coursesLoad(context)
            ],
          ),
        )));
  }

  Widget _card(
      {Color primaryColor = Colors.redAccent,
      String imgPath,
      Widget backWidget}) {
    return Container(
        height: 190,
        width: 392.72727272727275 * .34,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  offset: Offset(0, 5),
                  blurRadius: 20,
                  color: Color(0x12000000))
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: backWidget,
        ));
  }


  Widget _chip(String text, Color textColor,
      {double height = 0, bool isPrimaryCard = false}) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: height),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: textColor.withAlpha(isPrimaryCard ? 200 : 50),
      ),
      child: Text(
        text,
        style: TextStyle(
            color: isPrimaryCard ? Colors.white : textColor, fontSize: 12),
      ),
    );
  }

  Positioned _smallContainer(Color primaryColor, double top, double left,
      {double radius = 10}) {
    return Positioned(
        top: top,
        left: left,
        child: CircleAvatar(
          radius: radius,
          backgroundColor: primaryColor.withAlpha(255),
        ));
  }

  BottomNavigationBarItem _bottomIcons(IconData icon) {
    return BottomNavigationBarItem(
        //  backgroundColor: Colors.blue,
        icon: Icon(icon),
        title: Text(""));
  }

  Widget _coursesLoad(BuildContext context) {
    // var height = MediaQuery.of(context).size.height;
    var height = MediaQuery.of(context).size.height;
    return FutureBuilder(
      future: coursesProvider.courseForUser(),
      builder:
          (BuildContext context, AsyncSnapshot<List<CourseModel>> snapshot) {
        if (snapshot.hasData) {
          final allCourses = snapshot.data;
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              height: height * 1 - 100,
              child: ListView.builder(
                itemCount: allCourses.length,
                itemBuilder: (context, i) => _courses(context, allCourses[i]),
              ),
            ),
          );
        } else {
          return Container(
              height: height *0.75,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  Widget _courses(
    BuildContext context,
    CourseModel course,
  ) {
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        setState(() {
        checkInternetConnectivity(course);
        });
      },
      child: Column(children: <Widget>[
        Container(
            height: 200,
            width: width - 20,
            // margin: EdgeInsets.only(right: 15.0),
            child: Row(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: .7,
                  child: Container(
                    height: 190,
                    width: width * .34,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    // margin: EdgeInsets.only(right: 15.0),
                    child: Stack(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: FadeInImage(
                            placeholder: AssetImage('assets/cargando1.gif'),
                            image: (course.imagePath == null ||
                                    course.imagePath == "")
                                ? AssetImage('assets/banner.png')
                                : NetworkImage(
                                    // 'https://st2.depositphotos.com/1428083/7080/i/450/depositphotos_70801427-stock-photo-unicorn-in-the-moonlight.jpg'),
                                    'https://quizlab.app/public/img/courses/${course.name}.jpg'),
                            fit: BoxFit.cover,
                            // width: 100.0,
                            height: 160.0,
                            width: 100,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Container(
                          height: 160.0,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Color.fromRGBO(37, 37, 233, 0.29),
                          ),
                          child: Center(
                              // child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5)),

                              // child: Text(
                              //   course.name,
                              //   // TextAlign.center,
                              //   overflow: TextOverflow.ellipsis,
                              //   // style: Theme.of(context).textTheme.caption,
                              //   style: TextStyle(color: Colors.white, fontSize: 11),textAlign: TextAlign.center,
                              // ),
                              ),
                        )
                      ],
                    ),
                  ),

                  // _card2(primaryColor: Colors.red, ),
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 15),
                    Container(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              course.name,
                              style: TextStyle(
                                  color: Colors.purple,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                            ),
                          ),
                          CircleAvatar(
                            radius: 3,
                            backgroundColor: Colors.blue,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text('${course.sections.length} secciones',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              )),
                          SizedBox(width: 10)
                        ],
                      ),
                    ),
                    // Text(
                    //     (course.teacher[0] != null)
                    //         ? 'Instructor: ${course.teacher[0].firstName} ${course.teacher[0].lastName}'
                    //         : 'Instructor: SIn asignar',
                    //     style: TextStyle(
                    //       fontSize: 12,
                    //       color: Colors.grey,
                    //     )),
                    // Text('${course.teacher[0].email}',
                    //  style: TextStyle(
                    //   fontSize: 12,
                    //   color: Colors.grey,
                    // )),

                    SizedBox(height: 15),
                    Tooltip(
                      message: '${course.description}',
                      verticalOffset: 48,
                      height: 24,
                      child: Text(
                        "${course.description}",
                        style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ),

                    SizedBox(height: 15),
                    Row(
                      children: <Widget>[
                        // _chip("Ver", Colors.purple[700], height: 5),
                        SizedBox(
                          width: 10,
                        ),
                        // _chip("model.tag2", Colors.blue, height: 5),
                      ],
                    ),
                  ],
                )),
              ],
            )),
        Divider(
          thickness: 1,
          endIndent: 20,
          indent: 20,
        ),
      ]),
    );
  }

    checkInternetConnectivity(course) async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      _showDialog(course);
    } else{
      Navigator.pushNamed(context, 'courseShow',arguments: course);
    }
    
  }

  _showDialog(course) {
    showDialog(
      context: context,
       barrierDismissible: false,
      builder: (context) {
        return GestureDetector(
                  child: AlertDialog(
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            title:  Text('!!Sin Conexión a internet!!'),
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
               (isButtonDisabled != true)? refresh(course):null;
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

      Future<Null> refresh(course)async{
    final duration = new Duration( seconds:2);
    new Timer(duration, (){
      Navigator.pushNamed(context, 'myCourses');
    });
    return Future.delayed(duration);
  }


}
