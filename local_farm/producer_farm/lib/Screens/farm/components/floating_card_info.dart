import 'package:flutter/material.dart';

class FloatingCard extends StatefulWidget {
  @override
  _FloatingCardState createState() => _FloatingCardState();
}

class _FloatingCardState extends State<FloatingCard> {
  //
  // final controller = HomeController();

  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 1.5,
      margin: EdgeInsets.only(
          bottom: deviceHeight(context) * 0.18, left: 25.0, right: 25.0),
      color: Colors.white,
      child: Container(
        width: deviceHeight(context) * 0.5,
        height: deviceWidth(context) * 0.22,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '42',
                  // cargo ?? '',
                  textAlign: TextAlign.start,
                  style: new TextStyle(
                      color: Colors.black87,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Novos\nPedidos',
                  // depto ?? '',
                  textAlign: TextAlign.start,
                  style: new TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '12',
                  // cargo ?? '',
                  textAlign: TextAlign.start,
                  style: new TextStyle(
                      color: Colors.black87,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Pedidos\nAbertos',
                  // depto ?? '',
                  textAlign: TextAlign.start,
                  style: new TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '15',
                  // cargo ?? '',
                  textAlign: TextAlign.start,
                  style: new TextStyle(
                      color: Colors.black87,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Entregas\nHoje',
                  // depto ?? '',
                  textAlign: TextAlign.start,
                  style: new TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
