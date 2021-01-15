import 'package:flutter/material.dart';
import 'package:producerfarm/Controllers/routing_controller.dart';
import 'package:producerfarm/Datas/routing_data.dart';

class DeliveryScreen extends StatefulWidget {
  @override
  _DeliveryScreenState createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  final controller = RoutingController();

  _sucess() {
    return Center(
      child: Text(controller.dados.code.toString()),
    );
  }

  _error() {
    return Center(
      child: RaisedButton(
        onPressed: () {
          controller.start();
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

  @override
  void initState() {
    super.initState();
    controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedBuilder(
        animation: controller.state,
        builder: (contex, child) {
          return stateManagement(controller.state.value);
        },
      ),
    );
  }
}
