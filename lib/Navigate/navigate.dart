import 'package:flutter/material.dart';


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
            ),
          ),
          ListTile(
            title: Text('Item 1'),
            onTap: () {
            },
          ),
          ListTile(
            title: Text('Item 2'),
            onTap: () {
            },
          ),
        ],
      ),
    );
  }

}