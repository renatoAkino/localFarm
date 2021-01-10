import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:localfarm/Datas/order_data.dart';
import 'package:localfarm/Datas/product_data.dart';
import 'package:localfarm/Screens/feed/components/feed_tile.dart';

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
          .collection('orders')
          .orderBy('status')
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
              OrderData data = OrderData.fromDocument(doc);
              // return FeedTile(data);
              return OrderTile(data);
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