import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:producerfarm/Datas/order_data.dart';
import 'package:producerfarm/Datas/product_data.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../Models/user_model.dart';
import '../../Models/user_model.dart';
import 'delete_screen.dart';
import 'edit_product_screen.dart';
import 'insert_product_screen.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool status = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        // leading: Image.asset('local_farm/producer_farm/assets/logo.png'),
        elevation: 0,
        title: Text('Meus Produtos'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => InsertProductScreen(),
                  ),
                );
              },
              icon: Icon(
                Icons.add,
                color: Colors.green,
                size: 30,
              ),
            ),
          )
        ],
      ),
      body: ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {
          return FutureBuilder<QuerySnapshot>(
              future: FirebaseFirestore.instance
                  .collection('farms')
                  .doc(model.userData.farmData.farmId)
                  .collection('products')
                  .get(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView(
                    children: snapshot.data.docs.map((e) {
                      ProductData productData = ProductData.fromDocument(e);
                      // return Column(
                      //   children: [
                      //     Padding(
                      //       padding: const EdgeInsets.all(0.0),
                      //       child: ListTile(
                      //         tileColor: Colors.white,
                      //         leading: Image.network(productData.image),
                      //         title: Text(productData.name),
                      //         subtitle: Column(
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           children: [
                      //             Text(productData.type),
                      //             Text(productData.description),
                      //           ],
                      //         ),
                      //         trailing: Column(
                      //           children: [
                      //             Text('R\$ ' +
                      //                 productData.price.toStringAsPrecision(2)),
                      //             Text(productData.soldPer),
                      //             Text(productData.quantity.toString()),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       height: 20,
                      //     ),
                      //   ],
                      // );

                      return Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                        elevation: 3,
                        shadowColor: Colors.white,
                        margin: EdgeInsets.only(
                            top: 10, bottom: 0, left: 15, right: 15),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: ExpansionTile(
                            title: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 15.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    height: 60,
                                    width: 60,
                                    child: Image.network(productData.image),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          productData.name,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'qtd: ' +
                                              productData.quantity.toString(),
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        'R\$ ' +
                                            productData.price
                                                .toStringAsPrecision(2),
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        productData.soldPer,
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            // trailing: SizedBox(),

                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 0, bottom: 10, left: 20, right: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Descrição',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 10),
                                child: Column(
                                  children: [
                                    Text(productData.description),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, bottom: 8, right: 10, left: 10),
                                child: Row(
                                  children: [
                                    // // BOTÃO SWITCH (PRODUTO INDIPONÍVEL OU DISPONÍVEL)
                                    // Column(
                                    //   children: [
                                    //     Switch(
                                    //       activeColor: Colors.green,
                                    //       value: status,
                                    //       onChanged: (value) {
                                    //         setState(() {
                                    //           status = value;
                                    //         });
                                    //       },
                                    //     ),
                                    //     Text(
                                    //       status
                                    //           ? 'disponível'
                                    //           : 'indisponível',
                                    //       style: TextStyle(
                                    //           fontSize: 10, color: Colors.grey),
                                    //     )
                                    //   ],
                                    // ),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          FlatButton(
                                            // onPressed: showAlertDialog(),
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      DeleteScreen(productData),
                                                ),
                                              );
                                            },
                                            textColor: Colors.white,
                                            color: Colors.red,
                                            // padding: const EdgeInsets.all(8.0),
                                            child: Icon(
                                              Icons.delete,
                                              size: 25,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          FlatButton(
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      EditProductScreen(
                                                          productData),
                                                ),
                                              );
                                            },
                                            textColor: Colors.white,
                                            color: Colors.green,
                                            // padding: const EdgeInsets.all(8.0),
                                            child: Icon(
                                              Icons.mode_edit,
                                              size: 25,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  );
                }
                return Container();
              });
        },
      ),
    );
  }

  showAlertDialog() {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancelar"),
      onPressed: () {
        // Navigator.pop(context);
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Sim"),
      onPressed: () {
        // mensagem.wasRead = true;
        // Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Icon(Icons.dangerous, color: Colors.red, size: 40),
      content: Text('Tem certeza que deseja excluir esse produto?'),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
