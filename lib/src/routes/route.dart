import 'package:QuizLab/src/models/User.dart';
import 'package:QuizLab/src/pages/course/ArticleShow.dart';
import 'package:QuizLab/src/pages/course/courseIndex.dart';
import 'package:QuizLab/src/pages/course/courseShow.dart';
import 'package:QuizLab/src/pages/course/myCourseIndex.dart';
import 'package:QuizLab/src/pages/settting/settings.dart';
import 'package:QuizLab/src/pages/user/profile.dart';
import 'package:QuizLab/src/pages/user/users_create.dart';
import 'package:QuizLab/src/providers/conex_provider.dart';
import 'package:QuizLab/src/providers/userProvider.dart';
import 'package:QuizLab/src/widgets/buttonBarBottom.dart';
import 'package:QuizLab/src/widgets/buttonBarBottomArticle.dart';
import 'package:flutter/material.dart';

import 'package:QuizLab/src/pages/auth/login.dart';
import 'package:QuizLab/src/pages/home.dart';
import 'package:QuizLab/src/pages/user/userIndex.dart';
import 'package:QuizLab/src/pages/user/userProfile.dart';




Map<String, WidgetBuilder> getApplicationRoutes(){

return <String, WidgetBuilder>{
        'login'   : ( BuildContext context ) => LoginPage(),
        'buttonBarBottom'   : ( BuildContext context ) => ButtonBarBottom(),
        'buttonBarBottomArticle'   : ( BuildContext context ) => ButtonBarBottomArticle(),
        'home'   : ( BuildContext context ) => HomePage(),
        'users' : ( BuildContext context ) => UsersIndex(),
        'userProfile' : ( BuildContext context ) => ProfilePage(),
        'userCreate' : ( BuildContext context ) => UserCreate(),
        'userProfile' : ( BuildContext context ) => UserProfile(),
        'settings' : ( BuildContext context ) => SettingPage(),
        'courses' : ( BuildContext context ) => CourseIndex(),
        'myCourses' : ( BuildContext context ) => MyCourseIndex(),
        'courseShow' : ( BuildContext context ) => CourseShow(),
        'articleShow' : ( BuildContext context ) => ArticleShowPage(),
        // 'conec' : ( BuildContext context ) => ConecPage(),
      };
}

