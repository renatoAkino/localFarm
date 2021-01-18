import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:producerfarm/Datas/farm_data.dart';
import 'package:producerfarm/Controllers/routing_controller.dart';
import 'package:producerfarm/Datas/routing_data.dart';
import 'package:producerfarm/Datas/vroom_req.dart';
import 'package:producerfarm/Models/user_model.dart';

import 'components/backgroung_map.dart';
import 'components/draggable.dart';
import 'components/list_adresses.dart';

class DeliveryScreen extends StatefulWidget {
  @override
  _DeliveryScreenState createState() => _DeliveryScreenState();
}

_showJSON() {
  var json =
      '{ "vehicles": [{"id": 1,"start": [2.35044,48.71764],"end": [2.35044,48.71764],"capacity": [30], "time_window": [1600416000,1600430400]}],"jobs": [{"id": 1,"service": 300,"location": [1.98935,48.701]},{"id": 2,"service": 300,"location": [2.03655,48.61128]},{"id": 5,"service": 300,"location": [2.28325,48.5958]},{"id": 6,"service": 300,"location": [2.89357,48.90736]}]}';
  //Para montar a req baseada no banco vai precisar:
  // loc da farm (em coordernadas) - (select * from farm where email/id =
  // loc dos clientes (em coordenadas) - ()
  var vehicleId = 1;
  var start = [-46.537106931209564, -23.439181110341664];
  var end = [-46.537106931209564, -23.439181110341664];
  var capacity = [30];
  var time_window = [1600416000, 1600430400];
  Vehicles vehicles = Vehicles(
      id: vehicleId,
      start: start,
      end: end,
      capacity: capacity,
      timeWindow: time_window);
  List<Vehicles> listVehicles = [vehicles];
  Jobs job1 = Jobs(
      id: 1,
      service: 300,
      location: [-46.528419256210334, -23.429347065214984]);
  Jobs job2 = Jobs(
      id: 2, service: 300, location: [-46.544855833053596, -23.42883516295531]);
  Jobs job3 = Jobs(
      id: 3, service: 300, location: [-46.54556393623353, -23.432930325536958]);
  Jobs job4 = Jobs(
      id: 4, service: 300, location: [-46.527249813079834, -23.43115839575796]);
  List<Jobs> listJobs = [job1, job2, job3, job4];
  VROOMReq vroomReq = VROOMReq(vehicles: listVehicles, jobs: listJobs);
  String req = jsonEncode(vroomReq);
  // print(req);
  return req;
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  RoutingController controller = RoutingController();
  // String req = _showJSON();
  String req = _showJSON();
  @override
  void initState() {
    super.initState();
    controller.start(req);
  }

  _sucess() {
    // List<Pedido> pedidos = snapshot.data;
    return _builder(context);
  }

  _error() {
    return Center(
      child: RaisedButton(
        onPressed: () {
          controller.start(req);
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
        return _sucess();
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
              child: CustomScrollViewContent(controller: controller),
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

  Container buildContainer(String currentFarmId) {
    return Container(
        child: FutureBuilder(
            // future: getDeliveryData(),
            future: _getFarmData(currentFarmId),
            initialData: 'Aguardando os dados...',
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Center(
                  child: Text(
                    snapshot.data,
                    style: TextStyle(fontSize: 20.0),
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }

  Future<String> getDeliveryData() async =>
      await Future.delayed(Duration(seconds: 10), () {
        return 'Dados recebidos...';
      });

  // String _showJSON() {
  //   var json =
  //       '{ "vehicles": [{"id": 1,"start": [2.35044,48.71764],"end": [2.35044,48.71764],"capacity": [30], "time_window": [1600416000,1600430400]}],"jobs": [{"id": 1,"service": 300,"location": [1.98935,48.701]},{"id": 2,"service": 300,"location": [2.03655,48.61128]},{"id": 5,"service": 300,"location": [2.28325,48.5958]},{"id": 6,"service": 300,"location": [2.89357,48.90736]}]}';
  //   //Para montar a req baseada no banco vai precisar:
  //   // loc da farm (em coordernadas) ? - (select * from farm where email/id =
  //   // loc dos clientes (em coordenadas) ? - ()
  //   var vehicleId = 1;
  //   var start = [2.35044, 48.71764];
  //   var end = [2.35044, 48.71764];
  //   var capacity = [30];
  //   var time_window = [1600416000, 1600430400];
  //   Vehicles vehicles = Vehicles(
  //       id: vehicleId,
  //       start: start,
  //       end: end,
  //       capacity: capacity,
  //       timeWindow: time_window);
  //   List<Vehicles> listVehicles = [vehicles];
  //   Jobs job1 = Jobs(id: 1, service: 300, location: [1.98935, 48.701]);
  //   Jobs job2 = Jobs(id: 2, service: 300, location: [2.03655, 48.61128]);
  //   Jobs job3 = Jobs(id: 5, service: 300, location: [2.28325, 48.5958]);
  //   Jobs job4 = Jobs(id: 6, service: 300, location: [2.89357, 48.90736]);
  //   List<Jobs> listJobs = [job1, job2, job3, job4];
  //   VROOMReq vroomReq = VROOMReq(vehicles: listVehicles, jobs: listJobs);
  //   String req = jsonEncode(vroomReq);
  //   // print(req);
  //   return req;
  // }

  ListBuilderRotas(RoutingController controller) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: controller.dados.routes.length,
      itemBuilder: (context, index) {
        Duration duracaoTotal =
            Duration(seconds: controller.dados.routes[index].duration);

        String sDuration =
            "${duracaoTotal.inHours}:${duracaoTotal.inMinutes.remainder(60)}:${(duracaoTotal.inSeconds.remainder(60))}";

        return Column(children: [
          Text('duração total: ' + sDuration ?? ''),
          // Text('duração total: ' +
          //     controller.dados.routes[index].duration.toString()),
          Text(controller.dados.routes[index].delivery.toString()),
          Text(controller.dados.routes[index].vehicle.toString() ?? ''),
          ListView.builder(
              shrinkWrap: true,
              itemCount: controller.dados.routes[index].steps.length,
              itemBuilder: (context, idx) {
                //LISTA COM ORDEM DAS ENTREGAS
                List<Steps> stepList = controller.dados.routes[index].steps;

                // PASSANDO DE INT PARA DATETIME
                var date = DateTime.fromMillisecondsSinceEpoch(
                    stepList[idx].arrival * 1000);
                // var date = DateTime.fromMillisecondsSinceEpoch(
                //     stepList[idx].arrival.microsecondsSinceEpoch);

                return Card(
                  child: Column(
                    children: [
                      Text(stepList[idx].type ?? ''),
                      Text(stepList[idx].job.toString() ?? ''),
                      Text(stepList[idx].location.toString() ?? ''),
                      Text(date.toString() ?? ''),
                    ],
                  ),
                );
              }),
        ]);
      },
    );
  }

  Future<String> _getFarmData(String farmId) async {
    FarmData farmData;
    final farm = await farmData.getFarmData(farmId);
    log(farmData.name);
    return farmData.name;
  }
}
