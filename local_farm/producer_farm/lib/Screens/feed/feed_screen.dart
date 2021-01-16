import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:producerfarm/Datas/post_data.dart';
import 'package:producerfarm/Models/user_model.dart';

import 'feed_tile.dart';
import 'insert_post_screen.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text('Suas Postagens'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.green),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => InsertPostScreen(),
                  ),
                );
              },
              icon: Icon(
                Icons.add,
                color: Colors.green,
                size: 30,
              ),
            ),
          )
        ],
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance
            .collection('posts')
            .where('farm',
                isEqualTo: UserModel.of(context).userData.farmData.farmId)
            .get(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            print('carregando feedtile');
            return ListView(
              children: snapshot.data.docs.map((document) {
                PostData postData = PostData.fromDocument(document);
                return FeedTile(postData);
              }).toList(),
            );
            // return Container(
            //   decoration: BoxDecoration(color: Colors.white),
            //   child: ListView(
            //     children: snapshot.data.docs.map((document) {
            //       print(document.data());
            //       PostData postData = PostData.fromDocument(document);
            //       print(postData.title);
            //       return Column(
            //         children: [
            //           Text(postData.postId),
            //           Text(postData.description),
            //           Text(postData.type),
            //           Text(postData.title),
            //           Text(postData.images.toString()),
            //         ],
            //       );
            //     }).toList(),
            //   ),
            // );
          }
        },
      ),
    );
  }
}
