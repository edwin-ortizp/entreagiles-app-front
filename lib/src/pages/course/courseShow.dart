// import 'dart:js';
// import 'dart:js';

import 'package:QuizLab/src/models/Course.dart';
import 'package:QuizLab/src/pages/course/ArticleShow.dart';
import 'package:QuizLab/src/pages/course/pdfShow.dart';
import 'package:QuizLab/src/providers/courseProvider.dart';
import 'package:QuizLab/src/utils/courses_bloc.dart';
import 'package:QuizLab/src/validations/provider.dart';
import 'package:QuizLab/src/utils/preferencesUser.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

class CourseShow extends StatefulWidget {
  @override
  _CourseShowState createState() => _CourseShowState();
}

class _CourseShowState extends State<CourseShow> {
  final prefs = new PreferencesUser();
  MyCoursesBloc myCoursesBloc;
  final coursesProvider = new CourseProvider();

  // bool values = false;
  CourseModel course = new CourseModel();
  // int _ultimoItem = 0;
  // final coso = [];

  Future<void> _launched;

  // int refreshw;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    myCoursesBloc = Provider.myCoursesBloc(context);
    // super.initState();
    final CourseModel courseData = ModalRoute.of(context).settings.arguments;
   
    var height = MediaQuery.of(context).size.height;
    if (courseData != null) {
      course = courseData;
    // setState(() {
    print("variable ${course}");
      
    // });
    }
    return Scaffold(body: _appbarCustom(course, context));
  }

  Widget _appbarCustom(CourseModel course, BuildContext context) {
    // const String toLaunch = 'https://novapixel.org/eureka/public/buy-course/6';
    return RefreshIndicator(
      onRefresh: refresh,
          child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            elevation: 2.0,
            backgroundColor:
                (prefs.colorSecundario) ? Colors.purple[400] : Colors.white,
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            iconTheme: (prefs.colorSecundario)
                ? new IconThemeData(color: Colors.white)
                : new IconThemeData(color: Colors.black),
                 actions: (course.course != "Belong") ?<Widget>[
              IconButton(
                icon: const Icon(Icons.add_shopping_cart),
                tooltip: 'Comprar Curso',
                   onPressed: () => setState(() {
                    _launched = _launchInBrowser('https://quizlab.app/public/index.php/buy-course/${course.id}');
                  }),
              ),
            ]:[],
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text('${course.name}',
                  style: (prefs.colorSecundario)
                      ? TextStyle(color: Colors.white, fontSize: 15)
                      : TextStyle(color: Colors.black, fontSize: 15)),
              background: FadeInImage(
                placeholder: AssetImage('assets/cargando1.gif'),
                image: (course.imagePath == null || course.imagePath == "")
                    ? AssetImage('assets/banner.png')
                    : NetworkImage(
                        'https://quizlab.app/public/img/courses/${course.name}.jpg'),
                        // 'https://ep01.epimg.net/elpais/imagenes/2019/10/30/album/1572424649_614672_1572453030_noticia_normal.jpg'),
                // fadeInDuration: Duration(microseconds: 60),
                fit: BoxFit.cover,
              ),
            ),
          ),
          _loadSections(),
        ],
      ),
    );
  }

  Widget _loadSections() {
    final sections = course.sections;
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int i) {
          return Center(
            child: Card(
              margin: EdgeInsets.all(20.0),
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                children: <Widget>[
                  new ExpansionTile(
                    trailing: Icon(
                      Icons.add,
                      color: Colors.indigoAccent[700],
                    ),
                    title: new Text('Sección ${i + 1}'),
                    // subtitle: (course.course == "Belong") ? Text("${sections[i].name} (${sections[i].countCompleted}/${sections[i].countArticule})"):Text("${sections[i].name}"),
                    subtitle: (course.course == "Belong") ? Text("${sections[i].name} "):Text("${sections[i].name}"),
                    children: <Widget>[
                      GestureDetector(
                        // onTap:  () => Navigator.pushNamed(context, 'buttonBarBottomArticle',arguments: sections[i]),
                        child: new Column(
                          children: quizContent(context,sections[i]),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        childCount: sections.length,
      ),
    );
  }

   quizContent(BuildContext context, Section section) {
    //  final todos = course.genera;
    List<Widget> quizContent = [];
    // if (section.quizzes.isNotEmpty) {
     
    // } else if(section.articles != null){
              // bool cc = true;
      int i =1; 
      for (Article article in section.articles)
        quizContent.add(

          GestureDetector(
            
            onTap:   () {
              bool values = false;
              //  (course.course == "Belong")?(article.ppt != null && article.pdf == null  ) ?  setState(() {_launched = _launchInWebViewWithJavaScript('${article.ppt}');}):  Navigator.pushNamed(context, 'pdfShow',arguments : article): null;
              //  (course.course == "Belong")? Navigator.pushNamed(context, 'pdfShow',arguments : article): null;
              // //  (course.course == "Belong")?  Navigator.push(
              //                 context,
              //                 MaterialPageRoute(
              //                     builder: (context) =>
              //                         PdfShow(pdf:article.pdf))): null;
              int articlePdf;
              int articleContent;
              int articleVideo;
              int articlePpt;
              if(article.pdf.toString().isEmpty || article.pdf == null  )
              articlePdf = 0;
              if(article.content.toString().isEmpty || article.content == null  )
              articleContent = 0;
              if(article.video.toString().isEmpty || article.video == null  )
              articleVideo = 0;
              if(article.ppt.toString().isEmpty || article.ppt == null  )
              articlePpt = 0;
              // (course.course == "Belong") ? coursesProvider.articleLoad(article.id.toString()): null;
              // (course.course == "Belong") ?
              if(course.course == "Belong"){
                // if(article.video == null && article.content == null&& article.ppt != null && article.pdf == null ||article.video.toString().isEmpty  && article.content == "" && article.ppt != null && article.pdf == null ){
                if(articleVideo == 0 && articleContent == 0 && articlePpt != 0 &&  articlePdf == 0){
                  setState(() {_launched = _launchInWebViewWithJavaScript('${article.ppt}');});
                  coursesProvider.articleLoad(article.id.toString());
                  print("Ppt ${article.ppt.toString()}");
                }else if(articleVideo == 0 && articleContent == 0 && articlePpt == 0 ){
                  Navigator.pushNamed(context, 'pdfShow',arguments : article);
                  coursesProvider.articleLoad(article.id.toString());
                  print("PDF ${article.pdf.toString()}");
                }else{
                  Navigator.pushNamed(context, 'articleShow',arguments : article);
                  coursesProvider.articleLoad(article.id.toString());
                  // print("video ${article.video.toString()}");
                  // print("content ${article.content.toString()}");
                }
              }else{
                null;
              }
              // (course.course == "Belong") ? myCoursesBloc.courseForUser.first: null;
                  // final vasaas = false;
              //  setState(() {
              //   // course =  myCoursesBloc;
              //    int refreshw;
              //    print("${article.name} ${article.status}");
              //     //  values = true;
              //       // coso.add(article.name);
              //       ++i;
              //   //  print("${coso}");
              //   });
              // refresh();
              //  onTap: () {
              // Navigator.push(context,MaterialPageRoute(builder: (context) => ArticleShowPage(curso: course)),
              // );
            // },
            },
            child: 
            new ListTile(
              title: new Text("${article.name} "),
              leading: (article.video.toString() != '' && article.content.toString() == ''&& article.ppt.toString() == '' && article.pdf.toString() == '')
                  ? Icon(Icons.video_call, color: Colors.blue)
                  : (article.video.toString() != '' && article.content.toString() != ''&& article.ppt.toString() == '' && article.pdf.toString() == '')
                  ?Icon(Icons.video_call, color: Colors.red)
                  :(article.video.toString() == '' && article.content.toString() == ''&& article.ppt.toString() != '' && article.pdf.toString() == '')
                  ?Icon(Icons.assignment, color: Colors.blue[300])
                  :(article.video.toString() == '' && article.content.toString() == ''&& article.ppt.toString() == '' && article.pdf.toString() != '')
                  ?Icon(Icons.assignment, color: Colors.red[300])
                  :Icon(Icons.assignment, color: Colors.green[300])
                  
              // subtitle: Text('subtitulo ${article.status}'),
              // trailing: (course.course != "Belong") ?null:(article.status == "completed")?Icon(Icons.check_box, color: Colors.green):Icon(Icons.check_box_outline_blank, color: Colors.grey),
              // trailing:Checkbox(value: (article.status == "completed"||article.name == coso[coso.length-1])?true:false, onChanged: (bool value){setState(() { (course.course != "Belong") ?null:(article.status == "completed")?true:false;});})
            ),
          ),
        // print(" sadjhaskjdhjkasdhjk ${article.name} ${article.status}"),
        );
    // }

     for (Quiz quiz in section.quizzes)
        quizContent.add(
          GestureDetector(
            onTap:   () {
            (course.course == "Belong") ?_showDialogQuiz()
            : null;
            },
            child: new ListTile(
              title: new Text("${quiz.title}"),
              leading: Icon(Icons.description, color: Colors.blueAccent),
              // trailing: Icon(Icons.check_box_outline_blank, color: Colors.grey),
            ),
          ),
        );
    return quizContent;
  }

   Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }
   Future<Null> refresh()async{
    final duration = new Duration( seconds:2);
    new Timer(duration, (){
      Navigator.popAndPushNamed(context, 'courseShow',arguments: course);
      // Navigator.pushNamed(context, 'home');
      // _appbarCustom(course,context);
      setState(() {
      _loadSections();
        
      });
    });
    return Future.delayed(duration);
  }

Future<void> _launchInWebViewWithJavaScript(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        enableJavaScript: true,
      );
    } else {
      throw 'Could not launch $url';
    }
  }
  String slice(String subject, [int start = 0, int end]) {
  if (subject is! String) {
    return '';
  }

  int _realEnd;
  int _realStart = start < 0 ? subject.length + start : start;
  if (end is! int) {
    _realEnd = subject.length;
  } else {
    _realEnd = end < 0 ? subject.length + end : end;
  }

  return subject.substring(_realStart, _realEnd);
}


  _showDialogQuiz() {
    showDialog(
      context: context,
      builder: (context) {
        return GestureDetector(
                  child: AlertDialog(
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            title:  Text('Realizar Quiz'),
            content:  Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('¿Estás seguro(a) de iniciar el quiz? Deberas acceder a la plataforma'),
                // FlutterLogo(size: 100.0,),
                SizedBox(height: 30.0),
                FadeInImage(
                  image: NetworkImage('assets/cargando1.gif'),
                  placeholder:AssetImage('assets/logo-indigo.png') ,
                  fadeInDuration: Duration(milliseconds: 200),
                  height: 100.0,
                  fit: BoxFit.cover,
                  )
              ],
            ),
             actions: <Widget>[
            FlatButton( 
              child: Text('Ir',style: TextStyle(fontSize: 20),),
              onPressed: () {
                setState(() {
                    _launched = _launchInBrowser('https://quizlab.app/public/index.php/section-course/${course.id}');
                  });
                   Navigator.of(context).pop();
              },
            )
          ],
          // crossAxisAlignment: CrossAxisAlignment.center,
          ),
        );
      }
    );
  }


  
  
}
