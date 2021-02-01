import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:producerfarm/Datas/order_data.dart';
import 'package:producerfarm/Models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:intl/intl.dart';

import '../../constants.dart';
import 'confirmation_screen.dart';
import 'order_detail_screen.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        // leading: Image.asset('local_farm/producer_farm/assets/logo.png'),
        elevation: 0,
        title: Text('Pedidos'),
        actions: <Widget>[],
      ),
      body: ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {
          return FutureBuilder<QuerySnapshot>(
              future: FirebaseFirestore.instance.
              collection('orders').
              where('farmId', isEqualTo: UserModel.of(context).userData.farmData.farmId)
              .get(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView(
                    children: snapshot.data.docs.map((e) {
                      OrderData orderData = OrderData.fromDocument(e);

                      // obtendo o Map do arquivo constants.dart a partir do índice
                      var mapStatus = Constants.statusOrder.entries.firstWhere(
                          (element) => element.key == orderData.status);
                      //Filtrando a cor indicada no value do tipo Map selecionado acima
                      var cor = mapStatus.value.entries
                          .firstWhere((e) => e.key == 'cor')
                          .value;
                      //Filtrando o status indicado no value do tipo Map selecionado acima
                      var status = mapStatus.value.entries
                          .firstWhere((e) => e.key == 'status')
                          .value;
                      //Filtrando o ícone indicada no value do tipo Map selecionado acima
                      var icon = mapStatus.value.entries
                          .firstWhere((e) => e.key == 'icon')
                          .value;

                      String dataAberturaFormatada =
                          _dataFormatada(orderData.order_date);
                      String dataEntregaFormatada =
                          _dataFormatada(orderData.ship_date);

                      return InkWell(
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                          height: 140,
                          decoration: BoxDecoration(
                            // border: Border.all(color: Colors.white, width: 2.0),

                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              //  Radius.circular(10.0),
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                            boxShadow: <BoxShadow>[
                              new BoxShadow(
                                color: Colors.grey[300],
                                blurRadius: 3.0,
                                offset: new Offset(0.0, 3.0),
                              ),
                            ],
                          ),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                color: cor,
                                width: 5,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, bottom: 16.0, right: 8.0),
                                  // child: Column(
                                  //   crossAxisAlignment: CrossAxisAlignment.start,
                                  //   mainAxisAlignment:
                                  //       MainAxisAlignment.spaceAround,
                                  //   children: [
                                  //     Text(
                                  //       status,
                                  //       style: TextStyle(
                                  //           fontWeight: FontWeight.bold,
                                  //           fontSize: 20),
                                  //     ),
                                  //     Text(dataAberturaFormatada),
                                  //     Text('cliente: ${orderData.client_id}'),
                                  //     Text(orderData.totalPrice
                                  //         .toStringAsFixed(2)),
                                  //     // Text(dataFinalizacaoFormatada),
                                  //     // Text(ordem.status),
                                  //   ],
                                  // ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Nº: ' + orderData.order_id,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          // Icon(
                                          //   icon,
                                          //   color: cor,
                                          // ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            // orderData.client_id,
                                            'Realizado em: ' +
                                                dataAberturaFormatada,
                                            style: TextStyle(
                                                // fontWeight: FontWeight.bold,
                                                // fontSize: 20,
                                                ),
                                          ),
                                          // Text(
                                          //   status,
                                          //   style: TextStyle(
                                          //     // fontWeight: FontWeight.bold,
                                          //     fontSize: 12,
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                      // SizedBox(
                                      //   height: 15,
                                      // ),
                                      Text('Valor Total: R\$' +
                                          orderData.totalPrice
                                              .toStringAsFixed(2)),
                                      Text('Entrega em: ' +
                                          dataEntregaFormatada),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, bottom: 8.0, right: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Icon(
                                          icon,
                                          color: cor,
                                        ),
                                        Text(
                                          status,
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                    orderData.status == 3
                                        ? FlatButton(
                                            // onPressed: showAlertDialog(orderData.order_id),
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ConfirmScreen(orderData),
                                                ),
                                              );
                                            },
                                            textColor: Colors.white,
                                            color: cor,
                                            // padding: const EdgeInsets.all(8.0),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(3.0),
                                              child: Text(
                                                'Confirmar\nRecebimento',
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          )
                                        : Container()
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  OrderDetailScreen(orderData),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  );
                }
                return Container();
              });
        },
      ),
    );
  }

  String _dataFormatada(DateTime dataEntr) {
    if (dataEntr != null) {
      DateTime dateAbertura = DateTime.parse(dataEntr.toString());
      DateFormat dateFormat = DateFormat("dd/MM/yyyy");
      String formattedDate = dateFormat.format(dateAbertura);
      return formattedDate;
    }
    return '--';
    // Convertendo a string de data pra DateTime e alterando o formato de exibição
  }
}
