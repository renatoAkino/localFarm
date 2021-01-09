import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:localfarm/Datas/product_data.dart';

import 'feed_tile.dart';
import 'feed_tile2.dart';

class TopFeedsWidget extends StatefulWidget {
  @override
  _TopFeedsWidgetState createState() => _TopFeedsWidgetState();
}

class _TopFeedsWidgetState extends State<TopFeedsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: Firestore.instance
          .collection('products')
          .orderBy('data_public')
          .getDocuments(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return SizedBox(
            height: 300,
            // width: 1500,
            // child: ListView(
            //   // shrinkWrap: true,
            //   // scrollDirection: Axis.horizontal,
            //   children: snapshot.data.documents.map((doc) {
            //     ProductData data = ProductData.fromDocument(doc);
            //     // print(data.description);
            //     return FeedTile2(data);
            //   }).toList(),
            // ),
            child: ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                ProductData data =
                    ProductData.fromDocument(snapshot.data.documents[index]);
                return FeedTile2(data);
              },
              scrollDirection: Axis.horizontal,
            ),
          );
        }
      },
    );
  }
}
