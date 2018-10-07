import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:splashscreen/splashscreen.dart';

import './Menu/menu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.white);

    return MaterialApp(
      title: 'Startup',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: SplashScreen(
        seconds: 3,
        navigateAfterSeconds: Menu(),
        title: Text('Welcome In SplashScreen',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0
        ),),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        onClick: ()=>print("Flutter Egypt"),
        loaderColor: Colors.red
      ),
    );
  }
}

