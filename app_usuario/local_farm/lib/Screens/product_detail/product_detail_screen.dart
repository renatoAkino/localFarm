import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:localfarm/Datas/farm_data.dart';
import 'package:localfarm/Datas/product_data.dart';
import 'package:localfarm/Screens/cart/components/cart_icon.dart';

import 'components/body.dart';

class DetailsScreen extends StatelessWidget {
  final ProductData product;

  const DetailsScreen({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // each product have a color
      // backgroundColor: product.color,
      backgroundColor: Colors.green,
      appBar: AppBar(
        // backgroundColor: product.color,
        backgroundColor: Colors.green,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),

        //ìcone do carrinho
        actions: <Widget>[CartIconWidget()],
      ),
      body: Body(product: product),
    );
  }
}