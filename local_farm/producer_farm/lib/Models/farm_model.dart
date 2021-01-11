import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:producerfarm/Datas/farm_data.dart';
import 'package:producerfarm/Models/user_model.dart';

class FarmModel{
   
  Future<FarmData> getFarmData(String farmId) async{
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance.collection('farms').doc(farmId).get();
    return FarmData.fromDocument(documentSnapshot);
  }
}