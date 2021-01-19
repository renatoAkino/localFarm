import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
        .collection('posts')
        .doc(postData.postId)
        .update(postData.toMap())
        .then((result) async {
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

  Future<void> deletePost(String postId) async {
    await FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .delete();
  }
}