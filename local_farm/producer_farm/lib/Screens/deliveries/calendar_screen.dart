import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:producerfarm/Datas/order_data.dart';
import 'package:producerfarm/Models/user_model.dart';
import 'package:producerfarm/Screens/orders/confirmation_screen.dart';
import 'package:producerfarm/Screens/orders/order_detail_screen.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../constants.dart';
import 'components/week_buttons.dart';
import 'map_screen.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        // leading: Image.asset('local_farm/producer_farm/assets/logo.png'),
        elevation: 0,
        title: Text('Agenda de Entregas'),
        actions: <Widget>[],
      ),
      body: ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {
          return FutureBuilder<QuerySnapshot>(
            future: FirebaseFirestore.instance.collection('orders').get(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Stack(
                  children: [
                    Container(
                      height: 70.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 7,
                        itemBuilder: (BuildContext context, int index) {
                          List weekList = [
                            {
                              "name": "Seg",
                              "day": '12',
                              "today": false,
                            },
                            {
                              "name": "Ter",
                              "day": '13',
                              "today": false,
                            },
                            {
                              "name": "Qua",
                              "day": '14',
                              "today": true,
                            },
                            {
                              "name": "Qui",
                              "day": '15',
                              "today": false,
                            },
                            {
                              "name": "Sex",
                              "day": '16',
                              "today": false,
                            },
                            {
                              "name": "Sab",
                              "day": '17',
                              "today": false,
                            },
                            {
                              "name": "Dom",
                              "day": '18',
                              "today": false,
                            },
                          ];

                          Map dayWeek = weekList[index];
                          return WeekButtonsWidget(
                            day: dayWeek['day'],
                            name: dayWeek['name'],
                            isToday: dayWeek['today'],
                            // items: day['items'].toString(),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 80),
                      child: ListView(
                        children: snapshot.data.docs.map((e) {
                          OrderData orderData = OrderData.fromDocument(e);

                          // obtendo o Map do arquivo constants.dart a partir do índice
                          var mapStatus = Constants.statusOrder.entries
                              .firstWhere(
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
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 15.0,
                                right: 15,
                                top: 5,
                              ),
                              child: Card(
                                color: Colors.white,
                                child: ListTile(
                                  leading: Container(
                                    height: 70,
                                    width: 70,
                                    // child: SvgPicture.asset(
                                    //   'assets/icons/map.svg',
                                    //   // color: Colors.green,
                                    // ),
                                    child: Image.network(
                                      'https://i.pinimg.com/originals/0d/42/c9/0d42c959ec3772af1f73d04fd8d3811f.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  title: Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Text('José da Silva'),
                                  ),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.all(0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.calendar_today,
                                              size: 15,
                                              color: Colors.grey,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text('10:00 - 12:00, 14 mar 2021'),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.location_pin,
                                              size: 15,
                                              color: Colors.grey,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text('Rua Saturnino de Brito, 156'),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        )
                                      ],
                                    ),
                                  ),
                                  trailing: IconButton(
                                    icon: Icon(
                                      Icons.add_location_alt_outlined,
                                      color: Colors.green,
                                      size: 25,
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
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
                      ),
                    ),
                  ],
                );
              }
              return Container();
            },
          );
        },
      ),
      bottomSheet: FlatButton(
        onPressed: () {
          //adicionar função de mudança no status
          // Navigator.of(context).pop();
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MapRoutingScreen(),
            ),
          );
        },
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.green,
            height: 50,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.refresh,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Otimizar rota',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _dataFormatada(Timestamp dataEntr) {
    if (dataEntr != null) {
      DateTime dateAbertura = DateTime.parse(dataEntr.toDate().toString());
      DateFormat dateFormat = DateFormat("dd/MM/yyyy");
      String formattedDate = dateFormat.format(dateAbertura);
      return formattedDate;
    }
    return '--';
    // Convertendo a string de data pra DateTime e alterando o formato de exibição
  }
}
