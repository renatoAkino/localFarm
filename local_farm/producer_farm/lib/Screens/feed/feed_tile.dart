// import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:producerfarm/Datas/post_data.dart';
import 'package:producerfarm/Models/user_model.dart';

class FeedTile extends StatefulWidget {
  final PostData post;

  FeedTile(this.post);

  @override
  _FeedTileState createState() => _FeedTileState();
}

class _FeedTileState extends State<FeedTile> {
  @override
  Widget build(BuildContext context) {
    // bool checkLike = UserModel.of(context).checkLikedPost(widget.post.post_id);
    bool checkLike = false;
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // CarouselSlider(
            //   viewportFraction: 1.0,
            //   aspectRatio: 2.0,
            //   enlargeCenterPage: false,
            //   enableInfiniteScroll: false,
            //   items: <Widget>[
            //     Container(
            //       decoration: BoxDecoration(
            //         image: DecorationImage(
            //             image: NetworkImage(post.images['0']),
            //             fit: BoxFit.cover),
            //       ),
            //     ),
            //     Container(
            //       decoration: BoxDecoration(
            //           image: DecorationImage(
            //               image: NetworkImage(post.images['1']),
            //               fit: BoxFit.cover)),
            //     ),
            //     Container(
            //       decoration: BoxDecoration(
            //         image: DecorationImage(
            //             image: NetworkImage(post.images['2']),
            //             fit: BoxFit.cover),
            //       ),
            //     ),
            //   ],
            // ),

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
                            // topLeft: Radius.circular(10.0),
                            // topRight: Radius.circular(10.0),
                            // bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(20.0),
                          ),
                          image: DecorationImage(
                              image: NetworkImage(widget.post.images['0']),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
                Positioned(
                  right: -10.0,
                  bottom: 3.0,
                  child: RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        // UserModel.of(context).likePost(widget.post.post_id);
                      });
                    },
                    fillColor: checkLike ? Colors.green : Colors.white,
                    shape: CircleBorder(),
                    elevation: 4.0,
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon(
                        // isFav ? Icons.favorite : Icons.favorite_border,
                        Icons.favorite_border,
                        color: checkLike ? Colors.white : Colors.green,
                        size: 17,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Text(widget.post.title),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
              child: Text(
                '32 gostaram',
                style: TextStyle(fontSize: 13, color: Colors.grey),
                maxLines: 2,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
              child: Row(
                children: <Widget>[
                  ConstrainedBox(
                    constraints: new BoxConstraints(
                      minHeight: 10.0,
                      maxHeight: MediaQuery.of(context).size.height * 0.2,
                    ),
                    child: Container(
                      // height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Text(
                        widget.post.description,
                        // overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            // fontSize: 11.0,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
