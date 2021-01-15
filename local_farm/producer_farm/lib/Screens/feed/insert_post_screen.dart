import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class InsertPostScreen extends StatefulWidget {
  @override
  _InsertPostScreenState createState() => _InsertPostScreenState();
}

//talvez esse link ajude
// https://www.coderzheaven.com/2019/04/30/upload-image-in-flutter-using-php/

class _InsertPostScreenState extends State<InsertPostScreen> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                          onPressed: () {},
                          child: Text('Upload Image'),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.description),
                      hintText: 'Descrição',
                      labelText: 'descrição',
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                      padding: const EdgeInsets.only(
                          left: 40.0, top: 20.0, right: 40.0),
                      child: RaisedButton(
                        child: const Text('Postar'),
                        onPressed: null,
                      )),
                ],
              ))),
    );
  }
}
