import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:localfarm/Datas/product_data.dart';
import 'package:localfarm/widgets/feed_tile.dart';

import 'order_tile.dart';

class OrdersList extends StatefulWidget {
  final String status;

  const OrdersList({Key key, this.status = 'Em Andamento'}) : super(key: key);

  @override
  _OrdersListState createState() => _OrdersListState();
}

class _OrdersListState extends State<OrdersList>
    with AutomaticKeepAliveClientMixin {
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
          return ListView(
            children: snapshot.data.documents.map((doc) {
              //ALTERAR PARA PEDIDOS (PRECISO DO MODEL PEDIDOS PARA PUXAR DO SERVER)
              ProductData data = ProductData.fromDocument(doc);
              // return FeedTile(data);
              return OrderTile();
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
