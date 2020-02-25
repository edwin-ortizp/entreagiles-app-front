import 'package:flutter/material.dart';

import 'package:apk_eureka/src/pages/auth/login.dart';
import 'package:apk_eureka/src/pages/home.dart';
import 'package:apk_eureka/src/pages/user/userIndex.dart';


Map<String, WidgetBuilder> getApplicationRoutes(){

return <String, WidgetBuilder>{
        'login'   : ( BuildContext context ) => LoginPage(),
        'home'   : ( BuildContext context ) => HomePage(),
        'users' : ( BuildContext context ) => UsersIndex(),
      };
}
