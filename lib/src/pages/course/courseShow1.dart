import 'package:QuizLab/src/utils/preferencesUser.dart';
import 'package:flutter/material.dart';




class CourseShow extends StatelessWidget {
  final prefs = new PreferencesUser();
  @override
  Widget build(BuildContext context) {
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
              // _categoryRow("Start a new career"),
              // _courseList(),
            ],
          ),
        )
      )
      
    );
  }
}