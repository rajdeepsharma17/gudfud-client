import 'package:flutter/material.dart';
import 'globals.dart' as globals;

class Settings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SettingsState();
  }

}

class SettingsState extends State<Settings>{

  @override
    void initState() {
      print("settings" + globals.user.displayName);
      super.initState();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigate back to first screen when tapped!
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}