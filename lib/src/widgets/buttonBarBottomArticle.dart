import 'package:QuizLab/src/models/Course.dart';
import 'package:QuizLab/src/pages/course/ArticleShow.dart';
import 'package:QuizLab/src/pages/course/courseIndex.dart';
import 'package:QuizLab/src/pages/home.dart';
import 'package:QuizLab/src/pages/settting/settings.dart';
import 'package:QuizLab/src/pages/user/profile.dart';
import 'package:QuizLab/src/providers/courseProvider.dart';
// import 'package:QuizLab/src/pages/user/userIndex.dart';
import 'package:QuizLab/src/utils/preferencesUser.dart';
import 'package:flutter/material.dart';

// class ButtonBarBottomArticle extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return _bottomNavigatioBar(context);
//   }


//   Widget _bottomNavigatioBar(BuildContext context){

//     return Theme(
//       data: Theme.of(context).copyWith(
//         canvasColor: Color.fromRGBO(55, 57, 84, 1.0),  
//         primaryColor: Colors.pinkAccent,
//         textTheme: Theme.of(context).textTheme.copyWith( caption: TextStyle(color: Color.fromRGBO(116, 117, 152, 1.0)) )
//       ),
//       child: BottomNavigationBar(
//         currentIndex: 0,
//         onTap: (index){},
//         items: [
//            BottomNavigationBarItem(
//             icon: Icon( Icons.home,size: 30.0,),
//             title: Container(),
//            ),
//            BottomNavigationBarItem(
//             icon: Icon( Icons.supervised_user_circle,size: 30.0,),
//             title: Container(),
//            ),
//            BottomNavigationBarItem(
//             icon: Icon( Icons.settings,size: 30.0,),
//             title: Container(), 
//            ),
//           ],
//        ),
//     );
//   }
  

// }


class ButtonBarBottomArticle extends StatefulWidget {
  static final String routeName = 'buttonBarBottomArticle';
  @override
  _ButtonBarBottomArticleState createState() => _ButtonBarBottomArticleState();
}

class _ButtonBarBottomArticleState extends State<ButtonBarBottomArticle> {
  int currentIndex = 0;
  final prefs = new PreferencesUser();
final coursesProvider = new CourseProvider();
  @override
  Widget build(BuildContext context) {
    
    // prefs.ultimaPagina = ButtonBarBottomArticle.routeName;
    // final Article articleData = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text('Welcome ${prefs.nombre}',style:(prefs.colorSecundario) ? TextStyle(color: Colors.black):TextStyle(color: Colors.black)),
      //   // backgroundColor: Colors.purple[400],
      //   iconTheme:(prefs.colorSecundario) ? new IconThemeData(color: Colors.white): new IconThemeData(color: Colors.black),
      //   backgroundColor:(prefs.colorSecundario) ? Colors.purple[400] : Colors.white
      // ),
      body: _callPage(currentIndex),
      bottomNavigationBar: _bottomNavigatioBar(context),
    );
  }

  Widget _callPage(int page){

    switch(page){

      // case 0: return HomePage();
      case 0: return ArticleShowPage();
      case 1: return ArticleShowPage();
      case 2: return ArticleShowPage();
      default:
      return SettingPage();

    }

  }

  Widget _bottomNavigatioBar(context){

    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor:(prefs.colorSecundario) ? Color.fromRGBO(55, 57, 84, 1.0): Color.fromRGBO(255, 255, 255, 1.0),  
        primaryColor: (prefs.colorSecundario) ? Colors.pinkAccent : Colors.indigoAccent[700],
        textTheme: Theme.of(context).textTheme.copyWith( caption: TextStyle(color: Color.fromRGBO(116, 117, 152, 1.0)) )
      ),
      child:BottomNavigationBar(
        // prefs.page= currentIndex,
        currentIndex: currentIndex,
        onTap: (index){
          setState(() {
            currentIndex = index;
          });
        },
        items: [
           BottomNavigationBarItem(
            icon: Icon( Icons.home,size: 30.0,),
            title: Container(),
           ),
           BottomNavigationBarItem(
            icon: Icon( Icons.shopping_cart,size: 30.0,),
            title: Container(),
           ),
           BottomNavigationBarItem(
            icon: Icon( Icons.person_pin,size: 30.0,),
            title: Container(), 
           ),
          ],
       ),
    );


  }
}