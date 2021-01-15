import 'package:flutter/material.dart';

class DeliveryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      // leading: Image.asset('local_farm/producer_farm/assets/logo.png'),
      elevation: 1.5,
      title: Text('Entregas'),
      actions: <Widget>[],
    ));
  }
}
