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
    String userId = document.id;
    Map<String, dynamic> data = document.data();
    String name = data['name'];
    String email = data['email'];
    String cep = data['cep'];
    String adress = data['adress'];
    String adressComplement = data['adress_complement'];
    //DateTime birth = document.data['birth'];
    String gender = data['gender'];
  }


}