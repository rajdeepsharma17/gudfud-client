import 'package:flutter/material.dart';

import './Item.dart';
import '../Checkout/checkoutBar.dart';


class MenuList extends StatelessWidget {

  final List data;

  MenuList(this.data);


  @override
  Widget build(BuildContext context) {
   return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: data == null? 0 : data.length,
              itemBuilder: (context, i) {
                return Item(data[i]); 
              }),
        ),
        CheckoutBar()
      ],
    );
    }
}

  
    
  
    