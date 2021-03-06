import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';


class UserModel extends Model{

  //intâncias do firebase para login
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser firebaseUser;

  Map<String, dynamic> userData = Map();
  bool isLoading = false;

  static UserModel of(BuildContext context) => ScopedModel.of<UserModel>(context);


  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);

    _loadCurrentUser();
  }

  void signUp({@required Map<String, dynamic> userData, @required String pass, @required VoidCallback onSucess, @required VoidCallback onFailed}){
    _loadChangeStatus();
    print(userData['email']);
    print(pass);
    _auth.createUserWithEmailAndPassword(email: userData['email'], password: pass).then(
            (result) async {
              firebaseUser = result.user;
              await _saveUserData(userData);
              onSucess();
              _loadChangeStatus();
            }).catchError(
            (e){
              onFailed();
              _loadChangeStatus();
            });
  }

  void signIn({@required String email, @required String pass, @required VoidCallback onSucess, @required VoidCallback onFailed}){
    _loadChangeStatus();

    _auth.signInWithEmailAndPassword(email: email, password: pass).then(
            (result){
      firebaseUser = result.user;
      _loadCurrentUser();
      _loadChangeStatus();
      onSucess();
    }).catchError((e){
      _loadChangeStatus();
      onFailed();
    });
  }

  //Coletar os dados do usuário do banco
  Future<void> _loadCurrentUser() async {
    if(firebaseUser == null){
      firebaseUser = await _auth.currentUser();
    }
    if(firebaseUser != null){
      if(userData['name'] == null){
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

  Future<void> updateUserData({@required Map<String, dynamic> userData, @required VoidCallback onSucess, @required VoidCallback onFailed}) async {
    this.userData = userData;
    await Firestore.instance.collection('users').document(firebaseUser.uid).updateData(userData).then(
        (result){
          onSucess();
        }
    ).catchError(
            (e){
              onFailed();
            }
            );
  }

  void _loadChangeStatus(){
    if(isLoading){
      isLoading = false;
    }else{
      isLoading = true;
    }

    notifyListeners();
  }

  bool isLoggedin(){
    return firebaseUser != null;
  }

  Future<void> logout() async {
    await _auth.signOut();

    userData = Map();
    firebaseUser = null;

    notifyListeners();
  }

  void setBirth(DateTime date){
    userData['birth'] = Timestamp.fromDate(date);
  }

  String getName(){
    if(isLoggedin()){
      return userData['name'].toString();
    }else{
      return 'Teste';
    }
  }
  String getId(){
    if(isLoggedin()){
      return firebaseUser.uid;
    }else{
      return 'Teste';
    }
  }
}
