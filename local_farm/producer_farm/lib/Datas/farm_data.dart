import 'package:cloud_firestore/cloud_firestore.dart';

class FarmData {
  String farmId;
  String adress;
  int distance;
  int followers;
  String image;
  String name;

  FarmData();

  FarmData.fromDocument(DocumentSnapshot documentSnapshot) {
    farmId = documentSnapshot.id;
    Map<String, dynamic> data = documentSnapshot.data();
    adress = data['adress'];
    distance = data['distance'];
    followers = data['followers'];
    image = data['image'];
    name = data['name'];
  }

  Map<String, dynamic> toMap(){
    return {
      'farm_id' : farmId,
      'addres' : adress,
      'distance' : distance,
      'followers' : followers,
      'image' : image,
      'name' : name,
    };
  }

  Future<FarmData> getFarmData(String farmId) async {
    FarmData farmData;
    var snapshot = await FirebaseFirestore.instance.collection('farms').doc(farmId).get();
    // DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('farms').doc(farmId).get();
    // FarmData farmData = FarmData.fromDocument(snapshot);
    return FarmData.fromDocument(snapshot);
  }
}
