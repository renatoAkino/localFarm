// import 'package:client/repositories/Routing_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:producerfarm/Datas/routing_data.dart';
import 'package:producerfarm/Repositories/routing_repository.dart';

class RoutingController {
  Routing dados;

  final repository = RoutingRepository();

  final state = ValueNotifier<RoutingState>(RoutingState.start);

  Future start(String body) async {
    state.value = RoutingState.loading;
    try {
      dados = await RoutingRepository.getRoute(body);
      state.value = RoutingState.sucess;
      print('sucesso!');
    } catch (e) {
      state.value = RoutingState.error;
      print('não sucesso!');
    }
  }
}

enum RoutingState { start, loading, sucess, error }
