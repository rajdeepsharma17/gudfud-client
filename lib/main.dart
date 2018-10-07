import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

import './Menu/menu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.white);

    return MaterialApp(
      title: 'Startup',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(          // Add the 3 lines from here...
        primaryColor: Colors.white,
      ),
      home: Menu(),
    );
  }
}

