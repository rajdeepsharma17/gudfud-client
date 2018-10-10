import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './menuList.dart';
import '../Navigate/navigate.dart';

class Menu extends StatefulWidget {
  @override
  MenuState createState() => new MenuState();
}

class MenuState extends State<Menu> {

  List<Widget> cards = new List.generate(20, (i)=>new Menu1());
  List data;
  void initState() {
    fetchPost();
    super.initState();
  }

  Future fetchPost() async {
    final response = await http.get(
        Uri.encodeFull("http://0.0.0.0:8555/catalog"),
        headers: {"Accept": "application/json"});
    if (response.statusCode == 200) {
      this.setState(() {
        data = json.decode(response.body)["result"];
      });
      print(data);
    } else {
      throw Exception('Failed to load post');
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
          length: 3,
          child: Scaffold(
            drawer: Navigate(),
            appBar: AppBar(
              bottom: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.directions_car)),
                  Tab(icon: Icon(Icons.directions_bike)),
                  Tab(icon: Icon(Icons.directions_walk)),
                ],
              ),
              title: Text('Dérive', style: TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: 'ProductSans',
              ),),
            ),
            body: TabBarView(
              children: [
                ListView(children: cards),
                ListView(children: cards),
                ListView(children: cards)
              ],
            ),
          ),
    );
  }
}

class Menu1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Card(
  child: new Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      const ListTile(
        leading: const Icon(Icons.album),
        title: const Text('Phase 3'),
        subtitle: const Text('Posted by: Raj'),
      ),
      new ButtonTheme.bar( // make buttons use the appropriate styles for cards
        child: new ButtonBar(
          children: <Widget>[
            new FlatButton(
              child: const Text('DETAILS'),
              onPressed: () { /* ... */ },
            ),
            new FlatButton(
              child: const Text('CONTACT'),
              onPressed: () { /* ... */ },
            ),
          ],
        ),
      ),
    ],
  ),
);
  }

}

