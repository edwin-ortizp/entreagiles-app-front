// import 'dart:js';
// import 'dart:js';

import 'package:QuizLab/src/models/Course.dart';
import 'package:QuizLab/src/providers/courseProvider.dart';
import 'package:QuizLab/src/utils/preferencesUser.dart';
import 'package:flutter/material.dart';

class CourseShow extends StatelessWidget {
  final prefs = new PreferencesUser();
  final coursesProvider = new CourseProvider();
  CourseModel course = new CourseModel();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    final CourseModel courseData = ModalRoute.of(context).settings.arguments;
    if (courseData != null) {
      course = courseData;
    }
    return Scaffold(body: _appbarCustom(course, context));
  }

  Widget _appbarCustom(CourseModel course, BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          elevation: 2.0,
          backgroundColor:
              (prefs.colorSecundario) ? Colors.purple[400] : Colors.white,
          expandedHeight: 200.0,
          floating: false,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Text('${course.name}',
                style: (prefs.colorSecundario)
                    ? TextStyle(color: Colors.white, fontSize: 15)
                    : TextStyle(color: Colors.black, fontSize: 15)),
            background: FadeInImage(
              placeholder: AssetImage('assets/cargando1.gif'),
              image: (course.imagePath == null || course.imagePath == "")
                  ? AssetImage('assets/banner.png')
                  : NetworkImage(
                      'https://novapixel.org/eureka/public/img/courses/${course.name}.jpg'),
              // fadeInDuration: Duration(microseconds: 60),
              fit: BoxFit.cover,
            ),
          ),
        ),
        _loadSections(),
      ],
    );
  }

  Widget _loadSections() {
    final sections = course.sections;
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int i) {
          return Center(
            child: Card(
              margin: EdgeInsets.all(20.0),
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                children: <Widget>[
                  new ExpansionTile(
                    trailing: Icon(
                      Icons.add,
                      color: Colors.indigoAccent[700],
                    ),
                    title: new Text('Sección ${i + 1}'),
                    subtitle: Text("${sections[i].name}"),
                    children: <Widget>[
                      new Column(
                        children: _quizContent(sections[i]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        childCount: sections.length,
      ),
    );
  }

  _quizContent(Section section) {
    List<Widget> quizContent = [];
    if (section.quizzes.isNotEmpty) {
      for (Quiz quiz in section.quizzes)
        quizContent.add(
          new ListTile(
            title: new Text("${quiz.title}"),
            leading: Icon(Icons.description, color: Colors.blueAccent),
            subtitle: Text('subtitulo'),
            trailing: Icon(Icons.check_box_outline_blank, color: Colors.grey),
          ),
        );
    } else {
      for (Article article in section.articles)
        quizContent.add(
          new ListTile(
            title: new Text("${article.name}"),
            leading: (article.video != null)
                ? Icon(Icons.video_call, color: Colors.blue)
                : Icon(Icons.assignment, color: Colors.green[300]),
            subtitle: Text('subtitulo'),
            trailing: Icon(Icons.check_box_outline_blank, color: Colors.grey),
          ),
        );
    }

    return quizContent;
  }
}
