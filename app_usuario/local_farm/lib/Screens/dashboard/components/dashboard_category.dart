import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (BuildContext context){
              //       return CategoriesScreen();
              //     },
              //   ),
              // );
            }
          : widget.tap,
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        elevation: 4.0,
        child: Padding(
          padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Container(
                  child: SvgPicture.asset(
                    // 'assets/icons/apple.svg',
                    widget.icon,
                    color: Colors.orange[800],
                    height: 24,
                    width: 24,
                  ),
                ),
              ),
              SizedBox(width: 0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // SizedBox(height: 10.0),
                  Text(
                    "${widget.title}",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.grey,
                      fontSize: 17,
                    ),
                  ),
                  // Text(
                  //   "${widget.items} Items",
                  //   style: TextStyle(
                  //     fontWeight: FontWeight.w400,
                  //     fontSize: 10,
                  //   ),
                  // ),
                  // SizedBox(height: 5),
                ],
              ),
              SizedBox(width: 5),
            ],
          ),
        ),
      ),
    );
  }
}
