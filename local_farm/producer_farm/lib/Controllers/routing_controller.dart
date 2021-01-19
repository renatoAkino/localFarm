// import 'package:client/repositories/Routing_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:producerfarm/Datas/order_data.dart';
import 'package:producerfarm/Datas/routing_data.dart';
import 'package:producerfarm/Repositories/routing_repository.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class RoutingController {
  Routing dados;

  final repository = RoutingRepository();

  final state = ValueNotifier<RoutingState>(RoutingState.start);

  String totalDur = '--';

  int numJobs = 0;

  List<double> firstLocation = [];

  List<Step> spr = [];

  List<Marker> markers = [];

  Future start(String body, List<OrderData> orderDataList) async {
    state.value = RoutingState.loading;
    try {
      dados = await RoutingRepository.getRoute(body);
      state.value = RoutingState.sucess;

      numJobs = dados.routes[0].steps.length - 2; //no caso de um único veículo

      Duration duracaoTotal = Duration(seconds: dados.summary.duration);
      totalDur = _printDuration(duracaoTotal);

      firstLocation = dados.routes[0].steps[0].location;

      // GERA A LISTA DE Steps QUE PREENCHERÃO A LISTA ORDENADA DAS ENTREGAS
      _stepGen(dados, orderDataList);

      // GERA A LISTA DE Marks QUE Serão os pontos no mapa
      _markersGen(dados);

      print('sucesso!');
    } catch (e) {
      state.value = RoutingState.error;
      print('não sucesso!');
    }
  }

  String _printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    return "${twoDigits(duration.inHours)}h${twoDigitMinutes}m";
  }

  String _convertArrival(int arrival) {
    // PASSANDO DE INT PARA DATETIME
    var date = DateTime.fromMillisecondsSinceEpoch(arrival * 1000);
    String horas = date.hour.toString();
    String min = date.minute.toString();
    return "${horas.padLeft(2, "0")}:${min.padLeft(2, "0")}";
  }

  void _markersGen(Routing dados) {
    for (var i in dados.routes) {
      for (var j in i.steps) {
        if (j.type == "job") {
          markers.add(
            Marker(
              width: 40.0,
              height: 40.0,
              point: LatLng(j.location[0], j.location[1]),
              builder: (ctx) => Container(
                child: SvgPicture.asset('assets/icons/placeholder.svg'),
              ),
            ),
          );
        } else if (j.type == "start") {
          markers.add(
            Marker(
              width: 40.0,
              height: 40.0,
              point: LatLng(j.location[0], j.location[1]),
              builder: (ctx) => Container(
                child: SvgPicture.asset('assets/icons/farmhouse.svg'),
                // child: SvgPicture.asset('assets/icons/pin_icon_green.svg'),
              ),
            ),
          );
        }
      }
    }
  }

  void _stepGen(Routing dados, List<OrderData> orderDataList) {
    for (var i in dados.routes) {
      for (var j in i.steps) {
        if (j.type == "job") {
          print(j.id);

          String endereco = orderDataList[j.id].client_address;
          // print(endereco);
          String name = orderDataList[j.id].client_name;
          String tel = orderDataList[j.id].client_tel;
          String cep = orderDataList[j.id].client_cep;
          String pedido = orderDataList[j.id].order_id;
          spr.add(
            Step(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      // 'Rua José de Alencar, 38',
                      // 'endereço id:' + j.id.toString(),
                      endereco,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    // '9:53',
                    _convertArrival(j.arrival),
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              // subtitle: Text('07132-580, Jd Drummond, Guarulhos'),
              subtitle: Text('CEP: ' + cep),
              content: Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Container(
                  // color: Colors.grey[100],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Cliente',
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(height: 5),
                          Text(
                            // 'José Roberto',
                            name,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Horário Disponível',
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '08:00 - 18:00',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Contato',
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(height: 5),
                          Text(
                            // '(11)98457-6458',
                            tel,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Pedido',
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(height: 5),
                          Text(
                            // 'A54dXf45697',
                            pedido,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Text(
                      //       'Localização',
                      //       style: TextStyle(color: Colors.grey),
                      //     ),
                      //     SizedBox(height: 5),
                      //     Text(
                      //       // 'A54dXf45697',
                      //       orderDataList[j.id].location[0].toString() +
                      //           '\n' +
                      //           orderDataList[j.id].location[1].toString(),
                      //       style: TextStyle(color: Colors.grey),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),
              state: StepState.indexed,
              isActive: true,
            ),
          );
        }
      }
    }
  }
}

enum RoutingState { start, loading, sucess, error }
