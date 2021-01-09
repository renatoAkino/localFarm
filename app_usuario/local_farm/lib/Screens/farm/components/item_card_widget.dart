import 'package:flutter/material.dart';
import 'package:localfarm/Datas/product_data.dart';

import '../../../constants.dart';

class ItemCard extends StatelessWidget {
  final ProductData product;
  final Function press;

  const ItemCard({
    Key key,
    this.product,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              // For  demo we use fixed height  and width
              // Now we dont need them
              // height: 180,
              // width: 160,
              decoration: BoxDecoration(
                // color: product.color,
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Hero(
                tag: "${product.id}",
                child: Image.network(
                  product.images['0'],
                  // fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 15 / 4),
          //   child: Text(
          //     // products is out demo list
          //     product.title,
          //     style: TextStyle(color: Colors.grey),
          //   ),
          // ),
          // Text(
          //   "\$${product.price}",
          //   style: TextStyle(fontWeight: FontWeight.bold),
          // ),

          // Container(
          //   height: MediaQuery.of(context).size.height / 3.6,
          //   width: MediaQuery.of(context).size.width / 2.2,
          //   child: ClipRRect(
          //     borderRadius: BorderRadius.circular(8.0),
          //     child: Image.network(
          //       product.images['0'],
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 2.0, top: 8.0),
                  child: Container(
                    width: 100,
                    child: Text(
                      "${product.title}",
                      style: TextStyle(
                        fontSize: 16.0,
                        // fontWeight: FontWeight.w900,
                      ),
                      maxLines: 2,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 2.0, top: 8.0, left: 5.0),
                  child: Text(
                    "R\$${product.price.toStringAsPrecision(2)}",
                    style: TextStyle(
                      fontSize: 16.0,
                      // fontWeight: FontWeight.w900,
                    ),
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 5.0, top: 2.0, left: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // SmoothStarRating(
                //   starCount: 5,
                //   color: Constants.ratingBG,
                //   allowHalfRating: true,
                //   rating: rating,
                //   size: 10.0,
                // ),
                Text(
                  // " $rating ($raters Reviews)",
                  "<Kg/Unidade>",
                  style: TextStyle(
                    fontSize: 11.0,
                  ),
                ),
                Text(
                  // " $rating ($raters Reviews)",
                  "<10>/${product.quantity}",
                  style: TextStyle(
                    fontSize: 11.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
