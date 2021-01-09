import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:localfarm/Datas/order_data.dart';
import 'package:localfarm/Datas/post_data.dart';
import 'package:localfarm/Models/user_model.dart';

class PostModel {
  UserModel user;

  Future<List<PostData>> loadOrders() async {
    List<PostData> posts;

    QuerySnapshot query =
        await Firestore.instance.collection('post').getDocuments();
    posts = query.documents.map((post) {
      posts.add(PostData.fromDocument(post));
    }).toList();

    return posts;
  }
}
