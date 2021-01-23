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
//    return Container(
//      color: Colors.white,
//      child: OutlineButton(
//        onPressed: (){
//          PostModel().deletePost(widget.postData.postId);
//
//          Navigator.of(context).pop();
//        },
//        child: Text('confirma'),
//      ),
//    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text('Confirmação'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.green),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Icon(
                    Icons.dangerous,
                    size: 100,
                    color: Colors.redAccent,
                  ),
                  Text(
                    'Tem certeza que deseja deletar esse produto?',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  Text('Essa ação não pode ser desfeita'),
                ],
              ),
              Container(
                padding: EdgeInsets.all(10),
                color: Colors.grey[300],
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Titulo'),
                        Text(
                          widget.postData.title,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Descrição'),
                        Text(
                          widget.postData.description,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Tipo'),
                        Text(
                          widget.postData.type,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
      bottomSheet: FlatButton(
        onPressed: () {
          PostModel().deletePost(widget.postData.postId);
          Navigator.of(context).pop();
        },
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.redAccent,
            height: 50,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Deletar',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
