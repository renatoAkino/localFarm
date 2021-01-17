import 'package:flutter/material.dart';

class WeekButtonsWidget extends StatefulWidget {
  final String day;
  final String name;
  bool isToday;
  // final String items;

  WeekButtonsWidget({
    Key key,
    @required this.day,
    @required this.name,
    @required this.isToday,
    // @required this.items,
  }) : super(key: key);

  @override
  WeekButtonsWidgetState createState() => WeekButtonsWidgetState();
}

class WeekButtonsWidgetState extends State<WeekButtonsWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (BuildContext context) {
        //       return CategoriesScreen();
        //     },
        //   ),
        // );
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 15),
        child: widget.isToday
            ? Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.green,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[100],
                      blurRadius: 2.0, // soften the shadow
                      spreadRadius: 1.0, //extend the shadow
                      // offset: Offset(
                      // 5.0, // Move to right 10  horizontally
                      // 2.0, // Move to bottom 10 Vertically
                      // ),
                    )
                  ],
                ),
                child: Stack(
                  children: [
                    // Text(widget.day),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Center(
                          child: Text(
                            widget.day,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 25,
                      right: 0,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          widget.name,
                          style: TextStyle(
                            color: Colors.grey[100],
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[300],
                      blurRadius: 5.0, // soften the shadow
                      spreadRadius: 2.0, //extend the shadow
                      offset: Offset(
                        5.0, // Move to right 10  horizontally
                        2.0, // Move to bottom 10 Vertically
                      ),
                    )
                  ],
                ),
                child: Stack(
                  children: [
                    // Text(widget.day),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Center(
                          child: Text(
                            widget.day,
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 25,
                      right: 0,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          widget.name,
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
