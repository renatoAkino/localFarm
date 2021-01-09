import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:localfarm/Datas/post_data.dart';
import 'package:localfarm/Datas/product_data.dart';
import 'package:localfarm/Screens/feed/components/feed_tile.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: Firestore.instance
          .collection('posts')
          .orderBy('data_public')
          .getDocuments(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          print('carregando feedtile');
          return ListView(
            children: snapshot.data.documents.map((doc) {
              PostData data = PostData.fromDocument(doc);
              return FeedTile(data);
            }).toList(),
          );
        }
      },
    );
  }
}