import 'package:QuizLab/src/pages/settting/settings.dart';
import 'package:QuizLab/src/widgets/buttonBarBottom.dart';
import 'package:flutter/material.dart';

import 'package:QuizLab/src/pages/auth/login.dart';
import 'package:QuizLab/src/pages/home.dart';
import 'package:QuizLab/src/pages/user/userIndex.dart';


Map<String, WidgetBuilder> getApplicationRoutes(){

return <String, WidgetBuilder>{
        'login'   : ( BuildContext context ) => LoginPage(),
        'buttonBarBottom'   : ( BuildContext context ) => ButtonBarBottom(),
        'home'   : ( BuildContext context ) => HomePage(),
        'users' : ( BuildContext context ) => UsersIndex(),
        'settings' : ( BuildContext context ) => SettingPage(),
      };
}
