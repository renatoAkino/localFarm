import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../categories_screen.dart';

class ListaCategoriasWidget extends StatefulWidget {
  final String icon;
  final String title;
  // final String items;
  final Function tap;
  final bool isHome;

  ListaCategoriasWidget(
      {Key key,
      @required this.icon,
      @required this.title,
      // @required this.items,
      this.tap,
      this.isHome})
      : super(key: key);

  @override
  _ListaCategoriasWidgetState createState() => _ListaCategoriasWidgetState();
}

class _ListaCategoriasWidgetState extends State<ListaCategoriasWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.isHome
          ? () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return CategoriesScreen();
                  },
                ),
              );
            }
          : widget.tap,
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Container(
          height: 90,
          width: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey[300],
                blurRadius: 5.0, // soften the shadow
                spreadRadius: 1.0, //extend the shadow
                // offset: Offset(
                //   15.0, // Move to right 10  horizontally
                //   15.0, // Move to bottom 10 Vertically
                // ),
              )
            ],
          ),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.0, top: 10),
                child: SvgPicture.asset(
                  // 'assets/icons/apple.svg',
                  widget.icon,
                  // color: Colors.orange[800],
                  color: Colors.green,
                  height: 35,
                  width: 35,
                ),
              ),
              Positioned(
                top: 45,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      color: Colors.green,
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
