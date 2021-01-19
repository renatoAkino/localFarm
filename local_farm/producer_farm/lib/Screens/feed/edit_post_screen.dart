import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:producerfarm/Datas/post_data.dart';
import 'package:producerfarm/Models/post_model.dart';
import 'package:producerfarm/Models/user_model.dart';

class EditPostScreen extends StatefulWidget {
  final PostData postData;

  const EditPostScreen(this.postData);

  @override
  _EditPostScreenState createState() => _EditPostScreenState();
}

class _EditPostScreenState extends State<EditPostScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _imageUrl;
  String _typeText;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    initialValues();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 2,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text('Novo Post'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.green),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
          top: false,
          bottom: false,
          child: Form(
              key: _formKey,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        SizedBox(
                          height: 20.0,
                        ),
                        OutlineButton(
                          onPressed: () {
                            setState(() async {
                              final PickedFile imgFile = await ImagePicker().getImage(source: ImageSource.gallery);
                              _imageUrl = await PostModel().insertImage(File(imgFile.path));
                            });
                          },
                          child: Text('Upload Image'),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                  ),
                  TextFormField(
                    controller: _titleController,
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.description),
                      hintText: 'Titulo',
                      labelText: 'titulo',
                    ),
                  ),
                  TextFormField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.description),
                      hintText: 'Descrição',
                      labelText: 'descrição',
                    ),
                  ),
                  DropdownButton<String>(
                    hint: Text("Tipo"),
                    isExpanded: true,
                    underline: Container(
                      height: 2,
                      color: Colors.grey[350],
                    ),
                    value: _typeText,
                    onChanged: (String newValue) {
                      setState(() {
                        _typeText = newValue;
                      });
                    },
                    items: <String>[
                      'Legume',
                      'Fruta',
                      'Mel',
                      'Pão',
                      'Ovos',
                      'Queijo',
                      'Doce',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                      padding: const EdgeInsets.only(
                          left: 40.0, top: 20.0, right: 40.0),
                      child: RaisedButton(
                        child: const Text('Postar'),
                        onPressed: (){

                          if(_formKey.currentState.validate()){
                            PostData postData = PostData();
                            postData.postId = widget.postData.postId;
                            postData.likes = widget.postData.likes;
                            postData.farm_id = UserModel.of(context).userData.farmData.farmId;
                            postData.description = _descriptionController.text;
                            postData.type =_typeText;
                            postData.post_data = widget.postData.post_data;
                            postData.images = widget.postData.images;
                            postData.title = _titleController.text;

                            PostModel().updatePost(postData, onSucess, onFailed, UserModel.of(context).userData.farmData.farmId);
                          }
                        },
                      )),
                ],
              ))),
    );

  }
  void initialValues() {
    _titleController.text = widget.postData.title;
    _descriptionController.text = widget.postData.description;

  }

  void onSucess() {
    Navigator.of(context).pop(context);
  }

  void onFailed() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(
        "Falha ao alterar dados",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      duration: Duration(seconds: 3),
    ));
  }


}
