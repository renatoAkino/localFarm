import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:localfarm/Datas/farm_data.dart';

class ProductData {
  String id;
  int data_public;
  String description;
  String farm_id;
  Map<String, dynamic> images = Map();
  double price;
  double quantity;
  String title;
  String type;

  FarmData farmData;

  ProductData.fromDocument(DocumentSnapshot snapshot) {
    id = snapshot.documentID;
    data_public = snapshot['data_public'];
    description = snapshot['description'];
    farm_id = snapshot['farm'];
    images = snapshot['images'];
    price = snapshot['price'] + 0.0;
    quantity = snapshot['quantity'] + 0.0;
    title = snapshot['title'];
    type = snapshot['type'];
  }

  Future<void> getFarmData() async {
    DocumentSnapshot snapshot =
        await Firestore.instance.collection('farms').document(farm_id).get();
    farmData = FarmData.fromDocument(snapshot);
  }

  Map<String, dynamic> toResumeMap() {
    return {'title': title, 'price': price};
  }
}
