import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:producerfarm/Datas/order_data.dart';
import 'package:producerfarm/Models/user_model.dart';
import 'package:producerfarm/Screens/deliveries/delivery_screen.dart';
import 'package:producerfarm/Screens/orders/confirmation_screen.dart';
import 'package:producerfarm/Screens/orders/order_detail_screen.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../constants.dart';
import 'components/week_buttons.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  var datesList = [];
  var _stateDate = DateTime.now();
  var pickedDay = DateTime.now().day;

  @override
  void initState() {
    super.initState();
    for (int i = -2; i < 5; i++) {
      DateTime date = _stateDate;
      date = date.add(Duration(days: i));
      datesList.add(date);
    }
  }

  void isPicked() {}

  @override
  Widget build(BuildContext context) {
    List weekList = [
      {
        "name": DateFormat('E').format(datesList[0]),
        "day": datesList[0].day.toString(),
        "today": datesList[0].day == pickedDay,
      },
      {
        "name": DateFormat('E').format(datesList[1]),
        "day": datesList[1].day.toString(),
        "today": datesList[1].day == pickedDay,
      },
      {
        "name": DateFormat('E').format(datesList[2]),
        "day": datesList[2].day.toString(),
        "today": datesList[2].day == pickedDay,
      },
      {
        "name": DateFormat('E').format(datesList[3]),
        "day": datesList[3].day.toString(),
        "today": datesList[3].day == pickedDay,
      },
      {
        "name": DateFormat('E').format(datesList[4]),
        "day": datesList[4].day.toString(),
        "today": datesList[4].day == pickedDay,
      },
      {
        "name": DateFormat('E').format(datesList[5]),
        "day": datesList[5].day.toString(),
        "today": datesList[5].day == pickedDay,
      },
      {
        "name": DateFormat('E').format(datesList[6]),
        "day": datesList[6].day.toString(),
        "today": datesList[6].day == pickedDay,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Agenda de Entregas'),
        actions: <Widget>[],
      ),
      body: ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {
          DateTime _now = DateTime.now();
          DateTime _start = DateTime(_now.year, _now.month, _now.day, 0, 0);
          DateTime _end = DateTime(_now.year, _now.month, _now.day, 23, 59, 59);
          return FutureBuilder<QuerySnapshot>(
            future: FirebaseFirestore.instance
                .collection('orders')
                .where('ship_date', isGreaterThanOrEqualTo: _start)
                .where('ship_date', isLessThanOrEqualTo: _end)
                .get(),
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

                          // String dataAberturaFormatada =
                          //     _dataFormatada(orderData.order_date);
                          String dataEntregaFormatada =
                              _dataFormatada(orderData.ship_date);

                          return InkWell(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 15.0,
                                right: 15,
                                top: 5,
                              ),
                              child: ListTile(
                                tileColor: Colors.white,
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
                                  child: Text('<José da Silva>'),
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 10,
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
                                          Text(dataEntregaFormatada +
                                              ' <8:00 - 18:00>'),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
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
                                          Flexible(
                                            child: Text(
                                              '<Rua Saturnino de Brito, 156>',
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      )
                                    ],
                                  ),
                                ),
                                // trailing: IconButton(
                                //   icon: Icon(
                                //     Icons.add_location_alt_outlined,
                                //     color: Colors.green,
                                //     size: 25,
                                //   ),
                                //   onPressed: () {},
                                // ),
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
          // //adicionar função de mudança no status
          // // Navigator.of(context).pop();
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     // builder: (context) => MapRoutingScreen(),
          //     builder: (context) => DeliveryScreen(),
          //   ),
          // );
          _onLoading();
        },
        color: Colors.transparent,
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

  void _onLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            height: 100,
            width: 200,
            child: Row(
              // mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Calculando",
                  style: TextStyle(color: Colors.green, fontSize: 25),
                ),
              ],
            ),
          ),
        );
      },
    );
    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.pop(context); //pop dialog
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DeliveryScreen(),
          ),
        );
      },
    );
  }
}
