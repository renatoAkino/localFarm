import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:producerfarm/Datas/product_data.dart';
import 'package:producerfarm/Models/user_model.dart';

class ProductModel {
  Future<void> updateProduct(ProductData productData, VoidCallback onSucess, VoidCallback onFailed, String farm_id) async {
    await FirebaseFirestore.instance
        .collection('products')
        .doc(productData.productId)
        .update(productData.toMap());
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
  }

  Future<String> insertImage(File imageFile) async {
    TaskSnapshot task =  await FirebaseStorage.instance.ref().child('produtos').child(DateTime.now().millisecondsSinceEpoch.toString()).putFile(imageFile);
    return task.ref.getDownloadURL();
//    StorageReference task = FirebaseStorage.instance.ref().child(
//        user.uid + DateTime.now().millisecondsSinceEpoch.toString()
//    ).putFile(imgFile);
//
//    setState(() {
//      _isLoading = true;
//    });
//    StorageTaskSnapshot snapshot = await task.onComplete;
//    String url = await snapshot.ref.getDownloadURL();
//    data['imgUrl'] = url;
//
//    setState(() {
//      _isLoading = false;
//    });
  }

  Future<void> insertProduct(ProductData productData) async {
    await FirebaseFirestore.instance
        .collection('products')
        .doc()
        .set(productData.toMap());
    //GAMBIARRA//
    QuerySnapshot snapshot = await FirebaseFirestore.instance
    .collection('products')
   .where('name', isEqualTo: productData.name).where('image', isEqualTo: productData.image).get();

    await FirebaseFirestore.instance
        .collection('farms')
        .doc(productData.farm_id)
        .collection('products')
        .doc(snapshot.docs.first.id)
        .set(productData.toMap());

    //FIM DA GAMBIARRA//
  }

  Future<void> deleteProduct(String productId, String farmId) async{
    await FirebaseFirestore.instance
        .collection('products')
        .doc(productId)
        .delete();
    await FirebaseFirestore.instance
    .collection('farms')
    .doc(farmId)
    .collection('products')
    .doc(productId)
    .delete();
  }
}
