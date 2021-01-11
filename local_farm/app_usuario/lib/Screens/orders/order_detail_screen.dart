import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:localfarm/Datas/order_data.dart';

class OrderDetailScreen extends StatelessWidget {
  final OrderData order;

  OrderDetailScreen(this.order);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          centerTitle: true,
          title: Text('Detalhes do Pedido'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text('Status:'),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                      // '<nº do status>'
                      this.order.status.toString()
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text('Nota:'),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('código'),
                  Text(this.order.order_id),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('data do pedido'),
                  Text(_formatDate(order.order_date)),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Estabelecimento'),
                  Text('<Fazenda por do Sol>'),

                ],
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     Text('Estabelecimento'),
              //     Text('<Fazenda por do Sol>'),
              //   ],
              // ),
              SizedBox(
                height: 30,
              ),
              Text('Itens:'),
              SizedBox(
                height: 10,
              ),
              _buildRow(this.order),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text('R\$ ' + this.order.totalPrice.toStringAsFixed(2)),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Text('Entrega:'),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Endereço'),
                  Text('<Rua Saturnino de Brito>'),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Entregador'),
                  Column(
                    children: [
                      //aqui pode ser a foto e nome do proprietário da fazenda
                      Text('<foto>'),
                      Text('<José Simão>'),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('data agendada'),
                  Text(_formatDate(this.order.ship_date)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('hora agendada'),
                  Text('<8:00 - 12:00>'),
                ],
              ),
            ],
          ),
        ));
  }
}

String _formatDate(Timestamp date) {
  var formattedDate;
  date != null? formattedDate = DateFormat("dd/MM/yyyy").format(date.toDate()) : formattedDate = "";
  return formattedDate;
}

Widget _buildRow(OrderData order) {
  return Container(
    padding: EdgeInsets.all(16.0),
    child: Column(
      children: _buildItensList(order),
    ),
  );
}

List<Widget> _buildItensList(OrderData order) {
  List<Widget> itens = [];
  for(var i = 0; i < order.products.length; i++) {
     itens.add( Row(
       mainAxisAlignment: MainAxisAlignment.spaceAround,
       children: [
         Column(
           children: [
             Text(order.products[i].name, style: TextStyle(fontSize: 20)),
             Text(order.products[i].quantity.toString() + ' un. x R\$ ' + order.products[i].price.toStringAsFixed(2)),
             Text(order.products[i].farm_name == null ? "" : order.products[i].farm_name)
           ],
         ),
         Text('R\$ ' + (order.products[i].quantity * order.products[i].price).toStringAsFixed(2)),
       ],
     ));
  }
  return itens;
}