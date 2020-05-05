// llamado de dependencias
import 'dart:async';
import 'dart:convert';
import 'package:QuizLab/src/models/Course.dart';
import 'package:QuizLab/src/utils/preferencesUser.dart';
import 'package:http/http.dart' as http;
// import 'package:connectivity/connectivity.dart';


class CourseProvider{
final _prefs = new PreferencesUser();
int _pageCourse = 0;

// List<CourseModel> _missingCoursesSt new List();
final _allCoursesStreamController = StreamController<List<CourseModel>>.broadcast(); 

Function(List<CourseModel>) get allCoursesSink => _allCoursesStreamController.sink.add;
Stream<List<CourseModel>> get allCoursesStream => _allCoursesStreamController.stream;

void disposeStream(){
  _allCoursesStreamController?.close();
}
// Servidor
final String _url = 'http://54.149.151.17:3000';
//android estudio
//  final String _url = 'http://10.0.2.2:3000';
// red local
// final String _url = 'http://192.168.1.132:3000';
// http://localhost:3000/courses/1/mycourses?token=
Future<List<CourseModel>> courseForUser() async {
  final url = '$_url/courses/my-courses/inscribed?token=${_prefs.token}';
  final resp = await http.get(url);
   if (resp.statusCode == 200) {
  final  decodedData = json.decode(resp.body);
    List datos = decodedData ['myCourse'];
    final List<CourseModel> myCourses = new List ();

    if( datos == null ) return null;
  if( datos.length == 0 || datos == null ){
    _prefs.myCourses= false;
  } else{
    _prefs.myCourses= true;
  }
    datos.forEach(( myCourse ){
      final myCoursesTemp = CourseModel.fromJson(myCourse);
      myCourses.add(myCoursesTemp);
    });
     
    return myCourses;
    } else {
    // Si esta respuesta no fue OK, lanza un error.
    throw Exception('Failed to load post');
  }

}
Future<List<CourseModel>> missingCourses() async {
  final url = '$_url/courses/missing-courses/show?token=${_prefs.token}';
  final resp = await http.get(url);
   if (resp.statusCode == 200) {
  final  decodedData = json.decode(resp.body);
    List datos = decodedData ['cursos'];
    final List<CourseModel> _allCourses = new List ();

    if( datos == null ) return [];
  if( datos.length == 0 || datos == null ) {
     _prefs.noCourses= false;
  } else{
    _prefs.noCourses= true;
  }
  // print( "misccursos ${_prefs.noCourses}");
    datos.forEach(( course ){
      final myCoursesTemp = CourseModel.fromJson(course);
      _allCourses.add(myCoursesTemp);
    });
    
     allCoursesSink(_allCourses);
    return _allCourses;
     } else {
    // Si esta respuesta no fue OK, lanza un error.
    throw Exception('Failed to load post');
  }

}

 Future<int> articleLoad(String article_id)async{
    final authData ={

      'article_id'     : article_id,
      // 'password'  :password,
      // 'token' :true
    };

    final url   = '$_url/article/?token=${_prefs.token}';
    final resp  = await http.post(url,body: (authData));
    //  final resp = await http.post(url,body: (authData));
    // print(json.decode(resp.body));
    return 1;
  }

}