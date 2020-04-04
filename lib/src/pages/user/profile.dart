// import 'dart:js';

import 'package:QuizLab/src/models/User.dart';
import 'package:QuizLab/src/providers/userProvider.dart';
// import 'package:QuizLab/src/providers/userProvider.dart';
import 'package:QuizLab/src/utils/preferencesUser.dart';
import 'package:QuizLab/src/widgets/menuSidebarProfile.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';


class ProfilePage extends StatefulWidget {
  // ProfilePage({
  //   Key key,
  // }) : super(key: key);

    // final UsersProvider user ;
    // ProfilePage(this.user);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
   bool get hasFocus => false;
  var usersProvider = new UsersProvider();
  final prefs = new PreferencesUser();
  // UserModel userw = null;
  bool _colorSecundario = true;
  @override
   void initState() {
    super.initState();
    // prefs.ultimaPagina = SettingPage.routeName;
    _colorSecundario = prefs.colorSecundario;
  }
  Widget build(BuildContext context) {
  Color color = (prefs.colorSecundario)? Colors.purple[400] : Colors.indigoAccent[400];
  // theme: ThemeData (primarySwatch:(prefs.colorSecundario)?  Colors.purple :Colors.red ) ;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Perfil',style: (prefs.colorSecundario)
           ?TextStyle(color:Colors.white)
           : TextStyle(color: Colors.black),),
          
                  // ? TextStyle(color: Colors.white)
                  // : TextStyle(color: Colors.black)),
          // backgroundColor: Colors.purple[400],
          iconTheme: (prefs.colorSecundario)
              ? new IconThemeData(color: Colors.white)
              : new IconThemeData(color: Colors.black),
          // leading: IconButton(
          //   tooltip: 'Previous choice',
          //   icon: const Icon(Icons.arrow_back),
          //   onPressed: () {
          //    Navigator.of(context).popAndPushNamed('settings');
          //   },
          // ),
          backgroundColor: (prefs.colorSecundario) ? Colors.purple[400] : Colors.white,
          ),
      resizeToAvoidBottomPadding: false,
      endDrawer: MenuSiderbarProfile(),
      //  SingleChildScrollView(
      //       child: Container(
      body: SingleChildScrollView(
          child: FutureBuilder(
            future: usersProvider.userProfile(),
            builder: (BuildContext context, AsyncSnapshot<UserModel> snapshot) {
             if(snapshot.hasData){
              final user = snapshot.data;
            return Container(
              child: Column(
                children: <Widget>[
                  topBar(context,color,user),
                  _homePageContent(color,user),
               ],
              ),
            );
             }else{

            return Center(
              child: CircularProgressIndicator(),
            );
           }
          }
        ),
      ),
    );
  }
  

  SizedBox topBar(BuildContext context,color,user) {
    return SizedBox(
      height: 120,
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          _purpleBar(user),
          _circleAvatar(context,color,user),
        ],
      ),
    );
  }

Widget _purpleBar(UserModel user) {
  prefs.userFistname = user.firstName;
  prefs.userLastname = user.lastName;
    return ControlledAnimation(
      duration: Duration(milliseconds: 600),
      tween: Tween<double>(begin: 0, end: 150),
      builder: (context, animation) {
        return Container(
          padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
          height: animation,
          width: double.infinity,
          color: (prefs.colorSecundario) ? Colors.purple[200]:Colors.white70 ,
          child: ListView( children: <Widget>[
            ListTile(
              title: new Center (
                child: Text(' ${user.firstName} ${user.lastName}',
                  style: (prefs.colorSecundario) ? TextStyle(color: Colors.white, fontSize: 30.0) :TextStyle(color: Colors.grey[400], fontSize: 30.0) 
                  ),
                ),
                subtitle: new Center (child: Text('${user.email}',
                  style: TextStyle(fontSize: 15.0))),
              ),
            ]
          ),
        );
      }
    );
  }

Widget _circleAvatar(BuildContext context,color,user){
    final size = MediaQuery.of(context).size;
    return ControlledAnimation(
      duration: Duration(milliseconds: 600),
      delay: Duration(milliseconds: (300 * 2).round()),
      curve: Curves.elasticOut,
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, scaleValue) {
        return Positioned(
          top: 100,
          left: size.width / 2 - 50,
          child: Transform.scale(
            scale: scaleValue,
            alignment: Alignment.center,
            child: _purpleCircle(color,user),
          ),
        );
      },
    );
  }

  Widget _purpleCircle(color,UserModel user) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: color,
        image: DecorationImage(
           image: (user.imagePath == null || user.imagePath == "")
                  ? AssetImage('assets/banner.png')
                  // : NetworkImage(
                  //     'https://scontent.fbog4-1.fna.fbcdn.net/v/t1.0-1/c27.0.160.160a/p160x160/47317608_4030223027020387_7188427802004160512_o.jpg?_nc_cat=104&_nc_sid=dbb9e7&_nc_ohc=hAmXaZqmR40AX-v9lUX&_nc_ht=scontent.fbog4-1.fna&oh=266c5d30bbe75bf0575fd7e555b04642&oe=5E9F7747'),
                  : AssetImage('assets/user.png')
                      // 'https://novapixel.org/eureka/public/${user.imagePath}.jpg'),
              // fadeInDuration: Duration(microseconds: 60),
          // image: AssetImage('assets/images/finn.jpg'),
          // fit: BoxFit.cover,
        ),
        border: Border.all(
          width: 4,
          color: color
        ),
      ),
    );
  }

Widget _homePageContent(color,user) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: <Widget>[
          largeWhitespace(),
          contentPlaceHolder(color,user),
        ],
      ),
    );
  }

  Widget contentPlaceHolder(color ,user) {
    return ControlledAnimation(
      duration: Duration(milliseconds: 600),
      delay: Duration(milliseconds: (300 * 3).round()),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, opacityValue) {
        return Opacity(
            opacity: opacityValue,
            child: Column(children: <Widget>[
            _colorSecundary(),
            _nameField('Nombres',color,user),
            smallWhitespace(),
            _nameLast('Apellidos',color,user),
            smallWhitespace(),
            _emailField(color,user),
            smallWhitespace(),
            _phoneField(color,user),
            smallWhitespace(),
            // _saveButton(color)
            ]),
          );
      },
    );
  }

  Widget largeWhitespace() => SizedBox(height: 60);

  Widget smallWhitespace() => SizedBox(height: 8);

Widget _nameField(String data,color,UserModel user){

  return TextFormField(
    
    initialValue: user.firstName,
    //  enableInteractiveSelection: false,
     readOnly: true,
    focusNode: FocusNode(),
      // autofocus: true, es para activar  al entrar el texto
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        border:   OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        hintText: '$data',
        helperText: '$data',
        suffixIcon: Icon(Icons.text_fields,color: color,),
        icon: Icon(Icons.account_circle,color: color)
      ),
      // onChanged: (valor) => setState(() {
      //   _email = valor;
      //   })
    );

}
Widget _nameLast(String data,color,UserModel user){

  return TextFormField(
    readOnly: true,
    initialValue: user.lastName,
     enableInteractiveSelection: false,
    focusNode: FocusNode(),
      // autofocus: true, es para activar  al entrar el texto
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        border:   OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        hintText: '$data',
        helperText: '$data',
        suffixIcon: Icon(Icons.text_fields,color: color,),
        icon: Icon(Icons.account_circle,color: color)
      ),
      // onChanged: (valor) => setState(() {
      //   _email = valor;
      //   })
    );

}

Widget _emailField(color,user) {
    
      return TextFormField(
        readOnly: true,
      // autofocus: true, es para activar  al entrar el texto
      initialValue: user.email,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border:   OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        hintText: 'Email',
        helperText: 'Email',
        suffixIcon: Icon(Icons.alternate_email,color: color,),
        icon: Icon(Icons.email,color: color)
      ),
      // onChanged: (valor) =>setState(() {
      //   _email = valor;
      //   })
    );
  }

Widget _phoneField(color,user) {
    
      return TextFormField(
        readOnly: true,
      // autofocus: true, es para activar  al entrar el texto
      initialValue: user.phone,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        border:   OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        hintText: 'Telefono',
        helperText: 'Telefono',
        suffixIcon: Icon(Icons.phonelink_setup,color: color,),
        icon: Icon(Icons.phone_iphone,color: color)
      ),
      // onChanged: (valor) =>setState(() {
      //   _email = valor;
      //   })
    );
  }

Widget _saveButton(color){

  return RaisedButton.icon(
    onPressed: () {},
    icon: Icon(Icons.save, color: Colors.white,),
    color: color,
    label: Text('Guardar', 
      style: TextStyle(
      fontSize: 20.0,
      color: Colors.white,),
    ),
    shape: RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(18.0),
    ),
    );

  }
  Widget _colorSecundary(){

    return Center(
      child: SwitchListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 80),
        value: _colorSecundario, 
        title: Text('Color secundario',style: TextStyle(fontSize: 16,color: Colors.grey[700]),),
        onChanged: (value){
          setState(() {
          _colorSecundario = value;
          prefs.colorSecundario = value;
          });
        },
      ),
    );
  }
  
}


