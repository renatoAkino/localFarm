import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:localfarm/Datas/product_data.dart';

import 'farm_data.dart';

class OrderData {
  String order_id;
  String client_id;
  String farm_id;
  List<ProductData> products = [];
  double productsPrice;
  double shipPrice;
  int status;
  double totalPrice;

  FarmData farmData;

  OrderData.fromDocument(DocumentSnapshot document) {
    order_id = document.documentID;
    client_id = document.data['clientID'];
    // farm_id = document.data['farmID'];
    productsPrice = document.data['productsPrice'];
    shipPrice = document.data['shipPrice'];
    status = document.data['status'];
    totalPrice = document.data['totalPrice'];
    document.data['products'].forEach((product) {
      products.add(ProductData.fromResumedDocument(product));
    });
  }

  Future<void> getFarmData() async {
    DocumentSnapshot snapshot =
        await Firestore.instance.collection('farms').document(farm_id).get();
    farmData = FarmData.fromDocument(snapshot);
  }
}