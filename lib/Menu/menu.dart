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
  List data;
  void initState() {
    fetchPost();
    super.initState();
  }

  Future fetchPost() async {
    final response = await http.get(
        Uri.encodeFull("http://192.168.43.134:8555/catalog"),
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
                MenuList(data),
                Icon(Icons.directions_bike),
                Icon(Icons.directions_walk),
              ],
            ),
          ),
    );
  }
}

