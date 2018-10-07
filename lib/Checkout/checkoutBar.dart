import 'package:flutter/material.dart';


class CheckoutBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
          children: <Widget>[
            Expanded(
              child: Container(
                height: 48.0,
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text('CHECKOUT', style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),),
                      ),
                      Expanded(
                        child: Text('₹ 225', textAlign: TextAlign.end, style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),),
                      )
                    ],
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 12.0),              ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0.0, -1.0),
                      blurRadius: 0.5,
                      color: Colors.black12
                    )
                  ]
                ),
              ),
            )
          ],
        );
  }
}