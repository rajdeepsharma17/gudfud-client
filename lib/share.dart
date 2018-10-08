import 'package:flutter/material.dart';

class ShareRide extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ShareRideState();
  }
}

class ShareRideState extends State<ShareRide>{

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

