import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:producerfarm/Datas/product_data.dart';

import 'farm_data.dart';

class OrderData {
  String order_id;
  String client_id;
  String farm_id;
  List<ProductData> products = [];
  double productsPrice;
  double shipPrice;
  int status;
  double totalPrice;
  Timestamp order_date;
  Timestamp ship_date;

  FarmData farmData;

  OrderData.fromDocument(DocumentSnapshot document) {
    order_id = document.id;
    Map<String, dynamic> data = document.data();
    client_id = data['clientID'];
    // farm_id = document.data['farm_id'];
    productsPrice = data['productsPrice'];
    shipPrice = data['shipPrice'];
    status = data['status'];
    totalPrice = data['totalPrice'];
    data['products'].forEach((product) {
      products.add(ProductData.fromResumedDocument(product));
    });
    order_date = data['order_date'];
    ship_date = data['ship_date'];
  }

  Future<void> getFarmData() async {
    DocumentSnapshot snapshot =
    await FirebaseFirestore.instance.collection('farms').document(farm_id).get();
    farmData = FarmData.fromDocument(snapshot);
  }
}
