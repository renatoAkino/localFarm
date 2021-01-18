import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:producerfarm/Screens/deliveries/delivery_screen.dart';

import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class PickInfosScreen extends StatefulWidget {
  @override
  _PickInfosScreenState createState() => _PickInfosScreenState();
}

class _PickInfosScreenState extends State<PickInfosScreen> {
  // String _date = DateTime.now().day.toString();
  String _time = "";
  String _timeEnd = "";
  Timestamp initialTime;
  Timestamp finalTime;

  final Location location = Location();

  LocationData _location;
  String lat = 'Latitude ';
  String lon = ' Longitude';
  String _error;

  Future<void> _getLocation() async {
    setState(() {
      _error = null;
    });
    try {
      final LocationData _locationResult = await location.getLocation();
      setState(() {
        _location = _locationResult;
        lat = _location.latitude.toString();
        lon = _location.longitude.toString();
      });
    } on PlatformException catch (err) {
      setState(() {
        _error = err.code;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.green),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            left: 25,
            right: 25,
            bottom: 25), //adjust "40" according to the status bar size
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                'Local de partida:',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              elevation: 4.0,
              onPressed: _getLocation,
              child: Container(
                alignment: Alignment.center,
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.my_location,
                                size: 25.0,
                                color: Colors.green,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                // "Obter Localização",
                                // (_error ?? '${_location ?? "unknown"}'),
                                (_error ?? lat + ',' + lon),
                                style: TextStyle(
                                    color: Colors.black87,
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Text(
                      "  Obter",
                      style: TextStyle(color: Colors.grey, fontSize: 18.0),
                    ),
                  ],
                ),
              ),
              color: Colors.white,
            ),
            SizedBox(
              height: 60,
            ),
// ======================================================================
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                'Hora de início do trajeto:',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),

            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              elevation: 4.0,
              onPressed: () {
                DatePicker.showTimePicker(context,
                    theme: DatePickerTheme(
                      containerHeight: 210.0,
                    ),
                    showTitleActions: true, onConfirm: (time) {
                  print('confirm $time');
                  _time = '${time.hour} : ${time.minute} : ${time.second}';
                  setState(() {
                    initialTime = Timestamp.fromDate(time);
                    print(initialTime.microsecondsSinceEpoch.toString());
                  });
                }, currentTime: DateTime.now(), locale: LocaleType.en);
                setState(() {});
              },
              child: Container(
                alignment: Alignment.center,
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.access_time,
                                size: 25.0,
                                color: Colors.green,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                " $_time",
                                style: TextStyle(
                                    color: Colors.black87,
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Text(
                      "  Escolher",
                      style: TextStyle(
                          color: Colors.grey,
                          // fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                  ],
                ),
              ),
              color: Colors.white,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                'Hora de fim do trajeto:',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            //============================================================
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              elevation: 4.0,
              onPressed: () {
                DatePicker.showTimePicker(context,
                    theme: DatePickerTheme(
                      containerHeight: 210.0,
                    ),
                    showTitleActions: true, onConfirm: (time) {
                  print('confirm $time');
                  _timeEnd = '${time.hour} : ${time.minute} : ${time.second}';
                  setState(() {
                    finalTime = Timestamp.fromDate(time);
                    print(finalTime.microsecondsSinceEpoch.toString());
                  });
                }, currentTime: DateTime.now(), locale: LocaleType.en);
                setState(() {});
              },
              child: Container(
                alignment: Alignment.center,
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.access_time,
                                size: 25.0,
                                color: Colors.green,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                " $_timeEnd",
                                style: TextStyle(
                                    color: Colors.black87,
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Text(
                      "  Escolher",
                      style: TextStyle(
                          color: Colors.grey,
                          // fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                  ],
                ),
              ),
              color: Colors.white,
            )
          ],
        ),
      ),
      bottomSheet: Visibility(
        visible: _time != "" && _timeEnd != "" && lon != ' Longitude',
        child: FlatButton(
          onPressed: () {
            _onLoading();
          },
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green,
              ),
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
                        style: TextStyle(fontSize: 25, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),
                // SizedBox(
                //   width: 15,
                // ),
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
