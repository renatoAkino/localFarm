import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';


class UserModel extends Model{

  //intâncias do firebase para login
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser firebaseUser;

  Map<String, dynamic> userData = Map();

  bool isLoading = false;

  void signUp({@required Map<String, dynamic> userData, @required String pass}){
    _loadChangeStatus();

    _auth.createUserWithEmailAndPassword(email: userData['email'], password: pass).then(
            (result) async {
              firebaseUser = result.user;
              await _saveUserData(userData);
              _loadChangeStatus();
            }).catchError(
            (e){
              _loadChangeStatus();
            });
  }

  void signIn({@required String email, @required String pass}){
    _loadChangeStatus();

    _auth.signInWithEmailAndPassword(email: email, password: pass).then(
            (result){
      firebaseUser = result.user;
      _loadCurrentUser();
      _loadChangeStatus();
    }).catchError((e){
      _loadChangeStatus();
    });
  }

  //Coletar os dados do usuário do banco
  Future<void> _loadCurrentUser() async {
    if(firebaseUser == null){
      firebaseUser = await _auth.currentUser();
    }
    if(firebaseUser != null){
      if(userData['nome'] == null){
        DocumentSnapshot docUser = await Firestore.instance.collection('users').document(firebaseUser.uid).get();
        userData = docUser.data;
      }
    }
    notifyListeners();
  }

  //Salvar Dados do Usuário
  Future<void> _saveUserData(Map<String, dynamic> userData) async {
      this.userData = userData;
      await Firestore.instance.collection('users').document(firebaseUser.uid).setData(userData);
  }

  void _loadChangeStatus(){
    if(isLoading){
      isLoading = false;
    }else{
      isLoading = true;
    }

    notifyListeners();
  }


}