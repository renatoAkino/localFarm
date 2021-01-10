import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:localfarm/Datas/order_data.dart';
import 'package:localfarm/Datas/post_data.dart';
import 'package:localfarm/Models/user_model.dart';

class PostModel{

  Future<List<PostData>>loadUserPost(String userId) async {
    List<PostData> posts = List<PostData>();
    if(userId.isNotEmpty) {
      QuerySnapshot farms = await Firestore.instance.collection('users')
          .document(userId).collection('followFarms')
          .getDocuments();
      farms.documents.forEach((farm) async {
        QuerySnapshot query = await Firestore.instance.collection('posts')
            .where('farm', isEqualTo: farm.documentID)
            .getDocuments();
        query.documents.forEach(
                (post) {
              posts.add(PostData.fromDocument(post));
            }

        );
      });
    }
    return posts;
  }


}