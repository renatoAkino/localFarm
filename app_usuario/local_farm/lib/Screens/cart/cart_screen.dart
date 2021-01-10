import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:localfarm/Datas/product_data.dart';
import 'package:localfarm/Models/cart_model.dart';
import 'package:localfarm/Models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

import '../login_screen.dart';
import 'package:localfarm/Screens/cart/components/cart_item.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
  }

  DateTime selectedDate = DateTime.now();

  final dataFormatada = new DateFormat('dd/MM/yyyy');

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2020, 8),
        lastDate: DateTime(2025),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: Colors.green,
              accentColor: Colors.green,
              colorScheme: ColorScheme.light(primary: Colors.green),
              buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
            ),
            child: child,
          );
        });
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  double totalPrice = 0.0;

  @override
  Widget build(BuildContext context) {
    bool hasProducts = false;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Text(
          "Meu Carrinho",
          style: TextStyle(
            fontSize: 23,
            // fontWeight: FontWeight.w800,
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            tooltip: "Back",
            icon: Icon(
              Icons.clear,
              color: Theme.of(context).accentColor,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 80),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 0.0),
            ScopedModelDescendant<CartModel>(
              builder: (context, child, model) {
                if (model.isLoading && UserModel.of(context).isLoggedin()) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (!UserModel.of(context).isLoggedin()) {
                  return Center(
                    child: GestureDetector(
                      child: Text("Faça login para ver seu carrinho!"),
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => LoginScreen()));
                      },
                    ),
                  );
                } else if (model.products == null ||
                    model.products.length == 0) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/shopping-cart-empty-side-view.svg',
                            height: 80.0,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text("Nenhum produto no carrinho"),
                        ],
                      ),
                    ),
                  );
                } else {
                  hasProducts = true;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Endereço de Entrega",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          // IconButton(
                          //   onPressed: () {},
                          //   icon: Icon(
                          //     Icons.edit,
                          //   ),
                          // ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      ListTile(
                        // tileColor: Colors.grey[200],
                        title: Text(
                          "Avenida Um, 35",
                          style: TextStyle(
//                    fontSize: 15,
                            fontWeight: FontWeight.bold,
                            // color: Colors.green,
                          ),
                        ),
                        subtitle: Text(
                            "1278 Loving Acres Road Kansas City, MO 64110"),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.edit,
                          ),
                        ),
                        // trailing: Icon(Icons.edit),
                      ),
                      SizedBox(height: 20.0),
                      // Text(
                      //   "Método de Pagamento",
                      //   style: TextStyle(
                      //     fontSize: 15,
                      //     // fontWeight: FontWeight.w400,
                      //   ),
                      // ),
                      // // SizedBox(
                      // //   height: 10,
                      // // ),
                      // Card(
                      //   elevation: 2.0,
                      //   child: ListTile(
                      //     title: Text("José da Silva"),
                      //     subtitle: Text(
                      //       "5506 7744 8610 9638",
                      //       style: TextStyle(
                      //         fontSize: 13,
                      //         // fontWeight: FontWeight.w900,
                      //       ),
                      //     ),
                      //     leading: Icon(
                      //       FontAwesomeIcons.creditCard,
                      //       size: 50.0,
                      //       color: Colors.green,
                      //     ),
                      //     trailing: IconButton(
                      //       onPressed: () {},
                      //       icon: Icon(
                      //         Icons.keyboard_arrow_down,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(height: 20.0),
                      Text(
                        "Agendar entrega",
                        style: TextStyle(
                          fontSize: 15,
                          // fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 10),
                      Card(
                        elevation: 2.0,
                        child: ListTile(
                          title: Text("${dataFormatada.format(selectedDate)}"),
                          subtitle: Text(
                            "8:00 - 10:00",
                            style: TextStyle(
                              fontSize: 13,
                              // fontWeight: FontWeight.w900,
                            ),
                          ),
                          leading: Icon(
                            FontAwesomeIcons.calendarCheck,
                            size: 50.0,
                            color: Colors.green,
                          ),
                          trailing: IconButton(
                            onPressed: () => _selectDate(context),
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        "Itens",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Column(
                        children: model.products.map((product) {
                          return FutureBuilder(
                            future: Firestore.instance
                                .collection('products')
                                .document(product.product_id)
                                .get(),
                            builder: (context, snapshot) {
                              if(snapshot.hasData){
                                product.productData =
                                    ProductData.fromDocument(snapshot.data);
                                double prodPrice =
                                    product.quantity * product.productData.price;

                                totalPrice += prodPrice;

                                return CartItem(
                                  img: product.productData.images['0'],
                                  isFav: false,
                                  name: product.productData.title,
                                  price: prodPrice,
                                  quantity: product.quantity,
                                  rating: 5.0,
                                  raters: 23,
                                );
                              }else{
                                return Container();
                              }
                            },
                          );
                        }).toList(),
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Total",
                        style: TextStyle(
                            // fontSize: 13,
                            // fontWeight: FontWeight.w400,
                            ),
                      ),
                      hasProducts
                          ? Text(
                              totalPrice
                                  .toString(), //CORRIGIR ESTADO DO VALOR PARA FUTURE
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w900,
                                // color: Theme.of(context).accentColor,
                                color: Colors.green,
                              ),
                            )
                          : Text(
                              // r"R$ 0,00",
                              totalPrice.toString(),
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                // color: Theme.of(context).accentColor,
                                color: Colors.green,
                              ),
                            ),
                      Text(
                        "Taxas de entrega inclusas",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: SizedBox(
                    height: 50,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                      // color: product.color,
                      color: Colors.green,
                      onPressed: () {
                        if (hasProducts) {
                          hasProducts = false;
                          return _showMyDialog(context);
                        }
                      },
                      child: Text(
                        "Finalizar Compra".toUpperCase(),
                        style: TextStyle(
                          fontSize: 17,
                          // fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                // Container(
                //   padding: EdgeInsets.fromLTRB(5, 5, 10, 5),
                //   width: 190.0,
                //   height: 60.0,
                //   child: FlatButton(
                //     // color: Theme.of(context).accentColor,
                //     color: Colors.green,
                //     child: Text(
                //       "Confirmar Pedido".toUpperCase(),
                //       style: TextStyle(
                //         color: Colors.white,
                //       ),
                //     ),
                //     onPressed: () {
                //       if (hasProducts) {
                //         hasProducts = false;
                //         return _showMyDialog(context);
                //       }
                //     },
                //   ),
                // ),
              ],
            ),
          ],
        ),
        height: 80,
      ),
    );
  }
}

Future<void> _showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Compra efetuada com sucesso!'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Você receberá seu pedido em breve.'),
              Text('Fique atento ao prazo e notificações de entrega.'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Ok'),
            onPressed: () {
              CartModel.of(context).finishOrder();
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
