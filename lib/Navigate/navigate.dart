import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


class Navigate extends StatelessWidget {

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<FirebaseUser> _handleSignIn() async {
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    FirebaseUser user = await _auth.signInWithGoogle(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    print("signed in " + user.displayName);
    return user;
  }

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
              _handleSignIn();
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