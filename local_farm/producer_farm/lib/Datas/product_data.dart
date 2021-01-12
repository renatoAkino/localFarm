import 'package:cloud_firestore/cloud_firestore.dart';

class ProductData{
  String productId;
  String description;
  String farm_id;
  String image;
  double price;
  int quantity;
  String name;
  String soldPer;
  String type;

  ProductData.fromDocument(DocumentSnapshot snapshot) {
    productId = snapshot.id;
    Map<String, dynamic> data = snapshot.data();
    description = data['description'];
    farm_id = data['farm'];
    image = data['image'];
    price = data['price'] + 0.0;
    quantity = data['quantity'];
    name = data['name'];
    soldPer = data['sold-per'];
    type = data['type'];
  }

  ProductData.fromResumedDocument(Map<String, dynamic> map) {
    productId = map['product_id'];
    price = map['product']['price'];
    name = map['product']['title'];
    quantity = map['quantity'];
    farm_id = map['farm_id'];

  }


}