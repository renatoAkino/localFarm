import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:producerfarm/Datas/post_data.dart';
import 'package:producerfarm/Models/user_model.dart';

class PostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance
          .collection('posts')
          .where('farm', isEqualTo: UserModel.of(context).userData.farmData.farmId)
          .get(),
      builder: (context, snapshot){
        return Container(
          decoration: BoxDecoration(
            color: Colors.white
          ),
          child: ListView(
            children: snapshot.data.docs.map(
                    (document){
                  print(document.data());
                  PostData postData = PostData.fromDocument(document);
                  print(postData.title);
                  return Column(
                    children: [
                        Text(postData.postId),
                        Text(postData.description),
                        Text(postData.type),
                        Text(postData.title),
                        Text(postData.images.toString()),
                    ],
                  );
                }
            ).toList(),
          ),
        );
      },

    );
  }
}
