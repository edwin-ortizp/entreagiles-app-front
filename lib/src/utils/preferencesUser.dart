import 'package:shared_preferences/shared_preferences.dart';


class PreferencesUser{

  static final PreferencesUser _instancia = new PreferencesUser._internal();

  factory PreferencesUser(){
    return _instancia;
  }

  PreferencesUser._internal();
  
  SharedPreferences _prefs;
  intPrefs()async{
     this._prefs = await SharedPreferences.getInstance();
  }
 //en esta parte se deben poner los datos que quiere persistir


  get token{
    return _prefs.getString('token') ?? '';
  }
  set token(String value) {
    _prefs.setString('token', value);
  }

  get genero{
    return _prefs.getInt('genero') ?? 1;
  }
  set genero(int value) {
    _prefs.setInt('genero', value);
  }

  get colorSecundario{
    return _prefs.getBool('colorSecundario') ?? false;
  }
  set colorSecundario(bool value) {
    _prefs.setBool('colorSecundario', value);
  }

  get nombre{
    return _prefs.getString('nombre') ?? '';
  }
  set nombre(String value) {
    _prefs.setString('nombre', value);
  }

  get ultimaPagina{
    return _prefs.getString('ultimaPagina') ?? 'login';
  }
  set ultimaPagina(String value) {
    _prefs.setString('ultimaPagina', value);
  }
  get page{
    return _prefs.getInt('page') ?? '0';
  }
  set page(int value) {
    _prefs.setInt('page', value);
  }
  get user{
    return _prefs.getString('user') ?? null;
  }
  set user( value) {
    _prefs.setString('user', value.toString());
  }
  get myCourses{
    return _prefs.getBool('myCourses') ?? null;
  }
  set myCourses( value) {
    _prefs.setBool('myCourses', value);
  }
  get noCourses{
    return _prefs.getBool('noCourses') ?? null;
  }
  set noCourses( value) {
    _prefs.setBool('noCourses', value);
  }
  get userFistname{
    return _prefs.getString('userFistname') ?? null;
  }
  set userFistname( value) {
    _prefs.setString('userFistname', value);
  }
  get userLastname{
    return _prefs.getString('userLastname') ?? null;
  }
  set userLastname( value) {
    _prefs.setString('userLastname', value);
  }
}