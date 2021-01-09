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
      bottomNavigationBar: Container(
        color: Colors.grey[50],
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 15),
                height: 50,
                width: 58,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    // color: product.color,
                    color: Colors.green,
                  ),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.add_shopping_cart,
                    color: Colors.green,
                  ),
                  color: Colors.grey,
                  onPressed: () {},
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
                    // color: product.color,
                    color: Colors.orange,
                    onPressed: () {},
                    child: Text(
                      "Adicionar ao carrinho".toUpperCase(),
                      style: TextStyle(
                        fontSize: 17,
                        // fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
