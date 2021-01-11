import 'package:flutter/material.dart';
import 'package:localfarm/Datas/cart_data.dart';
import 'package:localfarm/Datas/product_data.dart';
import 'package:localfarm/stores/count_mobx.dart';

import 'cart_counter.dart';
import 'product_title_with_image.dart';

class Body extends StatelessWidget {
  final ProductData product;
  final ItemCounterStore numItems;

  const Body({Key key, this.product, this.numItems}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // It provide us total height and width
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height * 0.9,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.31),
                  padding: EdgeInsets.only(
                    top: size.height * 0.09,
                    left: 15,
                    right: 15,
                  ),
                  // height: 500,
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(color: Colors.black),
                                children: [
                                  TextSpan(text: "Categoria\n"),
                                  TextSpan(
                                      text: "${product.type}",
                                      style:
                                          Theme.of(context).textTheme.headline6
                                      // .copyWith(fontWeight: FontWeight.bold),
                                      )
                                ],
                              ),
                            ),
                          ),
                          // Expanded(
                          //   child: RichText(
                          //     text: TextSpan(
                          //       style: TextStyle(color: Colors.black),
                          //       children: [
                          //         TextSpan(text: "Estoque\n"),
                          //         TextSpan(
                          //           text: "${product.quantity}/50",
                          //           style: Theme.of(context)
                          //               .textTheme
                          //               .headline5
                          //               .copyWith(fontWeight: FontWeight.bold),
                          //         )
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(color: Colors.black),
                                children: [
                                  TextSpan(text: "Disponível\n"),
                                  TextSpan(
                                      text: '~' +
                                          product.quantity.toString() +
                                          product.soldPer,
                                      style:
                                          Theme.of(context).textTheme.headline6
                                      // .copyWith(fontWeight: FontWeight.bold),
                                      )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.02),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          product.description,
                          style: TextStyle(height: 1.5),
                        ),
                      ),
                      SizedBox(height: size.height * 0.02),
                      CartCounter(product: product, numItems: numItems),
                      // CounterWithFavBtn(),
                      SizedBox(height: size.height * 0.04),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(vertical: 15),
                      //   child: Row(
                      //     children: <Widget>[
                      //       Container(
                      //         margin: EdgeInsets.only(right: 15),
                      //         height: 50,
                      //         width: 58,
                      //         decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(18),
                      //           border: Border.all(
                      //             // color: product.color,
                      //             color: Colors.green,
                      //           ),
                      //         ),
                      //         child: IconButton(
                      //           icon: Icon(
                      //             Icons.add_shopping_cart,
                      //             color: Colors.green,
                      //           ),
                      //           color: Colors.grey,
                      //           onPressed: () {},
                      //         ),
                      //       ),
                      //       Expanded(
                      //         child: SizedBox(
                      //           height: 50,
                      //           child: FlatButton(
                      //             shape: RoundedRectangleBorder(
                      //                 borderRadius: BorderRadius.circular(18)),
                      //             // color: product.color,
                      //             color: Colors.orange,
                      //             onPressed: () {},
                      //             child: Text(
                      //               "Adicionar ao carrinho".toUpperCase(),
                      //               style: TextStyle(
                      //                 fontSize: 17,
                      //                 // fontWeight: FontWeight.bold,
                      //                 color: Colors.white,
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
                ProductTitleWithImage(product: product)
              ],
            ),
          )
        ],
      ),
    );
  }
}
