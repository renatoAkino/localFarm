import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localfarm/Datas/order_data.dart';
import 'package:localfarm/Screens/store_screen.dart';

import '../order_detail_screen.dart';
import 'button.dart';
import 'status_progress_widget.dart';

class OrderTile extends StatelessWidget {
  final OrderData order;

  OrderTile(this.order);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 0,
        // color: Color.fromRGBO(93, 97, 115, 1),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pedido',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Text(
                          // '123D6',
                          order.order_id,
                          style: TextStyle(
                            fontSize: 16,
                            // color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Data da Entrega',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        '14/12/2020',
                        style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold
                          // color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Itens',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        // '8',
                        order.products.length.toString(),
                        style: TextStyle(
                          fontSize: 16,
                          // color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Total',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        // r'R$ 64,51',
                        'R\$ ${order.totalPrice.toString()}',
                        style: TextStyle(
                          fontSize: 16,
                          // color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Produtor',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  // FutureBuilder(
                  //   future: order.getFarmData(),
                  //   builder: (context, snapshot) {
                  //     if (order.farmData != null) {
                  //       return Text(
                  //         order.farmData.name,
                  //         style: TextStyle(
                  //           fontSize: 16,
                  //           // color: Colors.white,
                  //         ),
                  //       );
                  //     } else {
                  //       return Container(
                  //         child: Text('Erro de conexão'),
                  //       );
                  //     }
                  //   },
                  // ),
                  Text(
                    'Fazenda Monte Verde',
                    style: TextStyle(
                      fontSize: 16,
                      // color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              StatusProgressWidget(
                //index de 0 à 4
                index: order.status,
              ),
              // SimpleRoundOnlyIconButton(),
              // A OARTIR DAQUI É SÓ O BOTÃO
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                    width: 160,
                    child: new Row(
                      children: <Widget>[
                        new Expanded(
                          child: FlatButton(
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0)),
                            splashColor: Colors.green,
                            color: Colors.orange,
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.only(
                                      left: 5.0,
                                      right: 5.0,
                                      top: 10.0,
                                      bottom: 10.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Text(
                                        'Detalhes',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => OrderDetailScreen(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}