import 'package:QuizLab/src/utils/courses_bloc.dart';
import 'package:flutter/material.dart';

import 'package:QuizLab/src/validations/loginBloc.dart';

export 'package:QuizLab/src/validations/loginBloc.dart';


class Provider extends InheritedWidget {

  final _coursesbloc = new MyCoursesBloc();

  static Provider _instancia;

  factory Provider({ Key key, Widget child }) {

    if ( _instancia == null ) {
      _instancia = new Provider._internal(key: key, child: child );
    }

    return _instancia;

  }

  Provider._internal({ Key key, Widget child })
    : super(key: key, child: child );


  final loginBloc = LoginBloc();

  // Provider({ Key key, Widget child })
  //   : super(key: key, child: child );

 
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LoginBloc of ( BuildContext context ) {
    return ( context.inheritFromWidgetOfExactType(Provider) as Provider ).loginBloc;
  }
  static MyCoursesBloc myCoursesBloc ( BuildContext context ) {
    return ( context.inheritFromWidgetOfExactType(Provider) as Provider )._coursesbloc;
  }

}