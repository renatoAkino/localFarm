import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:producerfarm/Datas/farm_data.dart';
import 'package:producerfarm/Datas/user_data.dart';
import 'package:producerfarm/Models/farm_model.dart';
import 'package:scoped_model/scoped_model.dart';

class UserModel extends Model{
  FirebaseAuth _auth = FirebaseAuth.instance;
  User firebaseUser;
  bool isLoading = false;
  UserData userData = UserData();

  static UserModel of(BuildContext context) =>
      ScopedModel.of<UserModel>(context);

  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);

    _loadCurrentUser();
  }

  Future<void> _loadCurrentUser () async {
    if (firebaseUser == null) {
      firebaseUser = await _auth.currentUser;
    }
    if (firebaseUser != null) {
      //RECEBENDO OS DADOS DO USUÁRIO
      if (userData.name == null) {
        DocumentSnapshot docUser = await FirebaseFirestore.instance
            .collection('users')
            .doc(firebaseUser.uid)
            .get();
        userData = UserData.fromDocument(docUser);
        print(userData.name);

        //RECEBENDO AS FAZENDAS QUE O USUÁRIO SEGUE
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(firebaseUser.uid)
            .collection('Farm')
            .get();
        FarmModel farmModel;
        userData.farmData = await farmModel.getFarmData(querySnapshot.docs.first.id);

        //RECEBENDO OS POSTS QUE O USUÁRIO DEU LIKE
//        QuerySnapshot likedPosts = await Firestore.instance
//            .collection('users')
//            .document(firebaseUser.uid)
//            .collection('likedPosts')
//            .getDocuments();
//        List<dynamic> postsList;
//        postsList = likedPosts.documents.map((e) {
//          if(e.data != null){
//            return e.data['post_id'];
//          }
//        }).toList();
//        userData.addAll({'likedPosts' : postsList});

      }
    }
    notifyListeners();
  }



  void signIn(
      {@required String email,
        @required String pass,
        @required VoidCallback onSucess,
        @required VoidCallback onFailed}) {
    _loadChangeStatus();

    _auth
        .signInWithEmailAndPassword(email: email, password: pass)
        .then((result) {
      firebaseUser = result.user;
      _loadCurrentUser();
      _loadChangeStatus();
      onSucess();
    }).catchError((e) {
      _loadChangeStatus();
      onFailed();
    });
  }

  void _loadChangeStatus() {
    if (isLoading) {
      isLoading = false;
    } else {
      isLoading = true;
    }

    notifyListeners();
  }

  bool isLoggedin() {
    return firebaseUser != null;
  }

  Future<void> logout() async {
    await _auth.signOut();

    firebaseUser = null;

    notifyListeners();
  }




}