import 'package:cloud_firestore/cloud_firestore.dart';

class FarmData{
  String id;
  String name;
  String image;

  FarmData.fromDocument(DocumentSnapshot snapshot){
    id = snapshot.documentID;
    name = snapshot['name'];
    image = snapshot['image'];
  }
}