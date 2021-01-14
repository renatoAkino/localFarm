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
  DateTime order_date;
  Timestamp ship_date;

  FarmData farmData;

  OrderData.fromDocument(DocumentSnapshot document) {
    order_id = document.id;
    Map<String, dynamic> data = document.data();
    client_id = data['clientID'];
    // farm_id = document.data['farm_id'];
    productsPrice = data['productsPrice'] + 0.0;
    shipPrice = data['shipPrice'] + 0.0;
    status = data['status'];
    totalPrice = data['totalPrice'] + 0.0;
    data['products'].forEach((product) {
      products.add(ProductData.fromResumedDocument(product));
    });
    order_date = DateTime.fromMicrosecondsSinceEpoch(
            data['order_date'].microsecondsSinceEpoch)
        .toLocal();
    ship_date = data['ship_date'];
  }

  Future<void> getFarmData() async {
    DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('farms').doc(farm_id).get();
    farmData = FarmData.fromDocument(snapshot);
  }
}
