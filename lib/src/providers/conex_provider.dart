import 'dart:io'; //InternetAddress utility
import 'dart:async'; //For StreamController/Stream
import 'package:connectivity/connectivity.dart';

// class ConnectionStatusSingleton {
//   //This creates the single instance by calling the `_internal` constructor specified below
//   staticfinalConnectionStatusSingleton _singleton =newConnectionStatusSingleton._internal();
//   ConnectionStatusSingleton._internal();
//   //This is what's used to retrieve the instance through the app
//   staticConnectionStatusSingletongetInstance() => _singleton;
//   //This tracks the current connection status
//   bool hasConnection =false;
//   //This is how we'll allow subscribing to connection changes
//   StreamController connectionChangeController =newStreamController.broadcast();
//   //flutter_connectivity
//   finalConnectivity _connectivity =Connectivity();
//   //Hook into flutter_connectivity's Stream to listen for changes
//   //And check the connection status out of the gate
//   voidinitialize() {
//     _connectivity.onConnectivityChanged.listen(_connectionChange);
//     checkConnection();
//   }

// StreamgetconnectionChange => connectionChangeController.stream;

//  //A clean up method to close our StreamController
//  // Because this is meant to exist through the entire application life cycle this isn't
//  // really an issue
//  voiddispose() {
//  connectionChangeController.close();
//  }
//  //flutter_connectivity's listener
//  void_connectionChange(ConnectivityResult result) {
//  checkConnection();
//  }
//  //The test to actually see if there is a connection
//  FuturecheckConnection() async {
//  bool previousConnection = hasConnection;
//  try {
//  final result =awaitInternetAddress.lookup('google.com');
//  if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
//  hasConnection = true;
//  } else {
//  hasConnection = false; 
//  }
//  } on SocketException catch(_) {
//  hasConnection = false;
//  }
//  //The connection status changed send out an update to all listeners
//  if (previousConnection != hasConnection) {
//  connectionChangeController.add(hasConnection);
//  }
//  return hasConnection;
//  }
// }



// import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class ConecPage extends StatefulWidget {

  @override
  _ConecPageState createState() => _ConecPageState();
}

class _ConecPageState extends State<ConecPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Internet connectivity'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Check connectivity'),
          onPressed: checkInternetConnectivity,
        )
      )
    );
  }

  checkInternetConnectivity() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      _showDialog(
        'No internet', 
        "You're not connected to a network"
      );
    } else if (result == ConnectivityResult.mobile) {
      _showDialog(
        'Internet access',
        "You're connected over mobile data"
      );
    } else if (result == ConnectivityResult.wifi) {
      _showDialog(
        'Internet access',
        "You're connected over wifi"
      );
    }
  }

  _showDialog(title, text) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(text),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      }
    );
  }
}
