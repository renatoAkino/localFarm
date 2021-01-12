import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:localfarm/Datas/farm_data.dart';
import 'package:localfarm/Datas/order_data.dart';
import 'package:localfarm/Datas/product_data.dart';
import 'package:localfarm/Screens/feed/components/feed_tile.dart';
import 'package:day_picker/day_picker.dart';

import 'farm_tile.dart';

class FarmersList extends StatefulWidget {
  final int filter;

  const FarmersList(this.filter);

  @override
  _FarmersListState createState() => _FarmersListState();
}

class _FarmersListState extends State<FarmersList>

    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    Future<QuerySnapshot> query;
    switch(widget.filter){
      case 1 : query = Firestore.instance.collection('farms').orderBy('distance').getDocuments(); break;
      case 2 : query = Firestore.instance.collection('farms').getDocuments(); break;
      case 3 : query = Firestore.instance.collection('farms').orderBy('followers', descending: true).getDocuments(); break;
    }
    return FutureBuilder<QuerySnapshot>(
      future: query,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView(
            children: snapshot.data.documents.map((doc) {
              FarmData data = FarmData.fromDocument(doc);
              return FarmTile(data);
              // return FarmTile();
              //
            }).toList(),
          );
        }
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
