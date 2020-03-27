// import 'dart:html';

import 'package:QuizLab/src/models/Course.dart';
import 'package:QuizLab/src/providers/courseProvider.dart';
import 'package:QuizLab/src/utils/preferencesUser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:webview_flutter/webview_flutter.dart';
// import 'package:webview_flutter/webview_flutter.dart';

class ArticleShowPage extends StatelessWidget {
  // const name({Key key}) : super(key: key);
  final prefs = new PreferencesUser();
  final coursesProvider = new CourseProvider();

  @override
  Widget build(BuildContext context) {
    final Article articleData = ModalRoute.of(context).settings.arguments;
    final Article sectionData = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Welcome ${prefs.nombre}',
              style: (prefs.colorSecundario)
                  ? TextStyle(color: Colors.white)
                  : TextStyle(color: Colors.black)),
          // backgroundColor: Colors.purple[400],
          iconTheme: (prefs.colorSecundario)
              ? new IconThemeData(color: Colors.white)
              : new IconThemeData(color: Colors.black),
          backgroundColor:
              (prefs.colorSecundario) ? Colors.purple[400] : Colors.white
          ),
        //  body: HtmlWidget(
        //   """
        //   <html><body><br><iframe src="${articleData.video}" width="560" height="415"></iframe></body></html>
        //   """,
        //   webView: true,
        // ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                _video(articleData),
                SizedBox(height: 15.0,),
                Text(articleData.name,style: TextStyle(fontSize: 25.0,color: Color(0XFFF004368)),),
                Divider(
                  indent:  15,
                  endIndent: 15,
                  color: Color(0XFFF004368),
                  thickness: 2,
                ),
                _content(articleData)
              ],
            ),
          ),
        ),
        
                   );
          
  }
  Widget _video(Article article){
//   return  WebView(
// // initialUrl: Uri.dataFromString('<html><body><br><iframe src="https://www.youtube.com/watch?v=9y1ZLTgO73o&list=RDZpCcOVjHty0&index=4"  style="width:100%; min-height:500px"  frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe></body></html>', mimeType: 'text/html').toString(),
// // initialUrl: "https://www.youtube.com/watch?v=9y1ZLTgO73o&list=RDZpCcOVjHty0&index=4",
// initialUrl: Uri.dataFromString('<html><body><iframe width="520" height="315" src="${article.content}" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></body></html>', mimeType: 'text/html').toString(),
//       javascriptMode: JavascriptMode.unrestricted,
//     );
// return  IFrameElement()
return HtmlWidget(
          """
          <html><body><br><iframe src="${article.video}" width="560" height="415"></iframe></body></html>
          """,
          webView: true,
        );
  }
  Widget _content(Article article){
  // return  Container(
  //             child: Card(
  //               child: Html(data:"${article.content}",
  //                   // style: TextStyle(
  //                   //     fontSize: 12, color: Colors.purple),
  //                   // overflow: TextOverflow.ellipsis,
  //                   // maxLines: 3, 
  //                       ),
  //             ),
  // );
return Container(
  padding: EdgeInsets.all(15.0),
  child:   HtmlWidget(
  
            """
  
            ${article.content}
  
            """,
  
            webView: true,
  
          ),
);
  }
  // Widget _ppt(Article article){
  // return Container(
  //           child: Card(
  //             child: Html(data:"${article.p}",
  //                 // style: TextStyle(
  //                 //     fontSize: 12, color: Colors.purple),
  //                 // overflow: TextOverflow.ellipsis,
  //                 // maxLines: 3, 
  //                     ),
  //           ),
  //         );

  // }
}