import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'farm_data.dart';

class PostData {
  String postId;
  String description;
  String farm_id;
  Map<String, dynamic> images;
  String title;
  String type;
  Timestamp post_data;

  FarmData farmData;

  PostData.fromDocument(DocumentSnapshot snapshot) {
    postId = snapshot.id;
    Map<String, dynamic> data = snapshot.data();
    description = data['description'];
    farm_id = data['farm'];
    images = data['images'];
    title = data['title'];
    type = data['type'];
    //post_data = data['data_public'];
  }

  Map<String, dynamic> toMap() {
    return {
      'post_id': postId,
      'description': description,
      'farm': farm_id,
      'images': images,
      'title': title,
      'type': type,
      'post_data': post_data,
    };
  }
}