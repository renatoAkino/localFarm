import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
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
                        // '14/12/2020',
                        _formatDate(this.order.order_date),
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
                        'R\$ ${order.totalPrice.toStringAsFixed(2)}',
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
                    // this.order.products[0].farm_name,
                    _getFarmName(this.order),
                    style: TextStyle(
                      fontSize: 16,
                      // color: Colors.white,
                    ),
                  ),
                ],
              ),
              // SizedBox(
              //   height: 10,
              // ),

              /*
              //index de 0 à 4
              StatusProgressWidget(
                index: order.status,
              // dark: true,
              ),
              */

              // SimpleRoundOnlyIconButton(),
              // A PARTIR DAQUI É SÓ O BOTÃO
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    // margin: const EdgeInsets.only(top: 10.0),
                    padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: new Row(
                      children: <Widget>[
                        new Expanded(
                          child: FlatButton(
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0)),
                            splashColor: Colors.green,
                            color: Colors.green,
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
                                  builder: (context) =>
                                      OrderDetailScreen(this.order),
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

String _formatDate(Timestamp date) {
  var formattedDate;
  date != null
      ? formattedDate = DateFormat("dd/MM/yyyy").format(date.toDate())
      : formattedDate = "";
  return formattedDate;

}

String _getFarmName(OrderData order) {
  var farmName;
  var quantityFarmers = order.products.length;
  if (order.products[0].farm_name == null) {
    farmName = "";
  } else {
    if (quantityFarmers > 1) {
      farmName = order.products[0].farm_name +
          " + " +
          (quantityFarmers - 1).toString();
    } else {
      farmName = order.products[0].farm_name;
    }
  }

  return farmName;
}
