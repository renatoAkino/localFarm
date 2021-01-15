import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:producerfarm/Models/user_model.dart';
import 'package:producerfarm/Screens/feed/feed_screen.dart';

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
    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance
          .collection('posts')
          .where('farm',
              isEqualTo: UserModel.of(context).userData.farmData.farmId)
          .get(),
      builder: (context, snapshot) {
        // return ListView(
        //   children: snapshot.data.docs.map((document) {
        //     print(document.data());
        //     PostData postData = PostData.fromDocument(document);
        //     print(postData.title);
        //     return Column(
        //       children: [
        //         Text(postData.postId),
        //         Text(postData.description),
        //         Text(postData.type),
        //         Text(postData.title),
        //         Text(postData.images.toString()),
        //       ],
        //     );
        //   }).toList(),
        // );
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                // builder: (context) => PostScreen(),
                builder: (context) => FeedScreen(),
              ),
            );
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 4,
            margin: EdgeInsets.only(
                bottom: deviceHeight(context) * 0.18, left: 20.0, right: 20.0),
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
                      Row(
                        children: [
                          Icon(
                            Icons.favorite_border,
                            color: Colors.green,
                          ),
                          Text(
                            '<12>',
                            // cargo ?? '',
                            textAlign: TextAlign.start,
                            style: new TextStyle(
                                color: Colors.black87,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Text(
                        'Curtidas',
                        // depto ?? '',
                        textAlign: TextAlign.start,
                        style: new TextStyle(
                          color: Colors.green,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: [
                          Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.green,
                          ),
                          Text(
                            ' ' + snapshot.data.docs.length.toString(),
                            // cargo ?? '',
                            textAlign: TextAlign.start,
                            style: new TextStyle(
                                color: Colors.black87,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Text(
                        'Posts',
                        // depto ?? '',
                        textAlign: TextAlign.start,
                        style: new TextStyle(
                          color: Colors.green,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: [
                          Icon(
                            Icons.turned_in_not,
                            color: Colors.green,
                          ),
                          Text(
                            ' ' +
                                UserModel.of(context)
                                    .userData
                                    .farmData
                                    .followers
                                    .toString(),
                            // cargo ?? '',
                            textAlign: TextAlign.start,
                            style: new TextStyle(
                                color: Colors.black87,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Text(
                        'Seguidores',
                        // depto ?? '',
                        textAlign: TextAlign.start,
                        style: new TextStyle(
                          color: Colors.green,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
