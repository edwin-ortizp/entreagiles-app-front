// Llamados Dependencias
import 'package:QuizLab/src/widgets/menuSidebarProfile.dart';
import 'package:QuizLab/src/widgets/editProfileScreen.dart';
import 'package:flutter/material.dart';
// Llamados Paginas
import 'package:QuizLab/src/providers/userProvider.dart';


class UserProfile extends StatelessWidget {

  final usersProvider = new UsersProvider();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.purple),
        home: Scaffold(
          appBar: AppBar(
          title: Text('Perfil'),
          backgroundColor: Colors.purple[400],
          ),
          resizeToAvoidBottomPadding: false,
          endDrawer: MenuSiderbarProfile(),
          body: EditProfileScreen(),
        ),
    );
  }

  // Widget _header(String nombre, correo) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: <Widget>[
  //       CircleAvatar(
  //         radius: 45.0,
  //         backgroundImage: NetworkImage('https://via.placeholder.com/150'),
  //         backgroundColor: Colors.transparent,
  //       ),
  //       Padding(padding: EdgeInsets.all(7.0)),
  //       Flexible(
  //         child: Column(
  //           children: <Widget>[
  //             Text(
  //               '$nombre',
  //               style: TextStyle(color: Colors.black, fontSize: 40.0),
  //             ),
  //             Text(
  //               '$correo',
  //               style: TextStyle(color: Colors.grey, fontSize: 20.0),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }

  
  
}
