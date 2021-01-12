import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:localfarm/Datas/product_data.dart';

import 'farm_data.dart';

class OrderData {
  String order_id;
  String client_id;
  String farm_id;
  // String farm_name;
  List<ProductData> products = [];
  double productsPrice;
  double shipPrice;
  int status;
  double totalPrice;
  Timestamp order_date;
  Timestamp ship_date;

  FarmData farmData;

  OrderData.fromDocument(DocumentSnapshot document) {
    order_id = document.documentID;
    client_id = document.data['clientID'];
    productsPrice = document.data['productsPrice'] + 0.0;
    shipPrice = document.data['shipPrice'] + 0.0;
    status = document.data['status'];
    totalPrice = document.data['totalPrice'] + 0.0;
    document.data['products'].forEach((product) {
      products.add(ProductData.fromResumedDocument(product));
    });
    order_date = document.data['order_date'];
    ship_date = document.data['ship_date'];
  }

  Future<void> getFarmData() async {
    DocumentSnapshot snapshot =
    await Firestore.instance.collection('farms').document(farm_id).get();
    farmData = FarmData.fromDocument(snapshot);
  }
}
