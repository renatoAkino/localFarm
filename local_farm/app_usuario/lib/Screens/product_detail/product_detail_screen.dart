import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:localfarm/Datas/cart_data.dart';
import 'package:localfarm/Datas/product_data.dart';
import 'package:localfarm/Models/cart_model.dart';
import 'package:localfarm/Models/user_model.dart';
import 'package:localfarm/Screens/cart/components/cart_icon.dart';
import 'package:localfarm/stores/count_mobx.dart';

import 'components/body.dart';

class DetailsScreen extends StatefulWidget {
  final ProductData product;
  const DetailsScreen({Key key, this.product}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  ItemCounterStore numItems = ItemCounterStore();
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
      body: Body(product: widget.product, numItems: numItems),

      /// FOOTER BOTÃO ADICIONAR AO CARRINHO
      bottomNavigationBar: Container(
        color: Colors.grey[50],
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 15),
                height: 50,
                // width: 80,
                width: MediaQuery.of(context).size.width * 0.3,
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(18),
                //   border: Border.all(
                //     // color: product.color,
                //     color: Colors.green,
                //   ),
                // ),
                // child: IconButton(
                //   icon: Icon(
                //     Icons.add_shopping_cart,
                //     color: Colors.green,
                //   ),
                //   color: Colors.grey,
                //   onPressed: () {},
                // ),
              ),
              Observer(
                builder: (_) {
                  return Expanded(
                    child: SizedBox(
                      height: 50,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        // color: product.color,
                        color: Colors.orange,
                        child: Text(
                          "Adicionar ao carrinho".toUpperCase(),
                          // numItems.count.toString().toUpperCase(),
                          style: TextStyle(
                            fontSize: 16,
                            // fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          print(widget.product.farm_name);
                          if (UserModel.of(context).isLoggedin()) {
                            CartData cartData = CartData();
                            cartData.product_id = widget.product.id;
                            // PRECISA BUSCAR A QUANTIDADE DO CONTADOR cart_counter.dart
                            cartData.quantity = numItems.count;
                            cartData.productData = widget.product;
                            cartData.farm_name = widget.product.farm_name;
                            cartData.farm_id = widget.product.farm_id;
                            // print(cartData.productData.name);
                            print(cartData.productData.quantity);

                            CartModel.of(context).addCartItem(cartData);

                            // _showMyDialog(context);
                            //   // } else {
                            //   //   onFailed();
                            //   // }
                          }
                          // return _showMyDialog(context);
                        },
                      ),
                    ),
                  );
                },
              )
            ],
          ),
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
        title: Text('Item Inserido!'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Clique em Ok para continuar comprando'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
