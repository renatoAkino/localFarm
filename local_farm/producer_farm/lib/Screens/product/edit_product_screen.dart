import 'package:flutter/material.dart';
import 'package:producerfarm/Datas/product_data.dart';
import 'package:producerfarm/Models/product_model.dart';
import 'package:producerfarm/Models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class EditProductScreen extends StatefulWidget {
  final ProductData product;

  EditProductScreen(this.product);

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
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
        title: Text('Editar Produto'),
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
                                "Alterar",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                ProductData productData = ProductData();
                                productData.productId = widget.product.productId;
                                productData.name = _nameController.text;
                                productData.type = _typeText;
                                productData.price = double.parse(_priceController.text);
                                productData.soldPer = _soldPerText;
                                productData.quantity = int.parse(_quantityController.text);
                                productData.description = _descriptionController.text;
                                productData.farm_name = UserModel.of(context).userData.farmData.name;
                                productData.farm_id = UserModel.of(context).userData.farmData.farmId;
                                productData.image = widget.product.image;

                                ProductModel productModel = ProductModel();
                                productModel.updateProduct(productData, onSucess,onFailed, UserModel.of(context).userData.farmData.farmId);
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
    _nameController.text = widget.product.name;
   // _typeText = widget.product.type;
    _priceController.text = widget.product.price.toStringAsFixed(2);
  //  _soldPerText = widget.product.soldPer;
    _quantityController.text = widget.product.quantity.toString();
    _descriptionController.text = widget.product.description;
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
