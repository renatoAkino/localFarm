import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:localfarm/Datas/farm_data.dart';
// import 'package:localfarm/Models/farm_model.dart';
import 'package:scoped_model/scoped_model.dart';

class UserModel extends Model {
  //intâncias do firebase para login
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser firebaseUser;

  Map<String, dynamic> userData = Map();
  bool isLoading = false;

  static UserModel of(BuildContext context) =>
      ScopedModel.of<UserModel>(context);

  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);

    _loadCurrentUser();
  }

  void signUp(
      {@required Map<String, dynamic> userData,
      @required String pass,
      @required VoidCallback onSucess,
      @required VoidCallback onFailed}) {
    _loadChangeStatus();
    print(userData['email']);
    print(pass);
    _auth
        .createUserWithEmailAndPassword(
            email: userData['email'], password: pass)
        .then((result) async {
      firebaseUser = result.user;
      await _saveUserData(userData);
      onSucess();
      _loadChangeStatus();
    }).catchError((e) {
      onFailed();
      _loadChangeStatus();
    });
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

  //Coletar os dados do usuário do banco
  Future<void> _loadCurrentUser() async {
    if (firebaseUser == null) {
      firebaseUser = await _auth.currentUser();
    }
    if (firebaseUser != null) {
      //RECEBENDO OS DADOS DO USUÁRIO
      if (userData['name'] == null) {
        DocumentSnapshot docUser = await Firestore.instance
            .collection('users')
            .document(firebaseUser.uid)
            .get();
        userData = docUser.data;

        //RECEBENDO AS FAZENDAS QUE O USUÁRIO SEGUE
        QuerySnapshot followFarms = await Firestore.instance
            .collection('users')
            .document(firebaseUser.uid)
            .collection('followFarms')
            .getDocuments();
        List<dynamic> mapFarms;
        mapFarms = followFarms.documents.map((e) {
          if(e.data != null){
            return e.data['farm_id'];
          }
        }).toList();
        userData.addAll({'followFarms' : mapFarms});

        //RECEBENDO OS POSTS QUE O USUÁRIO DEU LIKE
        QuerySnapshot likedPosts = await Firestore.instance
            .collection('users')
            .document(firebaseUser.uid)
            .collection('likedPosts')
            .getDocuments();
        List<dynamic> postsList;
        postsList = likedPosts.documents.map((e) {
          if(e.data != null){
            return e.data['post_id'];
          }
        }).toList();
        userData.addAll({'likedPosts' : postsList});

      }
    }
    notifyListeners();
  }

  //Salvar Dados do Usuário
  Future<void> _saveUserData(Map<String, dynamic> userData) async {
    this.userData = userData;
    await Firestore.instance
        .collection('users')
        .document(firebaseUser.uid)
        .setData(userData);
  }

  Future<void> updateUserData(
      {@required Map<String, dynamic> userData,
      @required VoidCallback onSucess,
      @required VoidCallback onFailed}) async {
    this.userData = userData;
    await Firestore.instance
        .collection('users')
        .document(firebaseUser.uid)
        .updateData(userData)
        .then((result) {
      onSucess();
    }).catchError((e) {
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

    userData = Map();
    firebaseUser = null;

    notifyListeners();
  }

  void setBirth(DateTime date) {
    userData['birth'] = Timestamp.fromDate(date);
  }

  String getName() {
    if (isLoggedin()) {
      return userData['name'].toString();
    } else {
      return '';
    }
  }

  String getId() {
    if (isLoggedin()) {
      return firebaseUser.uid;
    } else {
      return '';
    }
  }

  String getAdress() {
    if (isLoggedin()) {
      return userData['adress'].toString();
    } else {
      return '';
    }
  }

  Future<void> followFarm(String farm_id) async {
    bool follow = false;
    QuerySnapshot snapshot = await Firestore.instance
        .collection('users')
        .document(firebaseUser.uid)
        .collection('followFarms')
        .getDocuments();
    snapshot.documents.forEach((element) {
      if (farm_id == element.documentID) {
        follow = true;
      }
    });
    if (!follow) {
      await Firestore.instance
          .collection('users')
          .document(firebaseUser.uid)
          .collection('followFarms')
          .document(farm_id)
          .setData({'farm_id': farm_id});
      DocumentSnapshot query =
          await Firestore.instance.collection('farms').document(farm_id).get();
      int f = query.data['followers'];
      f += 1;
      Firestore.instance
          .collection('farms')
          .document(farm_id)
          .updateData({'followers': f});
      List farms = userData['followFarms'];
      farms.add(farm_id);
      userData['follwFarms'] = farms;
    } else {
      await Firestore.instance
          .collection('users')
          .document(firebaseUser.uid)
          .collection('followFarms')
          .document(farm_id)
          .delete();
      DocumentSnapshot query =
          await Firestore.instance.collection('farms').document(farm_id).get();
      int f = query.data['followers'];
      f -= 1;
      Firestore.instance
          .collection('farms')
          .document(farm_id)
          .updateData({'followers': f});
      List farms = userData['followFarms'];
      farms.remove(farm_id);
      userData['follwFarms'] = farms;
    }
  }

  bool checkfollowFarm(farm_id){
    if(userData.isNotEmpty) {
      List farms = userData['followFarms'];
      return farms.contains(farm_id);
    }
    return false;
  }

  Future<void> likePost(String postId) async {
    bool like = false;
    QuerySnapshot snapshot = await Firestore.instance
        .collection('users')
        .document(firebaseUser.uid)
        .collection('likedPosts')
        .getDocuments();
    snapshot.documents.forEach((element) {
      if (postId == element.documentID) {
        like = true;
      }
    });
    if (!like) {
      await Firestore.instance
          .collection('users')
          .document(firebaseUser.uid)
          .collection('likedPosts')
          .document(postId)
          .setData({'post_id': postId});
      DocumentSnapshot query =
      await Firestore.instance.collection('posts').document(postId).get();
      int l = query.data['likes'];
      l += 1;
      Firestore.instance
          .collection('posts')
          .document(postId)
          .updateData({'likes': l});
      List posts = userData['likedPosts'];
      posts.add(postId);
      userData['likedPosts'] = posts;
    } else {
      await Firestore.instance
          .collection('users')
          .document(firebaseUser.uid)
          .collection('likedPosts')
          .document(postId)
          .delete();
      DocumentSnapshot query =
      await Firestore.instance.collection('posts').document(postId).get();
      int l = query.data['likes'];
      l -= 1;
      Firestore.instance
          .collection('posts')
          .document(postId)
          .updateData({'likes': l});
      List posts = userData['likedPosts'];
      posts.remove(postId);
      userData['likedPosts'] = posts;
    }
  }

  bool checkLikedPost(postId){
    if(userData.isNotEmpty) {
      List farms = userData['likedPosts'];
      return farms.contains(postId);
    }
    return false;
  }
}
