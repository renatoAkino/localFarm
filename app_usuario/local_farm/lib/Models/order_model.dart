import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:localfarm/Datas/order_data.dart';
import 'package:localfarm/Models/user_model.dart';

class OrderModel{
  UserModel user;

  Future<List<OrderData>>loadOrders() async {
    List<OrderData> orders;
    QuerySnapshot query = await Firestore.instance.collection('users').document(user.getId()).collection('orders').getDocuments();
    query.documents.map(
        (doc){
          orders.add(OrderData.fromDocument(doc));
        }
    );

    return orders;
  }


}