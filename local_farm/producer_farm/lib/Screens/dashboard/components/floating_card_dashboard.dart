import 'package:flutter/material.dart';

class FloatingCardDashboard extends StatefulWidget {
  List listInfoCards;
  int index;
  FloatingCardDashboard({Key key, this.listInfoCards, this.index})
      : super(key: key);

  @override
  _FloatingCardDashboardState createState() => _FloatingCardDashboardState();
}

class _FloatingCardDashboardState extends State<FloatingCardDashboard> {
  //
  // final controller = HomeController();

  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey[300].withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          // color: Colors.green.withOpacity(0.7),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.listInfoCards[widget.index]['count'].toString(),
                style: TextStyle(
                  fontSize: 60,
                  // color: Colors.blueGrey,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.listInfoCards[widget.index]['title'],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  // color: Colors.grey[500],
                  color: Colors.green,

                  // fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
