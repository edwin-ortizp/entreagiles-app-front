// llamado de dependencias
import 'dart:convert';
import 'package:http/http.dart' as http;
// llamados de otras paginas
import 'package:QuizLab/src/models/User.dart';



class UsersProvider{
// login(String email, String password){

  Future<Map<String, dynamic>> login(String email, String password) async{

    final authData ={

      'email'     : email,
      'password'  :password,
      // 'token' :true
    };

    final resp = await http.post('http://10.0.2.2:3000/login',
      body: (authData)
      );

    Map<String, dynamic> decodeResp = json.decode(resp.body);

    print(resp.body);

    print(decodeResp);
    if(decodeResp.containsKey('token')){

      return { 'ok': true, 'token': decodeResp['token'] };
    }else{
       return { 'ok': false, 'mensaje': decodeResp['message'] };
    }
  }

// }


  final String _url = 'http://10.0.2.2:3000';
  final _token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJub21icmUiOiJrZXdpbiIsImFwZWxsaWRvIjoiY2FsZGVyb24iLCJlbWFpbCI6Imtld2luZXJpa3NvbkBob3RtYWlsLmNvbSIsImlkIjoiMjI5NSIsInRpcG8iOiJhZG1pbiIsImlhdCI6MTU4MjY0NzAzOCwiZXhwIjoxNTgyNjYxNDM4fQ.MOFmq3X29-TFZ2lffwwuaq38GXJ6ldEqETjjbqLixu8';

  Future<List<UsuarioModel>> cargarUsuarios() async{
    final url = '$_url/users?token=$_token';
    final resp = await http.get(url);

    final  decodedData = json.decode(resp.body);
    List datos = decodedData ['usuarios'];
    final List<UsuarioModel> usuarios = new List ();

    if( datos == null ) return [];

    datos.forEach(( user ){
      final usuariosTemp = UsuarioModel.fromJson(user);
      // cursosTemp.id = cursos ['id'];
      usuarios.add(usuariosTemp);
      
    });
     
    return usuarios;
  }


  Future<bool> crearUsuario( UsuarioModel user) async{

  final url = '$_url/users?';    
  final resp = await http.post(url, body:usuarioModelToJson(user));
  final decodeData = json.decode(resp.body);
  print(decodeData);
  return true;
  }
  // Future<bool> editarUsuario( UsuarioModel user) async{

  // final url = '$_url/users/$user.id?token=$_token';    
  // final resp = await http.put(url, body:usuarioModelToJson(user);
  // final decodeData = json.decode(resp.body);
  // print(decodeData);
  // return true;
  // }

   Future<bool> editarUsuario( UsuarioModel usuario ) async {
    
    final url = '$_url/users/{$usuario.id}?token={$_token}';

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

    final url   = '$_url/users/$id?token=$_token';
    final resp  = await http.delete(url);
    print(json.decode(resp.body));
    return 1;
  }

}