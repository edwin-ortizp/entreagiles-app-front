import 'package:QuizLab/src/models/User.dart';
import 'package:QuizLab/src/providers/userProvider.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_componentes/src/models/user_model.dart';
// import 'package:flutter_componentes/src/providers/users_provider.dart';
import 'package:QuizLab/src/utils/isNumb.dart' as utils;


class UserCreate extends StatefulWidget {

  @override
  _UserCreateState createState() => _UserCreateState();
}

class _UserCreateState extends State<UserCreate> {

  final formKey = GlobalKey<FormState>();
  final usersProvider = new UsersProvider();
  UsuarioModel user = new UsuarioModel();


  @override
  Widget build(BuildContext context) {
    final UsuarioModel userData =  ModalRoute.of(context).settings.arguments;
  if (userData !=null){
    user = userData;
  }
    return Scaffold(
       appBar: AppBar(
        title: Text('Crear usuario'),
        backgroundColor: Colors.purple[400],
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(Icons.photo_size_select_actual,color: Colors.white60), 
        //     onPressed: null
        //     ),
        //   IconButton(
        //     icon: Icon(Icons.camera_alt,color: Colors.white60,), 
        //     onPressed: null
        //     )
        // ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child:Column(
              children: <Widget>[
                _crearNombre(),
                 Divider(),
                _crearApellido(),
                 Divider(),
                _crearEmail(),
                 Divider(),
                _crearPassword(),
                 Divider(),
                _crearPhone(),
                 Divider(),
                _crearCountry(),
                 Divider(),
                _crearType(),
                 Divider(),
                _crearUsername(),
                _crearBoton(),
              ],    
            ) 
          ),
        ),
      ),
    );
  }

  Widget _crearNombre(){
    
    return TextFormField(
      initialValue: user.firstName,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
         border:   OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          
        ),
        hintText: 'Nombre de la persona',
        // helperText: 'Solo es el nombre',
        suffixIcon: Icon(Icons.transfer_within_a_station,color: Colors.purple[400],),
        icon: Icon(Icons.account_box,color: Colors.purple[400])
      ),
      onSaved: (value) => user.firstName = value,
      validator: (value){
        if ( value.length < 3 ) {
          return 'Ingrese un Nombre';
        }else{
          return null;
        }
      },
    );

  }

  Widget _crearApellido(){
    
    return TextFormField(
      initialValue: user.lastName,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
         border:   OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          
        ),
        hintText: 'Apellido de la persona',
        // helperText: 'Solo es el nombre',
        suffixIcon: Icon(Icons.transfer_within_a_station,color: Colors.purple[400],),
        icon: Icon(Icons.account_box,color: Colors.purple[400])
      ),
      onSaved: (value) => user.lastName = value,
      validator: (value){
        if ( value.length < 3 ) {
          return 'Ingrese un prudcto';
        }else{
          return null;
        }
      },
    );

  }

  Widget _crearEmail(){
    
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      initialValue: user.email,
      // textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
      border:   OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      hintText: 'Email',
      suffixIcon: Icon(Icons.alternate_email,color: Colors.purple[400],),
      icon: Icon(Icons.email,color: Colors.purple[400])

      ),
      onSaved: (value) => user.email = value,
      validator: (value){
        if ( value.length < 3 ) {
          return 'Ingrese un Correo';
        }else{
          return null;
        }
      },
    );

  }

  Widget _crearPassword(){
    
    return TextFormField(
      obscureText: true,
      initialValue: user.password.toString(),
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
         border:   OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        hintText: 'Password',
        suffixIcon: Icon(Icons.lock_open,color: Colors.purple[400],),
        icon: Icon(Icons.lock,color: Colors.purple[400])
      ),
      onSaved: (value) => user.password = value,
      validator: (value){
        if ( value.length < 6 ) {
          return 'Ingrese mas de 6 caracteres';
        }else{
          return null;
        }
      },
    );
  }

    Widget _crearPhone(){

        return TextFormField(
      initialValue: user.phone.toString(),
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
         border:   OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          
        ),
        hintText: 'Numero telefonico',
        // helperText: 'Solo es el nombre',
        suffixIcon: Icon(Icons.mobile_screen_share,color: Colors.purple[400],),
        icon: Icon(Icons.phone_iphone,color: Colors.purple[400])
      ),
      onSaved: (value) => user.phone = value,
      validator: (value){
        if ( utils.IsNumeric(value)) {
          return null;
        }else{
          return 'Solo números y mas de 7 caracteres';
        }
      },
    );
  }
    Widget _crearCountry(){

        return TextFormField(
      initialValue: user.countryId.toString(),
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
         border:   OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          
        ),
        hintText: 'Pais',
        // helperText: 'Solo es el nombre',
        suffixIcon: Icon(Icons.settings_backup_restore,color: Colors.purple[400],),
        icon: Icon(Icons.public,color: Colors.purple[400])
      ),
      onSaved: (value) => user.countryId = int.parse(value),
      validator: (value){
        if ( utils.IsNumeric(value)) {
          return null;
        }else{
          return 'Solo números y menos de 3 caracteres';
        }
      },
    );
  }

  Widget _crearType(){
    
    return TextFormField(
      initialValue: user.type,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border:   OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        hintText: 'Typo de usuario',
        suffixIcon: Icon(Icons.person_outline,color: Colors.purple[400],),
        icon: Icon(Icons.person_pin,color: Colors.purple[400])
      ),
      onSaved: (value) => user.type = value,
      validator: (value){
        if ( value.length < 3 ) {
          return 'Ingrese un Nombre';
        }else{
          return null;
        }
      },
    );

  }


  Widget _crearUsername(){

     return TextFormField(
      initialValue: user.username.toString(),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
       border:   OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        hintText: 'Numero de documento',
        suffixIcon: Icon(Icons.card_giftcard,color: Colors.purple[400],),
        icon: Icon(Icons.indeterminate_check_box,color: Colors.purple[400])
      ),
      onSaved: (value) => user.username = (value),
      validator: ( value) {
        if ( utils.IsNumeric(value) ){
          return null;
        }else{
          return 'Solo números';
        }
      },
    );

  }



  Widget _crearBoton(){

    return RaisedButton.icon(
      
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 0.0,
      color: Colors.purple[400],
      textColor: Colors.white,
      label: Text('Guardar'),
      icon: Icon(Icons.save),
      onPressed: _submit,
      );
  }

  void _submit(){

    if (!formKey.currentState.validate() ) return;

    formKey.currentState.save()
;
    // if (formKey.currentState.validate() ){
    //   //Cuando el formulario es valido
    // }
    print('Todo ok');
    print(user.firstName);
    print(user.lastName);
    print(user.email);
    print(user.password);
    print(user.phone);
    print(user.countryId);
    print(user.type);
    print(user.username);
    print(user.email);
    print(user);
    // print(producto.disponible);
    if(user.id ==null){
    usersProvider.crearUsuario(user);

    }else{
      usersProvider.editarUsuario(user);
      // usersProvider.editarUsuario(user.firstName,user.lastName, user.password, user.phone);
      // print(user.toJson()) ;
      
    }
  }
}