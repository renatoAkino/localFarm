import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:localfarm/Datas/product_data.dart';
class CartData{

  String cart_id;
  String product_id;
  String farm_id;
  int quantity;
  ProductData productData;


  CartData();

  CartData.fromDocument(DocumentSnapshot document){
    cart_id = document.documentID;
    product_id = document.data['product_id'];
    quantity = document.data['quantity'];
    farm_id = document.data['farm_id'];
  }

  Map<String, dynamic> toMap(){
    return{
      'product_id' : product_id,
      'quantity' : quantity,
      'product' : productData.toResumeMap(),
      'farm_id' : productData.farm_id,
      'farm_name' : productData.farmData.name
    };
  }
}