import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:producerfarm/Datas/farm_data.dart';
import 'package:producerfarm/Models/user_model.dart';

class FarmModel{
   
  Future<FarmData> getFarmData(String farmId) async{
    print(farmId);
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance.collection('farms').doc(farmId).get();
    return FarmData.fromDocument(documentSnapshot);
  }


  Future<void> updateFarm(FarmData farmData, VoidCallback onSucess, VoidCallback onFailed) async{
    await FirebaseFirestore.instance
        .collection('farms')
        .doc(farmData.farmId)
        .update(farmData.toMap())
        .then((result) async {
        onSucess();
    }).catchError((e) {
      onFailed();
    });
  }
}