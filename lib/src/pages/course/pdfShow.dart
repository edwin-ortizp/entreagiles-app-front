// import 'package:QuizLab/src/models/Course.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';

// class PdfShow extends StatefulWidget {
//     final String path;
//  const PdfShow({Key key, this.path}) : super(key: key);

//   @override
//   _PdfShowState createState() => _PdfShowState();
// }

// class _PdfShowState extends State<PdfShow> {
  
//   int _totalPages = 0;
//   int _currentPage = 0;
//   bool pdfReady = false;
//   PDFViewController _pdfViewController;

//   Widget build(BuildContext context) {
//    final Article articleData = ModalRoute.of(context).settings.arguments;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("My Document"),
//       ),
//       body: Stack(
//         children: <Widget>[
//           PDFView(
//             filePath: widget.path,
//             autoSpacing: true,
//             enableSwipe: true,
//             pageSnap: true,
//             swipeHorizontal: true,
//             nightMode: false,
//             onError: (e) {
//               print(e);
//             },
//             onRender: (_pages) {
//               setState(() {
//                 _totalPages = _pages;
//                 pdfReady = true;
//               });
//             },
//             onViewCreated: (PDFViewController vc) {
//               _pdfViewController = vc;
//             },
//             onPageChanged: (int page, int total) {
//               setState(() {});
//             },
//             onPageError: (page, e) {},
//           ),
//           !pdfReady
//               ? Center(
//                   child: CircularProgressIndicator(),
//                 )
//               : Offstage()
//         ],
//       ),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: <Widget>[
//           _currentPage > 0
//               ? FloatingActionButton.extended(
//                   backgroundColor: Colors.red,
//                   label: Text("Go to ${_currentPage - 1}"),
//                   onPressed: () {
//                     _currentPage -= 1;
//                     _pdfViewController.setPage(_currentPage);
//                   },
//                 )
//               : Offstage(),
//           _currentPage+1 < _totalPages
//               ? FloatingActionButton.extended(
//                   backgroundColor: Colors.green,
//                   label: Text("Go to ${_currentPage + 1}"),
//                   onPressed: () {
//                     _currentPage += 1;
//                     _pdfViewController.setPage(_currentPage);
//                   },
//                 )
//               : Offstage(),
//         ],
//       ),
//     );
//   }
//   _initPdf() async{

//   }
// }


import 'dart:async';

import 'package:QuizLab/src/models/Course.dart';
import 'package:QuizLab/src/utils/preferencesUser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';


class PdfShow extends StatefulWidget {
  //  final  pdf;

  // const PdfShow({Key key, this.pdf}) : super(key: key);


  @override
  _PdfShowState createState() => _PdfShowState();
}

class _PdfShowState extends State<PdfShow> {
   final prefs = new PreferencesUser();

   bool _isLoading = true;
  String pdf;
   PDFDocument document;

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
     if(_isLoading){
    Timer.run((){
    _loadPdf();
    });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Article article = ModalRoute.of(context).settings.arguments;
    setState(() {
      pdf = article.pdf;
      print(pdf);
    });
    return Scaffold(
       backgroundColor: (prefs.colorSecundario)?Colors.grey[850] :Color(0xFFEFEEEE),
      appBar: AppBar(
             centerTitle: true,
         title: Text('${article.name}',
              style: (prefs.colorSecundario)
                  ? TextStyle(color: Colors.grey)
                  : TextStyle(color: Colors.black)),
          // backgroundColor: Colors.purple[400],
          iconTheme: (prefs.colorSecundario)
              ? new IconThemeData(color: Colors.grey)
              : new IconThemeData(color: Colors.black),
          backgroundColor:
              (prefs.colorSecundario) ? Colors.grey[850]  : Color(0xFFEFEEEE),
              elevation: 0.0,
      ),
      body: Center(child: _isLoading ? Center(child: CircularProgressIndicator(),)
      :PDFViewer(document: document,
      // widget.document.count
      
       showPicker: (document.count < 2)? false: true, 
       showIndicator:(document.count < 2)? false:true,
       showNavigation: true,
      //  ind
      // indicatorText: ,

      //  indicatorBackground: ,
      
      ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _loadPdf,
      //   tooltip: 'Pdf',
      //   child: Icon(Icons.note),
      //   ),
    );
  }

  void _loadPdf() async{
 
   document = await PDFDocument.fromURL("${pdf}");
  setState(() {
  //  print(document.count);
    _isLoading = false;
  });

  }
}

