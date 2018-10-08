import 'package:flutter/material.dart';
import 'package:flutter_walkthrough/flutter_walkthrough.dart';
import 'package:flutter_walkthrough/walkthrough.dart';
import '../Menu/menu.dart';

class Intro extends StatelessWidget {
  final List<Walkthrough> list = [
    Walkthrough(
      title: "Dérive",
      content: "Book rides within your own organization",
      imageIcon: Icons.airport_shuttle,
    ),
    Walkthrough(
      title: "Cheap rides",
      content: "Cost Effective",
      imageIcon: Icons.attach_money,
    ),
    Walkthrough(
      title: "Notify",
      content: "Get notified when rides available",
      imageIcon: Icons.calendar_today,
    ),
    Walkthrough(
      title: "Chat",
      content: "Meet new people!",
      imageIcon: Icons.chat,
    ),
    Walkthrough(
      title: "Security",
      content: "Verified Users",
      imageIcon: Icons.verified_user,
    ),
    Walkthrough(
      title: "Get Started",
      content: "Book your ride now!!",
      imageIcon: Icons.departure_board,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return new IntroScreen(
      list,
      MaterialPageRoute(builder: (context) => Menu()),
    );
  }
}