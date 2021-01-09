import 'package:flutter/material.dart';

class OrderDetailScreen extends StatelessWidget {
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
                  Text('<nº do status>'),
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
                  Text('<123456>'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('data do pedido'),
                  Text('<15/05/2020>'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Estabelecimento'),
                  Text('<Fazenda por do Sol>'),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text('Itens:'),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        'Abacate verde',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text('<5> unidades x R\$ <3,54>'),
                    ],
                  ),
                  Text('R\$ <54,54>'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        'Abacate verde',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text('<5> unidades x R\$ <3,54>'),
                    ],
                  ),
                  Text('R\$ <54,54>'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        'Abacate verde',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text('<5> unidades x R\$ <3,54>'),
                    ],
                  ),
                  Text('R\$ <54,54>'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        'Abacate verde',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text('<5> unidades x R\$ <3,54>'),
                    ],
                  ),
                  Text('R\$ <54,54>'),
                ],
              ),
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
                  Text('R\$ <225,54>'),
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
                  Text('<20/05/2020>'),
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
