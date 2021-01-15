import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:producerfarm/Datas/vroom_req.dart';

class DeliveryScreen extends StatefulWidget {
  @override
  _DeliveryScreenState createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          // leading: Image.asset('local_farm/producer_farm/assets/logo.png'),
          elevation: 1.5,
          centerTitle: true,
          title: Text('Entregas'),
          actions: <Widget>[],
        ),
        body: Row(
          children: [Text(_showJSON())],
        ));
  }

  _showJSON() {
    var json =
        '{ "vehicles": [{"id": 1,"start": [2.35044,48.71764],"end": [2.35044,48.71764],"capacity": [30], "time_window": [1600416000,1600430400]}],"jobs": [{"id": 1,"service": 300,"location": [1.98935,48.701]},{"id": 2,"service": 300,"location": [2.03655,48.61128]},{"id": 5,"service": 300,"location": [2.28325,48.5958]},{"id": 6,"service": 300,"location": [2.89357,48.90736]}]}';
    //Para montar a req baseada no banco vai precisar:
    // loc da farm (em coordernadas) - (select * from farm where email/id =
    // loc dos clientes (em coordenadas) - ()
    var vehicleId = 1;
    var start = [2.35044, 48.71764];
    var end = [2.35044, 48.71764];
    var capacity = [30];
    var time_window = [1600416000, 1600430400];
    Vehicles vehicles = Vehicles(
        id: vehicleId,
        start: start,
        end: end,
        capacity: capacity,
        timeWindow: time_window);
    List<Vehicles> listVehicles = [vehicles];
    Jobs job1 = Jobs(id: 1, service: 300, location: [1.98935, 48.701]);
    Jobs job2 = Jobs(id: 2, service: 300, location: [2.03655, 48.61128]);
    Jobs job3 = Jobs(id: 5, service: 300, location: [2.28325, 48.5958]);
    Jobs job4 = Jobs(id: 6, service: 300, location: [2.89357, 48.90736]);
    List<Jobs> listJobs = [job1, job2, job3, job4];
    VROOMReq vroomReq = VROOMReq(vehicles: listVehicles, jobs: listJobs);
    String req = jsonEncode(vroomReq);
    print(req);
    return "";
  }
}
