import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:producerfarm/Datas/product_data.dart';
import 'package:producerfarm/Models/product_model.dart';
import 'package:producerfarm/Models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class InsertProductScreen extends StatefulWidget {
  @override
  _InsertProductScreenState createState() => _InsertProductScreenState();
}

class _InsertProductScreenState extends State<InsertProductScreen> {
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _quantityController = TextEditingController();
  final _birthController = TextEditingController();
  String _imageUrl;
  String _typeText;
  String _soldPerText;
  final _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
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
        title: Text('Novo Produto'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.green),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {
          // if (model.isLoading) {
          //   return Center(child: CircularProgressIndicator());
          // } else {
          return Center(
            child: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.all(40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            OutlineButton(
                              onPressed: () async {
                               setState(() async {
                                 final PickedFile imgFile = await ImagePicker().getImage(source: ImageSource.gallery);
                                 _imageUrl = await ProductModel().insertImage(File(imgFile.path));
                               });

                              },
                              child: Text(_imageUrl == null ? 'Adicionar Imagem' : 'Imagem Selecionada'),
                            ),
                            TextFormField(
                              controller: _nameController,
                              decoration:
                                  InputDecoration(labelText: "Nome do Produto"),
                              validator: (text) {
                                if (text.isEmpty) {
                                  return "Nome inválido";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 16,
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
                            // SizedBox(
                            //   height: 16,
                            // ),
                            TextFormField(
                              controller: _priceController,
                              decoration: InputDecoration(labelText: "Preço"),
                              onChanged: (text) {},
                              validator: (text) {
                                if (text.isEmpty) {
                                  return "Preço inválido";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            DropdownButton<String>(
                              hint: Text("Vendido por"),
                              isExpanded: true,
                              underline: Container(
                                height: 2,
                                color: Colors.grey[350],
                              ),
                              value: _soldPerText,
                              onChanged: (String newValue) {
                                setState(() {
                                  _soldPerText = newValue;
                                });
                              },
                              items: <String>[
                                'Unidade',
                                'Kilo',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            TextFormField(
                              controller: _quantityController,
                              decoration: InputDecoration(
                                  labelText: "Quantidade disponível"),
                              onChanged: (text) {},
                            ),
                            // SizedBox(
                            //   height: 16,
                            // ),
                            // TextFormField(
                            //   controller: _adressComplementController,
                            //   decoration:
                            //       InputDecoration(labelText: "Validade"),
                            //   onChanged: (text) {},
                            // ),
                            SizedBox(
                              height: 16,
                            ),
                            TextFormField(
                              controller: _descriptionController,
                              decoration:
                                  InputDecoration(labelText: "Descrição"),
                              onChanged: (text) {},
                              validator: (text) {
                                if (text.isEmpty) {
                                  return "Descrição inválido";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 16,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                          height: 40,
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            textColor: Colors.white,
                            color: Colors.green,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Salvar",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState.validate() && _imageUrl != null) {

                                ProductData productData = ProductData();
                                productData.name = _nameController.text;
                                productData.type = _typeText;
                                productData.price = double.parse(_priceController.text);
                                productData.soldPer = _soldPerText;
                                productData.quantity = int.parse(_quantityController.text);
                                productData.description = _descriptionController.text;
                                productData.farm_name = UserModel.of(context).userData.farmData.name;
                                productData.farm_id = UserModel.of(context).userData.farmData.farmId;
                                productData.image = _imageUrl;

                                ProductModel productModel = ProductModel();
                                productModel.insertProduct(productData);
                              }
                            },
                          )),
                    ],
                  )),
            ),
          );
          // }
        },
      ),
      // bottomSheet: FlatButton(
      //   onPressed: () {
      //     //adicionar função que edita produto
      //     Navigator.of(context).pop();
      //   },
      //   color: Colors.white,
      //   child: Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: Container(
      //       color: Colors.green,
      //       height: 50,
      //       width: MediaQuery.of(context).size.width * 0.9,
      //       child: Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Center(
      //           child: Text(
      //             'Editar',
      //             style: TextStyle(fontSize: 20, color: Colors.white),
      //             textAlign: TextAlign.center,
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }

  void initialValues() {
    // Timestamp timestamp = UserModel.of(context).userData['birth'];
    // print(UserModel.of(context).userData['birth'].toString());
    // DateTime date =
    //     DateTime.fromMillisecondsSinceEpoch(timestamp.millisecondsSinceEpoch);
    // _cepController.text = UserModel.of(context).userData['cep'];
    // _adressController.text = UserModel.of(context).userData['adress'];
    // _adressComplementController.text =
    //     UserModel.of(context).userData['adress_complement'];
    // _birthController.text = formatDate(date, [dd, '/', mm, '/', yyyy]);
    // //_genderText = UserModel.of(context).userData['gender'];
    // _nameController.text = UserModel.of(context).userData['name'];
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
