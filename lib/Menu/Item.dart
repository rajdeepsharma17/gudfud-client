import 'package:flutter/material.dart';


class Item extends StatelessWidget {

  final item;
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);

  Item(this.item);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      ListTile(
      leading: Container(
        width: 40.0,
        height: 40.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: NetworkImage(item["image"]))
        ),
      ),
      title: Text(
        item["name"],
        style: _biggerFont,
      ),
      subtitle: Text('₹' + item["price"].toString()),
      trailing: Icon(Icons.plus_one),
    ),
    Divider()
    ],);
  }
}