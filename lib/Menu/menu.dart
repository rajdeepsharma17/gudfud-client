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
  void initState(){
    fetchPost();
    super.initState();
  }

  Future fetchPost() async {
    final response =
      await http.get(
        Uri.encodeFull("http://192.168.43.134:8555/catalog"),
        headers: {
          "Accept": "application/json"
        }
      );
    if (response.statusCode == 200) {
      this.setState((){
        data = json.decode(response.body)["result"];
      });
      print(data);
    } else {
      throw Exception('Failed to load post');
    }
  }
  
    @override
    Widget build(BuildContext context) {
      return Scaffold (
        drawer: Navigate(),
        appBar: AppBar(
          title: Text('GUDFUD', style: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: 'ProductSans',
          ),),
        ),
        body: MenuList(data),
      );
    }
  
    
  }







  // void _pushSaved() {/
  //     Navigator.of(context).push(
  //       new MaterialPageRoute<void>(
  //         builder: (BuildContext context) {
  //           final Iterable<ListTile> tiles = _saved.map(
  //                 (WordPair pair) {
  //               return new ListTile(
  //                 title: new Text(
  //                   pair.asPascalCase,
  //                   style: _biggerFont,
  //                 ),
  //               );
  //             },
  //           );
  //           final List<Widget> divided = ListTile
  //               .divideTiles(
  //             context: context,
  //             tiles: tiles,
  //           )
  //               .toList();
  
  //           return new Scaffold(         // Add 6 lines from here...
  //             appBar: new AppBar(
  //               title: const Text('Checkout'),
  //             ),
  //             body: new ListView(children: divided),
  //           );                           // ... to here.
  //         },
  //       ),
  //     );
  //   }