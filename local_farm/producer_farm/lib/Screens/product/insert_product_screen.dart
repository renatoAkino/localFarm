import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:producerfarm/Datas/product_data.dart';
import 'package:producerfarm/Models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class InsertProductScreen extends StatefulWidget {
  @override
  _InsertProductScreenState createState() => _InsertProductScreenState();
}

class _InsertProductScreenState extends State<InsertProductScreen> {
  final _cepController = TextEditingController();
  final _adressController = TextEditingController();
  final _adressComplementController = TextEditingController();
  final _birthController = TextEditingController();
  String _genderText;
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
                              value: _genderText,
                              onChanged: (String newValue) {
                                setState(() {
                                  _genderText = newValue;
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
                              controller: _adressController,
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
                              value: _genderText,
                              onChanged: (String newValue) {
                                setState(() {
                                  _genderText = newValue;
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
                              controller: _adressComplementController,
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
                              controller: _cepController,
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
                              if (_formKey.currentState.validate()) {
                                Map<String, dynamic> userData = Map();

                                userData['name'] = _nameController.text;
                                userData['cep'] = _cepController.text;
                                userData['adress'] = _adressController.text;
                                userData['adress_complement'] =
                                    _adressComplementController.text;
                                userData['gender'] = _genderText;

                                // model.updateProduct(
                                //     // userData: userData,
                                //     // onSucess: onSucess,
                                //     // onFailed: onFailed
                                //     );
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
