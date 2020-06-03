import 'dart:async';

import 'package:QuizLab/src/models/Course.dart';
import 'package:QuizLab/src/pages/home.dart';
import 'package:QuizLab/src/providers/courseProvider.dart';
import 'package:QuizLab/src/utils/preferencesUser.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';

class CourseMicrolearningIndex extends StatefulWidget {
  @override
  _CourseMicrolearningIndexState createState() => _CourseMicrolearningIndexState();
}

class _CourseMicrolearningIndexState extends State<CourseMicrolearningIndex> {

  ScrollController _scrollController = new ScrollController();
   double width;

   final prefs = new PreferencesUser();

  final coursesProvider = new CourseProvider();

  bool _isLoading = false;

  int _ultimoItem = 0;
  List<int> _listaNumeros = new List();




  @override
  void initState(){
super.initState();
  // _agregar6();

  _scrollController.addListener((){
    // fetchData();
  });


  }
  @override
  @override
  void dispose() { 
    
    super.dispose();
    _scrollController.dispose();
  }
  Widget build(BuildContext context) {
     var width = MediaQuery.of(context).size.width;
    //  print(coursesProvider.missingCourses().len);
    return Scaffold(
        backgroundColor: (prefs.colorSecundario)?Colors.grey[850] :Color(0xFFEFEEEE),
        appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text('Microlearning',style:(prefs.colorSecundario) ? TextStyle(color: Colors.grey):TextStyle(color: Colors.black)),
        // backgroundColor: Colors.purple[400],
        iconTheme:(prefs.colorSecundario) ? new IconThemeData(color: Colors.white): new IconThemeData(color: Colors.grey),
        backgroundColor:(prefs.colorSecundario) ? Colors.grey[850] : Color(0xFFEFEEEE),
        //  leading: IconButton(
        //     tooltip: 'Previous choice',
        //     icon: const Icon(Icons.arrow_back),
        //     onPressed: () {
        //       // if(_isLoading == false){
        //      Navigator.of(context).pop();
        //     //   }else{
        //     //     Navigator.pushNamed(context, 'buttonBarBottom');
        //     //   }
        //     },
        //   ),
      ),
   body: Stack(
     children: <Widget>[
         SingleChildScrollView(
              child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 20),
                // _categoryRow("Start a new career"),
                // _courseList()
                // _categoryRow("Start a new career"),
                // _courseList(),
                _coursesLoad(context),
                _loading(),
              ],
            ),
          )
        ),
        ],
   )
      
    );
  }

   Widget _circularContainer(double height, Color color,
      {Color borderColor = Colors.transparent, double borderWidth = 2}) {
    return Container(
      height: height,
      width: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: Border.all(color: borderColor, width: borderWidth),
      ),
    );
  }

  Widget _categoryRow(String title) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 20),
      height: 78,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.purple,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              width: width,
              height: 30,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  SizedBox(width: 20),
                  _chip("Data Scientist", Colors.yellow, height: 5),
                  SizedBox(width: 10),
                  _chip("Data Analyst", Colors.blue, height: 5),
                  SizedBox(width: 10),
                  _chip("Data Engineer", Colors.orange, height: 5),
                  SizedBox(width: 10),
                  _chip("Data Scientist", Colors.blue, height: 5),
                ],
              )),
          SizedBox(height: 10)
        ],
      ),
    );
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
    var height = MediaQuery.of(context).size.height;
    return FutureBuilder(
      future: coursesProvider.missingCoursesMicrolearning(),
      builder:
          (BuildContext context, AsyncSnapshot<List<CourseModel>> snapshot) {
        if (snapshot.hasData) {
          final allCourses = snapshot.data;
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
          child: Container(
            height: height *1 -150,
            child: RefreshIndicator(
              onRefresh: refresh,
                          child: ListView.builder(
                
                itemCount: allCourses.length,
                itemBuilder: (context, itemCount ) => _courses(context, allCourses[itemCount]),
              // ),SizedBox(height: 10)

                //  _courceInfo(CourseList.list[0],
                //   _decorationContainerA(Colors.redAccent, -110, -85),
                //   background: Colors.blue),
              //    Divider(
              //   thickness: 1,
              //   endIndent: 20,
              //   indent: 20,
              // ),
              ),
            ),
            // child: Column(),
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

    Widget _courses(BuildContext context, CourseModel course,) {
         final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        setState(() {
          Navigator.pushNamed(context, 'courseShow',arguments: course);
        });
      },
          child: Column(
         children: <Widget>[
        Container(
            height: 200,
            width: width - 20,
          // margin: EdgeInsets.only(right: 15.0),
          child: Row(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: .7,
                  child:  Container(
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
                  image:( course.imagePath == null || course.imagePath == "") ? AssetImage('assets/banner.png') : NetworkImage(
                      // 'https://novapixel.org/eureka/public/img/courses/${course.name}.jpg'),
                      '${course.imagePath}'),
                  fit: BoxFit.cover,
                  // width: 100.0,
                  height: 160.0,
                  width: 100,
                ),
              ),
              SizedBox( height: 5.0,),
              Container(
                height: 160.0,
                width: 100,
                 decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                    color:Color.fromRGBO(37,37,233,0.29),
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
                            child: Text(course.name,
                                style: TextStyle(
                                    color: Colors.purple,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                                     overflow: TextOverflow.ellipsis,
                                maxLines: 3,),
                          ),
                          CircleAvatar(
                            radius: 3,
                            backgroundColor:Colors.blue,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text('12 secciones',
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
                      //  Popup(
                  // content: getSampleBox1(CrossAxisAlignment.start,course,),
                  // child: Icon(Icons.info),
                      // GestureDetector(
                      //   onTap:
                      //   () => _pupPop(context,course) ,
                        
                        // Tooltip(
                        //   message: 'sdjalsjdslka',
                          // child:my
                           Tooltip(
                             
                             message: '${course.description}',
                             verticalOffset: 48,
                             height: 24,
                             child: Text("${course.description}",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey[700]),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                                
                                    ),
                           ),
                                    //  _pupPop(context,course),
                        // ),
                                // new Tooltip(message: "Hello World", child: new Text("foo")),
                      // ),
                // ),

                     /**Parta poder leer  codigo html */
                      // Container(
                      //   child: Html(data:"${course.description}",
                      //       // style: TextStyle(
                      //       //     fontSize: 12, color: Colors.purple),
                      //       // overflow: TextOverflow.ellipsis,
                      //       // maxLines: 3, 
                      //           ),
                      // ),

                    SizedBox(height: 15),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: Row(
                        children: <Widget>[
                          // _chip("Adquirir", Colors.purple[700], height: 5),
                          // _chip("ver", Colors.purple[700], height: 5),
                          SizedBox(
                            width: 10,
                          ),
                          // _chip("ver", Colors.blue, height: 5),
                          
                        ],
                      ),
                    ),
                  ],
                )),
              ],
            )
        ),
            Divider(
                thickness: 1,
                endIndent: 20,
                indent: 20,
              ),
         ]
      ),
    );
              
  }

    Widget _pupPop(BuildContext context,course){


       Tooltip(message: 'sjdhaksdhk',);
    }

    void _agregar6(){

      for(var i =1;i< 6; i++){
        _ultimoItem++;
        _listaNumeros.add(_ultimoItem);
      }
    print("object${_ultimoItem}");
    }

  Future fetchData(){
    _isLoading = true;
    setState(() { });
    final duration = new Duration(seconds: 2);
    new Timer(duration,respuestaHttp);
  }
  void respuestaHttp(){
    _isLoading = false;
    _coursesLoad(context);
    setState(() { });
  }
  Widget _loading(){
    if (_isLoading){
      return CircularProgressIndicator();
    }{
      return Container();
    }
  }
  Future<Null> refresh()async{
    final duration = new Duration( seconds:2);
    new Timer(duration, (){
      // Navigator.pushNamed(context, 'courses');
      fetchData();
      bool _isLoading = true;
      // setState(() { 
      // });
    });
    return Future.delayed(duration);
  }
  
}

