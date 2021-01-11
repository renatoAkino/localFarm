import 'package:cloud_firestore/cloud_firestore.dart';

class FarmData{
  String id;
  String name;
  String image;
  String addres;
  int distance;
  int followers;

  FarmData.fromDocument(DocumentSnapshot snapshot){
    id = snapshot.documentID;
    name = snapshot['name'];
    image = snapshot['image'];
    addres = snapshot['addres'];
    distance = snapshot['distance'];
    followers = snapshot['followers'];
  }
}