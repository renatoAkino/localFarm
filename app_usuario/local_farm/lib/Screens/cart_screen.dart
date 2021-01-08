import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:localfarm/Datas/product_data.dart';
import 'package:localfarm/Models/cart_model.dart';
import 'package:localfarm/Models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

import 'login_screen.dart';
import 'package:localfarm/widgets/cart_item.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
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
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                ),
              );
            } else if (model.products == null || model.products.length == 0) {
              return Center(
                child: Text("Nenhum produto no carrinho"),
              );
            } else {
              return Column(
                children: model.products.map(
                  (product) {
                    return FutureBuilder(
                      future: Firestore.instance
                          .collection('products')
                          .document(product.product_id)
                          .get(),
                      builder: (context, snapshot) {
                        if(snapshot.hasData){
                          product.productData =
                              ProductData.fromDocument(snapshot.data);
                          double price =
                              product.quantity * product.productData.price;
                          return Container(
                            padding: EdgeInsets.all(20),
                            child: Text(
                                "${product.quantity}  ${product.productData.title} ----------- R\$$price"),
                          );
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );

                      },
                    );
                }).toList(),
              );
            }
            return Container();
          },
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
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 80),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 10.0),
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
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.edit,
                            ),
                          ),
                        ],
                      ),
                      ListTile(
                        title: Text(
                          "Avenida Um, 35",
                          style: TextStyle(
//                    fontSize: 15,
                            fontWeight: FontWeight.w900,
                            // color: Colors.green,
                          ),
                        ),
                        subtitle: Text(
                            "1278 Loving Acres Road Kansas City, MO 64110"),
                        // trailing: Icon(Icons.edit),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "Método de Pagamento",
                        style: TextStyle(
                          fontSize: 15,
                          // fontWeight: FontWeight.w400,
                        ),
                      ),
                      Card(
                        elevation: 4.0,
                        child: ListTile(
                          title: Text("José da Silva"),
                          subtitle: Text(
                            "5506 7744 8610 9638",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          leading: Icon(
                            FontAwesomeIcons.creditCard,
                            size: 50.0,
                            color: Colors.green,
                          ),
                          trailing: IconButton(
                            onPressed: () {},
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
                              product.productData =
                                  ProductData.fromDocument(snapshot.data);
                              double prodPrice =
                                  product.quantity * product.productData.price;

                              totalPrice += prodPrice;
                              print(totalPrice);

                              return CartItem(
                                img: product.productData.images['0'],
                                isFav: false,
                                name: product.productData.title,
                                price: prodPrice,
                                quantity: product.quantity,
                                rating: 5.0,
                                raters: 23,
                              );
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
      bottomSheet: Card(
        elevation: 4.0,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Total",
                          style: TextStyle(
                            // fontSize: 13,
                            fontWeight: FontWeight.w400,
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
                                r"R$ 0,00",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w900,
                                  // color: Theme.of(context).accentColor,
                                  color: Colors.green,
                                ),
                              ),
                        Text(
                          "Taxas de entrega inclusas",
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 5, 10, 5),
                    width: 180.0,
                    height: 60.0,
                    child: FlatButton(
                      // color: Theme.of(context).accentColor,
                      color: Colors.green,
                      child: Text(
                        "Confirmar Pedido".toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        if (hasProducts) {
                          hasProducts = false;
                          return _showMyDialog(context);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          height: 80,
        ),
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
            },
          ),
        ],
      );
    },
  );
}
