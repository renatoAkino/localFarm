import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String name;
  final String img;
  final double price;
  final int quantity;
  final String fazendaName;
  // final bool isFav;

  CartItem({
    Key key,
    @required this.name,
    @required this.img,
    @required this.price,
    @required this.quantity,
    @required this.fazendaName,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
      child: InkWell(
        onTap: () {
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (BuildContext context){
          //       return ProductDetails();
          //     },
          //   ),
          // );
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 0.0, right: 10.0),
                  child: Container(
                    color: Colors.white,
                    height: MediaQuery.of(context).size.width / 3.5,
                    width: MediaQuery.of(context).size.width / 3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        "$img",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "$name",
                      style: TextStyle(
                        fontSize: 20,
                        // fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Row(
                      children: <Widget>[
                        // SmoothStarRating(
                        //   starCount: 1,
                        //   color: Constants.ratingBG,
                        //   allowHalfRating: true,
                        //   rating: 5.0,
                        //   size: 12.0,
                        // ),
                        // SizedBox(width: 6.0),
                        Text(
                          fazendaName,
                          style: TextStyle(
                            // fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Text(
                          "Quantidade:",
                          style: TextStyle(
                            // fontSize: 11.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          quantity.toString(),
                          style: TextStyle(
                            // fontSize: 14.0,
                            fontWeight: FontWeight.w900,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: <Widget>[
                        Text(
                          "Total",
                          style: TextStyle(
                              // fontSize: 11.0,
                              // fontWeight: FontWeight.w300,
                              ),
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          price.toString(),
                          style: TextStyle(
                            // fontSize: 14.0,
                            fontWeight: FontWeight.w900,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Container(
              height: 30,
              width: 50,
              child: FlatButton(
                // color: Theme.of(context).accentColor,
                color: Colors.red,
                child: Center(
                  child: Icon(
                    Icons.delete,
                    size: 20,
                    color: Colors.white,
                    textDirection: TextDirection.rtl,
                  ),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
