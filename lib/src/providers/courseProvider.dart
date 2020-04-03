// llamado de dependencias
import 'dart:convert';
import 'package:QuizLab/src/models/Course.dart';
import 'package:QuizLab/src/utils/preferencesUser.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity/connectivity.dart';


class CourseProvider{
final _prefs = new PreferencesUser();
// Servidor
final String _url = 'http://181.143.182.50:3000';
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
  // print( decodedData);
    List datos = decodedData ['myCourse'];
  print(datos);
    final List<CourseModel> myCourses = new List ();

    if( datos == null ) return null;
  if( datos.length == 0 || datos == null ){
    _prefs.myCourses= false;
  } else{
    _prefs.myCourses= true;
  }
    // _prefs.myCourses= true;
    datos.forEach(( myCourse ){
      final myCoursesTemp = CourseModel.fromJson(myCourse);
      // cursosTemp.id = cursos ['id'];
      myCourses.add(myCoursesTemp);
      
    });
      // print(myCourses);
     
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
  // print( url);
    List datos = decodedData ['cursos'];
  // print(datos);
    final List<CourseModel> allCourses = new List ();

    if( datos == null ) return [];
  if( datos.length == 0 || datos == null ) {
     _prefs.noCourses= false;
  } else{
    _prefs.noCourses= true;
  }
  print( "misccursos ${_prefs.noCourses}");
    datos.forEach(( course ){
      final myCoursesTemp = CourseModel.fromJson(course);
      // cursosTemp.id = cursos ['id'];
      allCourses.add(myCoursesTemp);
      
    });
      // print(allCourses);
     
    return allCourses;
     } else {
    // Si esta respuesta no fue OK, lanza un error.
    throw Exception('Failed to load post');
  }

}


}