import 'package:QuizLab/src/models/Course.dart';
import 'package:QuizLab/src/pages/home.dart';
import 'package:QuizLab/src/providers/courseProvider.dart';
import 'package:QuizLab/src/utils/preferencesUser.dart';
import 'package:flutter/material.dart';

class CourseIndex extends StatelessWidget {
   double width;
   final prefs = new PreferencesUser();
  final coursesProvider = new CourseProvider();
  @override
  Widget build(BuildContext context) {
     var width = MediaQuery.of(context).size.width;
    //  print(width);
    return Scaffold(
        appBar: AppBar(
        centerTitle: true,
        title: Text('Courses',style:(prefs.colorSecundario) ? TextStyle(color: Colors.black):TextStyle(color: Colors.black)),
        // backgroundColor: Colors.purple[400],
        iconTheme:(prefs.colorSecundario) ? new IconThemeData(color: Colors.white): new IconThemeData(color: Colors.black),
        backgroundColor:(prefs.colorSecundario) ? Colors.purple[400] : Colors.white
      ),
   body: SingleChildScrollView(
            child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              // _categoryRow("Start a new career"),
              // _courseList()
              _categoryRow("Start a new career"),
              _courseList()
            ],
          ),
        )
      )
      
    );
  }

  // Widget _courseList() {
  //   return SingleChildScrollView(
  //     scrollDirection: Axis.vertical,
  //     child: Container(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         children: <Widget>[
  //           _courceInfo(CourseList.list[0],
  //               _decorationContainerA(Colors.redAccent, -110, -85),
  //               background: Colors.purpleAccent
  //               ),
  //               Text('sdhashd'),
  //           Divider(
  //             thickness: 1,
  //             endIndent: 20,
  //             indent: 20,
  //           ),
  //           // _courceInfo(CourseList.list[1], _decorationContainerB(),
  //           //     background: Colors.darkOrange),
  //           // Divider(
  //           //   thickness: 1,
  //           //   endIndent: 20,
  //           //   indent: 20,
  //           // ),
  //           // _courceInfo(CourseList.list[2], _decorationContainerC(),
  //           //     background: Colors.Orangse2),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  //   Widget _card(
  //     {Color primaryColor = Colors.redAccent,
  //     String imgPath,
  //     Widget backWidget}) {
  //   return Container(
  //       height: 190,
  //       width: 0.1,
  //       margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
  //       decoration: BoxDecoration(
  //           color: primaryColor,
  //           borderRadius: BorderRadius.all(Radius.circular(20)),
  //           boxShadow: <BoxShadow>[
  //             BoxShadow(
  //                 offset: Offset(0, 5),
  //                 blurRadius: 10,
  //                 color: Color(0x12000000))
  //           ]),
  //       child: ClipRRect(
  //         borderRadius: BorderRadius.all(Radius.circular(20)),
  //         child: backWidget,
  //       ));
  // }


  // Widget _courceInfo(CourseModel course, Widget decoration, {Color background}) {
    
  //   return Container(
  //       height: 170,
  //       width: 200,
  //       child: Row(
  //         children: <Widget>[
  //           AspectRatio(
  //             aspectRatio: .7,
  //             child: _card(primaryColor: background, backWidget: decoration),
  //           ),
  //           Expanded(
  //               child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: <Widget>[
  //               SizedBox(height: 15),
  //               Container(
  //                 child: Row(
  //                   mainAxisSize: MainAxisSize.max,
  //                   children: <Widget>[
  //                     Expanded(
  //                       child: Text("${course.name}",
  //                           style: TextStyle(
  //                               color: Colors.purple,
  //                               fontSize: 16,
  //                               fontWeight: FontWeight.bold)),
  //                     ),
  //                     CircleAvatar(
  //                       radius: 3,
  //                       backgroundColor: background,
  //                     ),
  //                     SizedBox(
  //                       width: 5,
  //                     ),
  //                     Text(course.description,
  //                         style: TextStyle(
  //                           color: Colors.grey,
  //                           fontSize: 14,
  //                         )),
  //                     SizedBox(width: 10)
  //                   ],
  //                 ),
  //               ),
  //               // Text(course.university,
  //               //     style: AppTheme.h6Style.copyWith(
  //               //       fontSize: 12,
  //               //       color: Colors.grey,
  //               //     )),
  //               SizedBox(height: 15),
  //               // Text(course.description,
  //               //     style: AppTheme.h6Style.copyWith(
  //               //         fontSize: 12, color: Colors.extraDarkPurple)),
  //               SizedBox(height: 15),
  //               Row(
  //                 children: <Widget>[
  //                   // _chip(course.tag1, Colors.darkOrange, height: 5),
  //                   SizedBox(
  //                     width: 10,
  //                   ),
  //                   // _chip(course.tag2, Colors.seeBlue, height: 5),
  //                 ],
  //               )
  //             ],
  //           ))
  //         ],
  //       ));
  // }
  //   Widget _decorationContainerA(Color primaryColor, double top, double left) {
  //   return Stack(
  //     children: <Widget>[
  //       Positioned(
  //         top: top,
  //         left: left,
  //         child: CircleAvatar(
  //           radius: 100,
  //           backgroundColor: Colors.purpleAccent[400],
  //         ),
  //       ),
  //       // _smallContainer(Colors.yellow, 40, 20),
  //       // Positioned(
  //       //   top: -30,
  //       //   right: -10,
  //       //   child: _circularContainer(80, Colors.transparent,
  //       //       borderColor: Colors.white),
  //       // ),
  //       Positioned(
  //         top: 110,
  //         right: -50,
  //         child: CircleAvatar(
  //           radius: 60,
  //           backgroundColor: Colors.indigoAccent[700],
  //           child:
  //               CircleAvatar(radius: 40, backgroundColor: Colors.red),
  //         ),
  //       ),
  //     ],
  //   );
  // }
  //  Widget _chip(String text, Color textColor,
  //     {double height = 0, bool isPrimaryCard = false}) {
  //   return Container(
  //     alignment: Alignment.center,
  //     padding: EdgeInsets.symmetric(horizontal: 10, vertical: height),
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.all(Radius.circular(15)),
  //       color: textColor.withAlpha(isPrimaryCard ? 200 : 50),
  //     ),
  //     child: Text(
  //       text,
  //       style: TextStyle(
  //           color: isPrimaryCard ? Colors.white : textColor, fontSize: 12),
  //     ),
  //   );
  // }

  //  Widget _categoryRow(String title) {
  //   return Container(
  //     // margin: EdgeInsets.symmetric(horizontal: 20),
  //     height: 68,
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: <Widget>[
  //         Padding(
  //           padding: EdgeInsets.symmetric(horizontal: 20),
  //           child: Text(
  //             title,
  //             style: TextStyle(
  //                 color: Colors.purpleAccent,
  //                 fontWeight: FontWeight.bold),
  //           ),
  //         ),
  //         SizedBox(
  //           height: 10,
  //         ),
  //         Container(
  //             width: width,
  //             height: 30,
  //             child: ListView(
  //               scrollDirection: Axis.horizontal,
  //               children: <Widget>[
  //                 SizedBox(width: 20),
  //                 _chip("Data Scientist", Colors.yellow, height: 5),
  //                 SizedBox(width: 10),
  //                 _chip("Data Analyst", Colors.red, height: 5),
  //                 SizedBox(width: 10),
  //                 _chip("Data Engineer", Colors.orange, height: 5),
  //                 SizedBox(width: 10),
  //                 _chip("Data Scientist", Colors.Blue,s height: 5),
  //               ],
  //             )),
  //         SizedBox(height: 10)
  //       ],
  //     ),
  //   );
  // }

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

  Widget _courseList() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _courceInfo(CourseList.list[0],
                _decorationContainerA(Colors.redAccent, -110, -85),
                background: Colors.blue),
            Divider(
              thickness: 1,
              endIndent: 20,
              indent: 20,
            ),
            _courceInfo(CourseList.list[1], _decorationContainerB(),
                background: Colors.orange),
            Divider(
              thickness: 1,
              endIndent: 20,
              indent: 20,
            ),
            _courceInfo(CourseList.list[2], _decorationContainerC(),
                background: Colors.orange[200]),
          ],
        ),
      ),
    );
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
                  blurRadius: 10,
                  color: Color(0x12000000))
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: backWidget,
        ));
  }

  Widget _courceInfo(CourseModel model, Widget decoration, {Color background}) {
    return Container(
        height: 170,
        width: 392.72727272727275 - 20,
        child: Row(
          children: <Widget>[
            AspectRatio(
              aspectRatio: .7,
              child: _card(primaryColor: background, backWidget: decoration),
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
                        child: Text(model.name,
                            style: TextStyle(
                                color: Colors.purple,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                      ),
                      CircleAvatar(
                        radius: 3,
                        backgroundColor: background,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(model.noOfCource,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          )),
                      SizedBox(width: 10)
                    ],
                  ),
                ),
                Text(model.university,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    )
                    ),
                SizedBox(height: 15),
                Text(model.description,
                    style: TextStyle(
                        fontSize: 12, color: Colors.purple)
                        ),
                SizedBox(height: 15),
                Row(
                  children: <Widget>[
                    _chip(model.tag1, Colors.orange, height: 5),
                    SizedBox(
                      width: 10,
                    ),
                    _chip(model.tag2, Colors.blue, height: 5),
                  ],
                )
              ],
            ))
          ],
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

  Widget _decorationContainerA(Color primaryColor, double top, double left) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: top,
          left: left,
          child: CircleAvatar(
            radius: 100,
            backgroundColor: Colors.blue,
          ),
        ),
        _smallContainer(Colors.yellow, 40, 20),
        Positioned(
          top: -30,
          right: -10,
          child: _circularContainer(80, Colors.transparent,
              borderColor: Colors.white),
        ),
        Positioned(
          top: 110,
          right: -50,
          child: CircleAvatar(
            radius: 60,
            backgroundColor: Colors.blue,
            child:
                CircleAvatar(radius: 40, backgroundColor: Colors.blue),
          ),
        ),
      ],
    );
  }

  Widget _decorationContainerB() {
    return Stack(
      children: <Widget>[
        Positioned(
          top: -65,
          left: -65,
          child: CircleAvatar(
            radius: 70,
            backgroundColor: Colors.orange[200],
            child: CircleAvatar(
                radius: 30, backgroundColor: Colors.orange),
          ),
        ),
        Positioned(
            bottom: -35,
            right: -40,
            child:
                CircleAvatar(backgroundColor: Colors.yellow, radius: 40)),
        Positioned(
          top: 50,
          left: -40,
          child: _circularContainer(70, Colors.transparent,
              borderColor: Colors.white),
        ),
      ],
    );
  }

  Widget _decorationContainerC() {
    return Stack(
      children: <Widget>[
        Positioned(
          bottom: -65,
          left: -35,
          child: CircleAvatar(
            radius: 70,
            backgroundColor: Color(0xfffeeaea),
          ),
        ),
        Positioned(
            bottom: -30,
            right: -25,
            child: ClipRect(
                // clipper: QuadClipper(),
                child: CircleAvatar(
                    backgroundColor: Colors.yellow, radius: 40))),
        _smallContainer(
          Colors.yellow,
          35,
          70,
        ),
      ],
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

  // @override
  // Widget build(BuildContext context) {
  //   width = MediaQuery.of(context).size.width;
  //   return Scaffold(
  //       bottomNavigationBar: BottomNavigationBar(
  //         showSelectedLabels: false,
  //         showUnselectedLabels: false,
  //         selectedItemColor: Colors.purple,
  //         unselectedItemColor: Colors.grey.shade300,
  //         type: BottomNavigationBarType.fixed,
  //         currentIndex: 1,
  //         items: [
  //           _bottomIcons(Icons.home),
  //           _bottomIcons(Icons.star_border),
  //           _bottomIcons(Icons.book),
  //           _bottomIcons(Icons.person),
  //         ],
  //         onTap: (index) {
  //           Navigator.pushReplacement(
  //               context, MaterialPageRoute(builder: (context) => HomePage()));
  //         },
  //       ),
  //       body: SingleChildScrollView(
  //           child: Container(
  //         child: Column(
  //           children: <Widget>[
  //             // _header(context),
  //             SizedBox(height: 20),
  //             _categoryRow("Start a new career"),
  //             _courseList()
  //           ],
  //         ),
  //       )
  //     )
  //   );
  // }
}
