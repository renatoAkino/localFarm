import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:localfarm/Datas/product_data.dart';
import 'package:localfarm/Screens/store_screen.dart';

class FeedTile2 extends StatelessWidget {
  final ProductData product;

  FeedTile2(this.product);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0,
      width: 370,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FutureBuilder(
                    future: product.getFarmData(),
                    builder: (context, snapshot) {
                      if (product.farmData != null) {
                        return Row(
                          children: <Widget>[
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          product.farmData.image))),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              product.farmData.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 15),
                            )
                          ],
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => StoreScreen(product.farmData)));
                    },
                    icon: Icon(Icons.more_vert),
                  )
                ],
              ),
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(product.image),
                    fit: BoxFit.cover),
              ),
            )),
            // Expanded(
            //   child: StaggeredGridView.countBuilder(
            //     crossAxisCount: 2,
            //     itemCount: product.images.length,
            //     // itemCount: 1,
            //     itemBuilder: (BuildContext context, int index) {
            //       print(product.images.length);
            //       return Container(
            //         decoration: BoxDecoration(
            //           image: DecorationImage(
            //               image: NetworkImage(product.images['$index']),
            //               fit: BoxFit.cover),
            //         ),
            //       );
            //     },
            //     staggeredTileBuilder: (int index) =>
            //         new StaggeredTile.count(2, index.isEven ? 2 : 1),
            //     mainAxisSpacing: 4.0,
            //     crossAxisSpacing: 4.0,
            //   ),
            // ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          product.name,
                          style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Text(
                            product.description,
                            style: TextStyle(fontSize: 11),
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                      child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.favorite_border),
                        onPressed: () {},
                      ),
                      SizedBox(
                        width: 0,
                      ),
                      // IconButton(
                      //   icon: Icon(Icons.star_border),
                      //   onPressed: () {},
                      // )
                    ],
                  ))
                ],
              ),
            ),
            // SizedBox(
            //   height: 20,
            // )
            // Expanded(
            //   child: Container(
            //     color: Colors.indigo,
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
