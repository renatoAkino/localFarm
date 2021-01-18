import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:producerfarm/Datas/product_data.dart';
import 'package:producerfarm/Models/user_model.dart';

class ProductModel {
  Future<void> updateProduct(ProductData productData, VoidCallback onSucess,
      VoidCallback onFailed, String farm_id) async {
    await FirebaseFirestore.instance
        .collection('products')
        .doc(productData.productId)
        .update(productData.toMap())
        .then((result) async {
      await FirebaseFirestore.instance
          .collection('farms')
          .doc(farm_id)
          .collection('products')
          .doc(productData.productId)
          .update(productData.toMap())
          .then((result) {
        onSucess();
      }).catchError((e) {
        onFailed();
      });
    }).catchError((e) {
      onFailed();
    });
  }
}
