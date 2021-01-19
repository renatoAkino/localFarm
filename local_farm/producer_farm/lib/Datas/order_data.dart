import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:producerfarm/Datas/product_data.dart';
import 'package:producerfarm/Datas/user_data.dart';

import 'farm_data.dart';

class OrderData {
  String order_id;
  String client_id;
  String client_name;
  String client_tel;
  String client_address;
  String farm_id;
  List<ProductData> products = [];
  List<UserData> location = [];
  double productsPrice;
  double shipPrice;
  int status;
  double totalPrice;
  // Timestamp order_date;
  DateTime order_date;
  // Timestamp ship_date;
  DateTime ship_date;

  FarmData farmData;

  OrderData.fromDocument(DocumentSnapshot document) {
    order_id = document.id;
    Map<String, dynamic> data = document.data();
    client_id = data['clientID'];
    client_name = data['clientName'];
    client_tel = data['clientTel'];
    client_address = data['clientAddress'];
    location = data['location']; //lat -23.4264637 - lon -46.5615487
    // farm_id = document.data['farm_id'];
    productsPrice = data['productsPrice'] + 0.0;
    shipPrice = data['shipPrice'] + 0.0;
    status = data['status'];
    totalPrice = data['totalPrice'] + 0.0;
    data['products'].forEach((product) {
      products.add(ProductData.fromResumedDocument(product));
    });
    order_date = data['order_date'].toDate();
    ship_date = data['ship_date'].toDate();
  }

  Future<void> getFarmData() async {
    DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('farms').doc(farm_id).get();
    farmData = FarmData.fromDocument(snapshot);
  }
}
