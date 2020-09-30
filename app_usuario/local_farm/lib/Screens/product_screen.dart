import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
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

class ProductScreen extends StatefulWidget {
  final ProductData productData;
  ProductScreen(this.productData);

  @override
  _ProductScreenState createState() => _ProductScreenState(productData);
}

class _ProductScreenState extends State<ProductScreen> {
  final ProductData productData;

  _ProductScreenState(this.productData);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
//        appBar: AppBar(
//
//          elevation: 0,
//          flexibleSpace: Container(
//            decoration: BoxDecoration(
//                gradient: LinearGradient(
//                    begin: Alignment.topLeft,
//                    end: Alignment.bottomRight,
//                    colors: <Color>[
//                      Theme.of(context).primaryColor,
//                      Color.fromARGB(255, 180,233,218)
//                    ])
//            ),
//          ),
//          actions: <Widget>[
//            IconButton(
//              onPressed: (){},
//              icon: Icon(Icons.shopping_cart),
//            )
//          ],
//        ),
////        AppBar(
////          elevation: 0,
////          backgroundColor: Colors.transparent,
////
////        ),
        body: Stack(
          children: <Widget>[

            CarouselSlider(
              viewportFraction: 1.0,
              aspectRatio: 1.3,
              enlargeCenterPage: false,
              enableInfiniteScroll: true,
              autoPlay: true,
              items: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(productData.images['0']),
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(productData.images['1']),
                          fit: BoxFit.cover)
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(productData.images['2']),
                        fit: BoxFit.cover),
                  ),
                ),
              ],
            ),

            ListView(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 250),
                  padding: EdgeInsets.only(left: 15,top: 20, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(productData.title,style: TextStyle(fontSize: 27),),
                      Text("R\$ ${productData.price.toStringAsFixed(2)}",style: TextStyle(fontSize: 27),),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))
                  ),
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.only(left: 15,top: 20),
                  child: Text("Descrição da parada q tem q colocar bastante coisa pra preencher espaço na tela pq se não fica muito buraco bla bla bla bla bla bla bla", style: TextStyle(fontSize: 20),),
                ),
                Container(
                  color: Colors.white,
                  height: 40,
                ),

                Container(
                  color: Colors.white,
                  padding: EdgeInsets.only(left: 15,top: 20),
                  child: Text("Adicionar ao carrionho", style: TextStyle(fontSize: 27),),
                ),

              ],
            ),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: MaterialButton(
                  padding: EdgeInsets.all(8),
                  child: Icon(Icons.arrow_back_ios),
                  onPressed: () => Navigator.of(context).pop(context),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  color: Colors.white.withOpacity(0.9),
                  height: 40,
                  minWidth: 0,
                ),
              )
            )

          ],
        ),



    );
  }
}
