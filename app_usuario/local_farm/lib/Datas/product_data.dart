import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:localfarm/Datas/farm_data.dart';

class ProductData {
  String id;
  String description;
  String farm_id;
  //Map<String, dynamic> images = Map();
  String image;
  double price;
  int quantity;
  //String title;
  String name;
  String soldPer;
  String type;

  FarmData farmData;

  ProductData.fromDocument(DocumentSnapshot snapshot) {
    id = snapshot.documentID;
    description = snapshot['description'];
    farm_id = snapshot['farm'];
    //images = snapshot['images'];
    image = snapshot['image'];
    price = snapshot['price'] + 0.0;
    quantity = snapshot['quantity'];
    //title = snapshot['title'];
    name = snapshot['name'];
    soldPer = snapshot['sold-per'];
    type = snapshot['type'];
  }

  ProductData.fromResumedDocument(Map<String, dynamic> map) {
    id = map['product_id'];
    price = map['product']['price'];
    name = map['product']['title'];
    quantity = map['quantity'];
  }

  Future<void> getFarmData() async {
    DocumentSnapshot snapshot =
        await Firestore.instance.collection('farms').document(farm_id).get();
    farmData = FarmData.fromDocument(snapshot);
  }

  Map<String, dynamic> toResumeMap() {
    return {'title': name, 'price': price, 'farm_id': farm_id};
  }
}
