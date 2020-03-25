// llamado de dependencias
import 'dart:convert';
import 'package:http/http.dart' as http;
// llamados de otras paginas
import 'package:QuizLab/src/utils/preferencesUser.dart';
import 'package:QuizLab/src/models/User.dart';



class UsersProvider{
// login(String email, String password){
  final _prefs = new PreferencesUser();
  //android estudio
  final String _url = 'http://10.0.2.2:3000';
  //red local
  // final String _url = 'http://192.168.1.132:3000';

  Future<Map<String, dynamic>> login(String email, String password) async{

    final authData ={

      'email'     : email,
      'password'  :password,
      // 'token' :true
    };
    // android studio
    final url = '$_url/login';
    final resp = await http.post(url,body: (authData));
 
    Map<String, dynamic> decodeResp = json.decode(resp.body);

    print(resp.body);

    print( _prefs.token);
    if(decodeResp.containsKey('token')){

      _prefs.token= decodeResp['token'];
      return { 'ok': true, 'token': decodeResp['token'] };
      
    }else{
       return { 'ok': false, 'mensaje': decodeResp['message'] };
    }
  }
  /*
   *No borrar  inicio de register 
   */
  // Future register( String email,String password, UserModel user) async {
  // // Future register( String email,String password,String fistName, String lastName, String country, String phone, String type, int username) async {
  //   final authData = {
  //       'email'     : email,
  //     'password'  :password,
  //       // 'fist_name'     : user.lastName,
  //     // 'last_name'  :lastName,
  //     //   'country_id'     : country,
  //     // 'phone'  :phone,
  //     //   'type'     : type,
  //     'username'  :user.username,
  //   };
  //   final url = '$_url/register';

  //   final resp = await http.post(url,body: json.encode(authData));
  //   Map<String, dynamic> decodeResp = json.decode(resp.body);
  //   print(decodeResp);
  // }


  Future <UserModel>userProfile() async{
    final url = '$_url/users/myProfile?token=${_prefs.token}';
    final resp = await http.get(url);

    final  decodedData = json.decode(resp.body);
    //  Map<String, dynamic>  decodedData = json.decode(resp.body);
    final  user = UserModel.fromJson(decodedData['user']);
    _prefs.user= user;
    // UserModel usuario = new user
// final List<String> users = new List ();
    // List user = decodedData ;
    // final List<UserModel> usuariosTemp = decodedData['user'];
    // final List<UserModel> users = new List ();
    // if( datos == null ) return [];

    // datos.forEach(( user ){
    //   final usuariosTemp = UserModel.fromJson(user);
    //   // cursosTemp.id = cursos ['id'];
      // users.add(user[0]);
      
    // });
     print(user.id);
    //  Navigator.pushNamed(context, 'userCreate', arguments: user)
    return user;

  }

  Future<List<UserModel>> cargarUsuarios() async{
    final url = '$_url/users?token=${_prefs.token}';
    final resp = await http.get(url);

    final  decodedData = json.decode(resp.body);
    List datos = decodedData ['usuarios'];
    final List<UserModel> usuarios = new List ();
    if( datos == null ) return [];

    datos.forEach(( user ){
      final usuariosTemp = UserModel.fromJson(user);
      // cursosTemp.id = cursos ['id'];
      usuarios.add(usuariosTemp);
      
    });
     
    return usuarios;
  }


  Future<bool> crearUsuario( UserModel user) async{

  final url = '$_url/register';    
  final resp = await http.post(url, body:userModelToJson(user));
  final decodeData = json.decode(resp.body);
  print(user.toJson());
  return true;
  }
  // Future<bool> editarUsuario( UsuarioModel user) async{

  // final url = '$_url/users/$user.id?token=$_token';    
  // final resp = await http.put(url, body:usuarioModelToJson(user);
  // final decodeData = json.decode(resp.body);
  // print(decodeData);
  // return true;
  // }

   Future<bool> editarUsuario( UserModel usuario ) async {
    
    final url = '$_url/users/{$usuario.id}?token=${_prefs.token}';

    final resp = await http.put( url, body: json.encode(usuario) );
    // fina
    final decodedData = json.decode(resp.body);

    print( decodedData );
    print( usuario.toJson() );

    return true;

  }


  // Future<Map<String, dynamic>> editarUsuario(String firstName, String lastName, String password, String phone UsuarioModel user) async{

  //   final authData ={

  //     'firstName'     : firstName,
  //     'lastName'  :lastName,
  //     'password'     : password,
  //     'phone'  :phone,
  //     // 'token' :true
  //   };

  //   final resp = await http.post('$_url/users/{$usuario.id}?token={$_token}',
  //     body: (authData)
  //     );

  //   Map<String, dynamic> decodeResp = json.decode(resp.body);

  //   print(resp.body);

  //   print(decodeResp);
  //   if(decodeResp.containsKey('token')){

  //     return { 'ok': true, 'token': decodeResp['token'] };
  //   }else{
  //      return { 'ok': false, 'mensaje': decodeResp['message'] };
  //   }
  // }




  Future<int> borrarUsuario (String id)async{

    final url   = '$_url/users/$id?token=${_prefs.token}';
    final resp  = await http.delete(url);
    print(json.decode(resp.body));
    return 1;
  }

}