
import 'package:flutter/material.dart';

import 'package:apk_eureka/src/models/User.dart';
import 'package:apk_eureka/src/providers/userProvider.dart';
import 'package:apk_eureka/src/widgets/menuSiderbar.dart';


class UsersIndex extends StatelessWidget {
  final usersProvider = new UsersProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuarios'),
        backgroundColor: Colors.purple[400],
      ),
      drawer: MenuSiderbar(),
       body: _crearListado(),
      floatingActionButton: _crearBoton(context),
    );
  }

  Widget _crearListado(){

    return FutureBuilder(
      future: usersProvider.cargarUsuarios(),
      builder: (BuildContext context, AsyncSnapshot<List<UsuarioModel>> snapshot) {

        if(snapshot.hasData){

          final usuarios = snapshot.data;
          return ListView.builder(
            itemCount: usuarios.length,
            itemBuilder: (context, i) => _crearItem(context,usuarios[i]),
          );
        }else{

        return Center(
          child: CircularProgressIndicator(),
        );
        }

      },
    );

  }



  Widget _crearItem(BuildContext context, UsuarioModel user){

    return Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.red,
        ),
        onDismissed: (direccion){
          usersProvider.borrarUsuario(user.id.toString());
        },
        child: Card(
        child: GestureDetector(
          onTap:  () => Navigator.pushNamed(context, 'userCreate', arguments: user),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text('${user.id}'),
              ),
              CircleAvatar(backgroundImage: NetworkImage('https://picsum.photos/200/300?random=${user.id}'),
              ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('${user.firstName} ${user.lastName}',style: TextStyle(fontSize: 15.0,color: Colors.black54),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _crearBoton (BuildContext context){
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Colors.purple[400],
      onPressed:  () => Navigator.pushNamed(context, 'userCreate'),
    );
  }


}