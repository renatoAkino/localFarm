import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:localfarm/Datas/product_data.dart';
import 'package:localfarm/Models/cart_model.dart';
import 'package:localfarm/Models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

import 'login_screen.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
        RaisedButton(
          child: Text("Confirmar pedido"),
          onPressed: (){
            CartModel.of(context).finishOrder();
          },
        )
      ],

    )
    );
  }
}
