import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'farm_data.dart';

class PostData {
  String post_id;
  String description;
  String farm_id;
  Map<String, dynamic> images;
  String title;
  String type;
  // DateTime post_data;
  Timestamp post_data;

  FarmData farmData;

  PostData.fromDocument(DocumentSnapshot snapshot) {
    post_id = snapshot.documentID;
    description = snapshot.data['description'];
    farm_id = snapshot.data['farm'];
    images = snapshot.data['images'];
    title = snapshot.data['tite'];
    type = snapshot.data['type'];
    post_data = snapshot.data['data_public'];
  }

  Future<void> getFarmData() async {
    DocumentSnapshot snapshot =
    await Firestore.instance.collection('farms').document(farm_id).get();
    farmData = FarmData.fromDocument(snapshot);
  }
}