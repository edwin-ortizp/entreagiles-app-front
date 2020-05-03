

import 'package:QuizLab/src/models/Course.dart';
import 'package:QuizLab/src/providers/courseProvider.dart';
import 'package:rxdart/rxdart.dart';

class MyCoursesBloc {

  final _myCoursesController = new BehaviorSubject<List<CourseModel>>();
  final _cargandoMyCoursesController = new BehaviorSubject<bool>();
  final _courseProvider = new CourseProvider();

  Stream<List<CourseModel>> get courseForUser => _myCoursesController;
  Stream<bool> get cargandoCourseForUser => _cargandoMyCoursesController.stream;

  void cargarCurso() async {
    final courses = await _courseProvider.courseForUser();
    _myCoursesController.sink.add(courses);
  }
  // void completed() async {
  //   _cargandoMyCoursesController.sink.add(true);
  //   await _courseProvider.articleLoad(article_id);
  // }

  dispose(){
    _myCoursesController?.close();
  }
}