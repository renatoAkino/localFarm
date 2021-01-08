import 'package:flutter/material.dart';
import 'package:localfarm/Screens/cart_screen.dart';

class CartIconWidget extends StatefulWidget {
  @override
  _CartIconWidgetState createState() => _CartIconWidgetState();
}

class _CartIconWidgetState extends State<CartIconWidget> {
  int counter = 1;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        new IconButton(
            icon: Icon(Icons.shopping_cart_outlined),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  // builder: (context) => CartScreen(),
                  builder: (context) => CartScreen(),
                ),
              );
            }),
        counter != 0
            ? new Positioned(
                right: 8,
                top: 6,
                child: new Container(
                  padding: EdgeInsets.all(2),
                  decoration: new BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 14,
                    minHeight: 14,
                  ),
                  child: Text(
                    '$counter',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            : new Container()
      ],
    );
  }
}
