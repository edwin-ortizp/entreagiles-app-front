// import 'dart:js';
import 'package:QuizLab/src/models/Course.dart';
import 'package:QuizLab/src/providers/courseProvider.dart';
import 'package:QuizLab/src/utils/preferencesUser.dart';
import 'package:flutter/material.dart';


class CourseShow extends StatelessWidget {
  final prefs = new PreferencesUser();
  final coursesProvider = new CourseProvider();
  CourseModel course = new  CourseModel();
  @override
  Widget build(BuildContext context) {
  var height = MediaQuery.of(context).size.height;
      final CourseModel courseData =  ModalRoute.of(context).settings.arguments;
  if (courseData !=null){
    course = courseData;
  }
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _appbarCustom(course),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: 10.0,),
                // _title(context,course),
                _sectionLoad( context),
                //  _quizzesLoad(section),
                // _cardexpansiontiletipo2(context),
              ]
            ),
          )
        ],
      ),
    );
    // return Scaffold(
    //   body: _accordion(),
    // );
  }

  Widget _appbarCustom( CourseModel course ){

    return SliverAppBar(
      elevation: 2.0,
      backgroundColor:(prefs.colorSecundario) ? Colors.purple[400] : Colors.white,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text('${course.name}',style: (prefs.colorSecundario)? 
          TextStyle(color: Colors.white,fontSize: 15): 
          TextStyle(color: Colors.black,fontSize: 15)
          ),
        background: FadeInImage( 
          image: NetworkImage('https://picsum.photos/200/300?random=${course.id}'),
           placeholder: AssetImage('assets/cat-loading.gif'),
           fadeInDuration: Duration(microseconds: 150),
           fit: BoxFit.cover,
          ),
      ),
    );

  }


  Widget _title(BuildContext context,CourseModel course){

    return Container(
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
              child: Image(
                image: NetworkImage('https://picsum.photos/200/300?random=${course.id}'),
                height: 150.0,
            ),
          ),
          SizedBox(width: 20.0,),
          Flexible(
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: <Widget>[
                Text('${course.name}',style: Theme.of(context).textTheme.title,overflow: TextOverflow.ellipsis,),
                Text('${course.name}',style: Theme.of(context).textTheme.subtitle,overflow: TextOverflow.ellipsis),

              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget _sectionLoad(){

  //   List<Widget> list = new List<Widget>();
  //   for (var i = 0; i < count; i++) {
      
  //   }

  // }

  Widget _sectionLoad(BuildContext context ) {
     var height = MediaQuery.of(context).size.height;
  final sections = course.sections;
    return SizedBox(
      height: height * 1,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        // pageSnapping: false,
        // controller: PageController(
        //   viewportFraction: 0.3,
        //   initialPage: 1
        // ),
        itemCount: sections.length,
        itemBuilder: (context, i) => _accordion(sections[i])
      ),
    );

  }



 Widget _accordion2(Section section){
   
  //  final sections = course.sections;
  //  for(var i = 0; i < sections.length; i++){
      // final myCoursesTemp = CourseModel.fromJson(myCourse);
      // cursosTemp.id = cursos ['id'];
      // myCourses.add(myCoursesTemp);
      
  //  final resp = course.sections;
  //  final  decodedData = resp;
   return Center(
    child: Card(
      margin: EdgeInsets.all(20.0),
      shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ExpansionTile(
        leading: Icon(
          Icons.video_call,color: Colors.indigoAccent[700]),
        trailing:  Icon(Icons.add,color: Colors.indigoAccent[700],),      
        title: Text("${section.name}"),
        children: (section.quizzes.isEmpty ) ? <Widget>[
              Text(""),
        ]:<Widget>[
              Text("${section.quizzes[1].title}"),
        ],

              ),
            ],
          ),
    
      ),
    );
    }


  Widget _accordion(Section section ){
    final quizzes = section.quizzes;
  return Center(
   
    child: Card(
      
     
      margin: EdgeInsets.all(20.0),
      elevation: 8,
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ExpansionTile(
        
        trailing:  Icon(Icons.add,color: Colors.indigoAccent[700],),   


        title: Text("Sección ${section.order+1}"),
        subtitle: Text("${section.name}"),
        
        children: <Widget>[
          //  ListView.builder(
          //          itemCount: quizzes.length,
          //         itemBuilder: (context, i) => _quizzes(quizzes[i])
          //     ),
          
          // const ListTile(
          // leading: Icon(Icons.video_call,color: Colors.indigoAccent,),
          // //  Icon(Icons.album, size: 50),
          // title: Text('Video de introducción'),
          // subtitle: Text('subtitulo'),
          // trailing: Icon(Icons.check_box_outline_blank, color: Colors.grey), 
          // ),
          // const ListTile(
          // leading: Icon(Icons.video_call,color: Colors.indigoAccent,),
          // //  Icon(Icons.album, size: 50),
          // title: Text('Video de introducción'),
          // subtitle: Text('subtitulo'),
          // trailing: Icon(Icons.check_box, color: Colors.greenAccent), 
          // ),
          // const ListTile(
          // leading: Icon(Icons.description, color: Colors.green),
          // //  Icon(Icons.album, size: 50),
          // title: Text('Esquema de certificacion aaaaaaaaaaaaaaa'),
          // subtitle: Text('subtitulo'),
          // trailing: Icon(Icons.check_box_outline_blank, color: Colors.grey), 
          // ),
          // const ListTile(
          // leading: Icon(Icons.description, color: Colors.green),
          // //  Icon(Icons.album, size: 50),
          // title: Text('Esquema de certificacion aaaaaaaaaaaaaaa'),
          // subtitle: Text('subtitulo'),
          // trailing: Icon(Icons.check_box, color: Colors.greenAccent),  
          // ),
          
              // Text("Prueba de curso numero1")

        //  children: _quizzesLoad(section),
        ],

              )
            ],
          ),
    
      ),
    );


  }



  // Widget _quizzesLoad(Section section){

  //  final quizzes = section.quizzes;
  //   final  quiz=   <Widget>[
  //             ListView.builder(
  //                  itemCount: quizzes.length,
  //                 itemBuilder: (context, i) => _quizzes(quizzes[i])
  //             ),
  //                ];
  //   return quiz;

  // }

  Widget _quizzes(Quiz quiz){


return ListTile(
          leading: Icon(Icons.video_call,color: Colors.indigoAccent,),
          //  Icon(Icons.album, size: 50),
          title: Text('${quiz.title}'),
          subtitle: Text('subtitulo'),
          trailing: Icon(Icons.check_box_outline_blank, color: Colors.grey), 
          );

  }
}