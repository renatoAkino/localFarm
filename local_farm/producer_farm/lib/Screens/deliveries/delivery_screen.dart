import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:producerfarm/Controllers/routing_controller.dart';
import 'package:producerfarm/Datas/order_data.dart';
import 'package:producerfarm/Datas/routing_data.dart';
import 'package:producerfarm/Datas/vroom_req.dart';
import 'package:producerfarm/Models/user_model.dart';

import 'components/backgroung_map.dart';
import 'components/draggable.dart';
import 'components/list_adresses.dart';

class DeliveryScreen extends StatefulWidget {
  List<OrderData> orderDataList;
  Timestamp vehicleInitialTime;
  Timestamp vehicleFinalTime;
  LocationData farmLocation;
  DeliveryScreen({
    Key key,
    this.orderDataList,
    this.vehicleInitialTime,
    this.vehicleFinalTime,
    this.farmLocation,
  }) : super(key: key);

  @override
  _DeliveryScreenState createState() => _DeliveryScreenState();
}

_makeJSON(LocationData farmLoc, Timestamp vehicleInitTime,
    Timestamp vehicleFnlTime, List<OrderData> orderDataLst) {
  // print('timewindow' +
  //     vehicleInitTime.millisecondsSinceEpoch.toString() +
  //     ' , ' +
  //     vehicleFnlTime.millisecondsSinceEpoch.toString());

  var vehicleId = 1;
  var start = [farmLoc.latitude, farmLoc.longitude];
  var end = [farmLoc.latitude, farmLoc.longitude];
  var capacity = [100];
  var timeWindow = [
    (vehicleInitTime.millisecondsSinceEpoch / 1000).round(),
    (vehicleFnlTime.millisecondsSinceEpoch / 1000).round()
  ];
  Vehicles vehicles = Vehicles(
      id: vehicleId,
      start: start,
      end: end,
      capacity: capacity,
      timeWindow: timeWindow);
  List<Vehicles> listVehicles = [vehicles];

  List<Jobs> listJobs = [];
  int idJob = 0;

  for (var order in orderDataLst) {
    listJobs.add(Jobs(
      id: idJob,
      service: 300,
      location: [order.location[0], order.location[1]],
    ));
    idJob++;
  }

  VROOMReq vroomReq = VROOMReq(vehicles: listVehicles, jobs: listJobs);
  String req = jsonEncode(vroomReq);
  print(req);
  return req;
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  RoutingController controller = RoutingController();
  String req = '';

  @override
  void initState() {
    super.initState();
    req = _makeJSON(widget.farmLocation, widget.vehicleInitialTime,
        widget.vehicleFinalTime, widget.orderDataList);
    controller.start(req, widget.orderDataList);
  }

  _success() {
    // List<Pedido> pedidos = snapshot.data;
    return _builder(context);
  }

  _error() {
    return Center(
      child: RaisedButton(
        onPressed: () {
          controller.start(req, widget.orderDataList);
        },
        child: Text("Tentar Novamente"),
      ),
    );
  }

  _loading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  _start() {
    return Container(child: Text("teste"));
  }

  stateManagement(RoutingState state) {
    switch (state) {
      case RoutingState.start:
        return _start();
      case RoutingState.loading:
        return _loading();
      case RoutingState.error:
        return _error();
      case RoutingState.sucess:
        return _success();
      default:
        return _start();
    }
  }

  _builder(context) {
    return Stack(
      children: [
        CustomGoogleMap(controller: controller),
        Positioned(
          top: 25,
          left: 10,
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              // color: Colors.green,
              // size: 30,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        DraggableScrollableSheet(
          initialChildSize: 0.30,
          minChildSize: 0.15,
          builder: (BuildContext context, ScrollController scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: CustomScrollViewContent(
                  controller: controller, orderDataList: widget.orderDataList),
            );
          },
        ),
        // ListBuilder Rotas(controller),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var currentFarmId = UserModel.of(context).userData.farmData.farmId;
    // controller.start();
    print(controller.state);
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   // leading: Image.asset('local_farm/producer_farm/assets/logo.png'),
      //   elevation: 1.5,
      //   centerTitle: true,
      //   title: Text('Rotas'),
      //   actions: <Widget>[
      //     IconButton(
      //         onPressed: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //               builder: (context) => MapRoutingScreen(),
      //             ),
      //           );
      //         },
      //         icon: Icon(Icons.map)),
      //   ],
      // ),
      body: AnimatedBuilder(
        animation: controller.state,
        builder: (contex, child) {
          return stateManagement(controller.state.value);
        },
      ),
    );
  }

  // ListBuilderRotas(RoutingController controller) {
  //   return ListView.builder(
  //     shrinkWrap: true,
  //     itemCount: controller.dados.routes.length,
  //     itemBuilder: (context, index) {
  //       Duration duracaoTotal =
  //           Duration(seconds: controller.dados.routes[index].duration);

  //       String sDuration =
  //           "${duracaoTotal.inHours}:${duracaoTotal.inMinutes.remainder(60)}:${(duracaoTotal.inSeconds.remainder(60))}";

  //       return Column(children: [
  //         Text('duração total: ' + sDuration ?? ''),
  //         // Text('duração total: ' +
  //         //     controller.dados.routes[index].duration.toString()),
  //         Text(controller.dados.routes[index].delivery.toString()),
  //         Text(controller.dados.routes[index].vehicle.toString() ?? ''),
  //         ListView.builder(
  //             shrinkWrap: true,
  //             itemCount: controller.dados.routes[index].steps.length,
  //             itemBuilder: (context, idx) {
  //               //LISTA COM ORDEM DAS ENTREGAS
  //               List<Steps> stepList = controller.dados.routes[index].steps;

  //               // PASSANDO DE INT PARA DATETIME
  //               var date = DateTime.fromMillisecondsSinceEpoch(
  //                   stepList[idx].arrival * 1000);
  //               // var date = DateTime.fromMillisecondsSinceEpoch(
  //               //     stepList[idx].arrival.microsecondsSinceEpoch);

  //               return Card(
  //                 child: Column(
  //                   children: [
  //                     Text(stepList[idx].type ?? ''),
  //                     Text(stepList[idx].job.toString() ?? ''),
  //                     Text(stepList[idx].location.toString() ?? ''),
  //                     Text(date.toString() ?? ''),
  //                   ],
  //                 ),
  //               );
  //             }),
  //       ]);
  //     },
  //   );
  // }
}
