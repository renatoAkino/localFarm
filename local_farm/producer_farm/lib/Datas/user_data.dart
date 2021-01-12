import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:producerfarm/Datas/farm_data.dart';

class UserData{

  String userId;
  String name;
  String email;
  String cep;
  String adress;
  String adressComplement;
  DateTime birth;
  String gender;
  FarmData farmData;


  UserData();

  UserData.fromDocument(DocumentSnapshot document){
    userId = document.id;
    Map<String, dynamic> data = document.data();
    name = data['name'];
    email = data['email'];
    cep = data['cep'];
    adress = data['adress'];
    adressComplement = data['adress_complement'];
    //DateTime birth = document.data['birth'];
    gender = data['gender'];

  }


}