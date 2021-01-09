import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:localfarm/Datas/farm_data.dart';

class ProductData {
  String id;
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
    description = snapshot['description'];
    farm_id = snapshot['farm'];
    images = snapshot['images'];
    price = snapshot['price'] + 0.0;
    quantity = snapshot['quantity'] + 0.0;
    title = snapshot['title'];
    type = snapshot['type'];
  }

  ProductData.fromResumedDocument(Map<String, dynamic> map){
    id = map['product_id'];
    price = map['product']['price'];
    title = map['product']['title'];
    quantity = map['quantity'];
  }

  Future<void> getFarmData() async {
    DocumentSnapshot snapshot = await Firestore.instance.collection('farms')
        .document(farm_id)
        .get();
    farmData = FarmData.fromDocument(snapshot);
  }
  Map<String, dynamic> toResumeMap() {
    return {
      'title': title,
      'price': price,
      'farm_id': farm_id
    };
  }
}
