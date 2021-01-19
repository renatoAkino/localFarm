import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:producerfarm/Datas/post_data.dart';
import 'package:producerfarm/Models/post_model.dart';
import 'package:producerfarm/Models/user_model.dart';

class InsertPostScreen extends StatefulWidget {
  @override
  _InsertPostScreenState createState() => _InsertPostScreenState();
}

//talvez esse link ajude
// https://www.coderzheaven.com/2019/04/30/upload-image-in-flutter-using-php/

class _InsertPostScreenState extends State<InsertPostScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _imageUrl;
  String _typeText;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
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
                          if(_formKey.currentState.validate() && _imageUrl != null){
                            PostData postData = PostData();
                            postData.likes = 0;
                            postData.farm_id = UserModel.of(context).userData.farmData.farmId;
                            postData.description = _descriptionController.text;
                            postData.type = _typeText;
                            postData.post_data = Timestamp.fromDate(DateTime.now());
                            postData.images = {'0' : _imageUrl};
                            postData.title = _titleController.text;

                            PostModel().insertPost(postData);
                          }
                        },
                      )),
                ],
              ))),
    );
  }
}
