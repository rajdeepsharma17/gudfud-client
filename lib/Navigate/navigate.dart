import 'package:flutter/material.dart';

import '../Maps/maps.dart';
import './settings.dart';
import '../Menu/menu.dart';
import './share.dart';
import './about.dart';


class Navigate extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Profile'),
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: ExactAssetImage('assets/air-hostess.png'),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.search),
            title: Text('Search for a Ride'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Menu()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.airport_shuttle),
            title: Text('Share a Ride'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ShareRide()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Settings()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.more),
            title: Text('About'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => About()),
              );
            },
          ),
        ],
      ),
    );
  }

}