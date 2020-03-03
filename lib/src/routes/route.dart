import 'package:QuizLab/src/pages/course/courseIndex.dart';
import 'package:QuizLab/src/pages/settting/settings.dart';
import 'package:QuizLab/src/widgets/buttonBarBottom.dart';
import 'package:flutter/material.dart';

import 'package:QuizLab/src/pages/auth/login.dart';
import 'package:QuizLab/src/pages/home.dart';
import 'package:QuizLab/src/pages/user/userIndex.dart';
import 'package:QuizLab/src/pages/user/userProfile.dart';




Map<String, WidgetBuilder> getApplicationRoutes(){

return <String, WidgetBuilder>{
        'login'   : ( BuildContext context ) => LoginPage(),
        'buttonBarBottom'   : ( BuildContext context ) => ButtonBarBottom(),
        'home'   : ( BuildContext context ) => HomePage(),
        'users' : ( BuildContext context ) => UsersIndex(),
        'userProfile' : ( BuildContext context ) => UserProfile(),
        'settings' : ( BuildContext context ) => SettingPage(),
        'courses' : ( BuildContext context ) => CourseIndex(),
      };
}
