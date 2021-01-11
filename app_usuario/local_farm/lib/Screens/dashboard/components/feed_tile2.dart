import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:localfarm/Datas/post_data.dart';
import 'package:localfarm/Screens/farm/%5Bantigo%5Dfarm_screen.dart';
import 'package:localfarm/Screens/store_screen.dart';

class FeedTile2 extends StatelessWidget {
  final PostData post;

  FeedTile2(this.post);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 0,
      width: 370,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            topLeft: Radius.circular(10),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FutureBuilder(
                    future: post.getFarmData(),
                    builder: (context, snapshot) {
                      if (post.farmData != null) {
                        return Row(
                          children: <Widget>[
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image:
                                          NetworkImage(post.farmData.image))),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              post.farmData.name,
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
                          builder: (context) => FarmScreen(post.farmData)));
                    },
                    icon: Icon(Icons.more_vert),
                  )
                ],
              ),
            ),
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 3.2,
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              // bottomRight: Radius.circular(20.0),
                              ),
                          image: DecorationImage(
                              image: NetworkImage(post.images['0']),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
                Positioned(
                  right: -10.0,
                  bottom: 3.0,
                  child: RawMaterialButton(
                    onPressed: () {},
                    fillColor: Colors.white,
                    shape: CircleBorder(),
                    elevation: 4.0,
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon(
                        // isFav ? Icons.favorite : Icons.favorite_border,
                        Icons.favorite_border,
                        color: Colors.green,
                        size: 17,
                      ),
                    ),
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
