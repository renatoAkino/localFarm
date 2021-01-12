import 'package:cloud_firestore/cloud_firestore.dart';

class FarmData{
  String farmId;
  String adress;
  int distance;
  int followers;
  String image;
  String name;

  FarmData();

  FarmData.fromDocument(DocumentSnapshot documentSnapshot){
    farmId = documentSnapshot.id;
    Map<String, dynamic> data = documentSnapshot.data();
    adress = data['adress'];
    distance = data['distance'];
    followers = data['followers'];
    image = data['image'];
    name = data['name'];
  }


}