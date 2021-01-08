import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:localfarm/Datas/farm_data.dart';
import 'package:localfarm/Datas/product_data.dart';
import 'package:localfarm/widgets/category_list.dart';
import 'package:localfarm/widgets/farm_header.dart';
import 'package:localfarm/widgets/products_grid.dart';
import 'package:localfarm/widgets/products_tile.dart';
import 'package:transparent_image/transparent_image.dart';

import 'cart/cart_screen.dart';

class StoreScreen extends StatefulWidget {
  final FarmData farmData;
  StoreScreen(this.farmData);

  @override
  _StoreScreenState createState() => _StoreScreenState(farmData);
}

class _StoreScreenState extends State<StoreScreen> {
  final FarmData farmData;

  _StoreScreenState(this.farmData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                  Theme.of(context).primaryColor,
                  Color.fromARGB(255, 180, 233, 218)
                ])),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    // builder: (context) => CartScreen(),
                    builder: (context) => CartScreen(),
                  ),
                );
              },
              icon: Icon(Icons.shopping_cart),
            )
          ],
        ),
//        AppBar(
//          elevation: 0,
//          backgroundColor: Colors.transparent,
//
//        ),
        body: Stack(
          children: <Widget>[
            Container(
              height: 160,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                    Theme.of(context).primaryColor,
                    Theme.of(context).primaryColor.withOpacity(0.3)
                  ])),
            ),
            Container(
              margin: EdgeInsets.only(top: 150),
              height: 400,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
            ),
            ListView(
              children: <Widget>[
                FarmHeader(farmData),
                Container(
                  padding: EdgeInsets.only(left: 15, top: 20),
                  child: Text(
                    'Categorias',
                    style: TextStyle(fontSize: 30),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20))),
                ),
                CategoryList(),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.only(left: 15, top: 20),
                  child: Text(
                    'Produtos',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                FutureBuilder<QuerySnapshot>(
                  future:
                      Firestore.instance.collection('products').getDocuments(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return ProductsGrid(snapshot);
                    }
                  },
                ),
              ],
            ),
          ],
        ));
  }
}
