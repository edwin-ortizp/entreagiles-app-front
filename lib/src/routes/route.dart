import 'package:QuizLab/src/models/User.dart';
import 'package:QuizLab/src/pages/course/ArticleShow.dart';
import 'package:QuizLab/src/pages/course/courseIndex.dart';
import 'package:QuizLab/src/pages/course/courseShow.dart';
import 'package:QuizLab/src/pages/course/coursesMicrolearningIndex.dart';
import 'package:QuizLab/src/pages/course/myCourseIndex.dart';
import 'package:QuizLab/src/pages/course/myCourseMicrolearningIndex.dart';
import 'package:QuizLab/src/pages/course/mySimulatorsIndex.dart';
import 'package:QuizLab/src/pages/course/pdfShow.dart';
import 'package:QuizLab/src/pages/settting/settings.dart';
import 'package:QuizLab/src/pages/user/profile.dart';
import 'package:QuizLab/src/providers/conex_provider.dart';
import 'package:QuizLab/src/providers/userProvider.dart';
import 'package:QuizLab/src/widgets/buttonBarBottom.dart';
import 'package:flutter/material.dart';

import 'package:QuizLab/src/pages/auth/login.dart';
import 'package:QuizLab/src/pages/home.dart';




Map<String, WidgetBuilder> getApplicationRoutes(){

return <String, WidgetBuilder>{
        'login'   : ( BuildContext context ) => LoginPage(),
        'buttonBarBottom'   : ( BuildContext context ) => ButtonBarBottom(),
        'home'   : ( BuildContext context ) => HomePage(),
        'userProfile' : ( BuildContext context ) => ProfilePage(),
        'settings' : ( BuildContext context ) => SettingPage(),
        'courses' : ( BuildContext context ) => CourseIndex(),
        'coursesMicrolearning' : ( BuildContext context ) => CourseMicrolearningIndex(),
        'myCourses' : ( BuildContext context ) => MyCourseIndex(),
        'myCoursesMicrolearning' : ( BuildContext context ) => MyCourseMicrolearningIndex(),
        'mySimulators' : ( BuildContext context ) => MySimulatorsIndex(),
        'courseShow' : ( BuildContext context ) => CourseShow(),
        'articleShow' : ( BuildContext context ) => ArticleShowPage(),
        'conec' : ( BuildContext context ) => ConecPage(),
        'pdfShow' : ( BuildContext context ) => PdfShow(),
      };
}

