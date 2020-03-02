// llamado de dependencias
import 'dart:convert';
import 'package:QuizLab/src/models/Course.dart';
import 'package:QuizLab/src/utils/preferencesUser.dart';
import 'package:http/http.dart' as http;


class CourseProvider{
final _prefs = new PreferencesUser();
final String _url = 'http://192.168.0.8:3000';
// http://localhost:3000/courses/1/mycourses?token=
Future<List<CourseModel>> courseForUser() async {
  final url = '$_url/courses/5/mycourses?token=${_prefs.token}';
  final resp = await http.get(url);
  final  decodedData = json.decode(resp.body);
  // print( url);
    List datos = decodedData ['mycourses'];
  // print(datos);
    final List<CourseModel> myCourses = new List ();

    if( datos == null ) return null;

    datos.forEach(( myCourse ){
      final myCoursesTemp = CourseModel.fromJson(myCourse);
      // cursosTemp.id = cursos ['id'];
      myCourses.add(myCoursesTemp);
      
    });
      print(myCourses);
     
    return myCourses;

}
Future<List<CourseModel>> allCourse() async {
  final url = '$_url/courses?token=${_prefs.token}';
  final resp = await http.get(url);
  final  decodedData = json.decode(resp.body);
  // print( url);
    List datos = decodedData ['cursos'];
  // print(datos);
    final List<CourseModel> allCourses = new List ();

    if( datos == null ) return [];

    datos.forEach(( course ){
      final myCoursesTemp = CourseModel.fromJson(course);
      // cursosTemp.id = cursos ['id'];
      allCourses.add(myCoursesTemp);
      
      // print(decodedData);
    });
     
    return allCourses;

}


}