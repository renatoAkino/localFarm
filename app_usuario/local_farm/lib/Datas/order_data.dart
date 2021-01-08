import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:localfarm/Datas/product_data.dart';

class OrderData{
  String order_id;
  String client_id;
  String farm_id;
  List<ProductData> products = [];
  int productsPrice;
  int shipPrice;
  int status;
  int totalPrice;


  OrderData.fromDocument(DocumentSnapshot document){
    order_id = document.documentID;
    client_id = document.data['clientID'];
    productsPrice = document.data['productsPrice'];
    shipPrice= document.data['shipPrice'];
    status = document.data['status'];
    totalPrice = document.data['totalPrice'];
    document.data[products].forEach((product){
        products.add(ProductData.fromResumedDocument(product));
    });
  }
}