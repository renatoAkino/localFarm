import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:producerfarm/Datas/post_data.dart';

class PostModel{
  void insertPost(PostData postData){
    FirebaseFirestore.instance
        .collection('posts')
        .doc()
        .set(postData.toMap());
  }

  Future<void> updatePost(PostData postData, VoidCallback onSucess, VoidCallback onFailed, String farm_id) async{
    await FirebaseFirestore.instance
        .collection('products')
        .doc(postData.postId)
        .update(postData.toMap())
        .then((result) async {
     onSucess();
    }).catchError((e) {
      onFailed();
    });
  }
}