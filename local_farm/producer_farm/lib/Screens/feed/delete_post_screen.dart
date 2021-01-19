import 'package:flutter/material.dart';
import 'package:producerfarm/Datas/post_data.dart';
import 'package:producerfarm/Models/post_model.dart';

class DeletePostScreen extends StatefulWidget {
  final PostData postData;

  const DeletePostScreen(this.postData);

  @override
  _DeletePostScreenState createState() => _DeletePostScreenState();
}

class _DeletePostScreenState extends State<DeletePostScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: OutlineButton(
        onPressed: (){
          PostModel().deletePost(widget.postData.postId);

          Navigator.of(context).pop();
        },
        child: Text('confirma'),
      ),
    );
  }
}
