import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:producerfarm/Datas/routing_data.dart';

class RoutingRepository {
  // loadJson() async {
  //   String data = await rootBundle.loadString('assets/json/keyboard.json');
  //   var jsonResult = json.decode(data);
  //   print(jsonResult);
  // }

  static Future<Routing> getRoute() async {
    String jsonBody =
        // "{\"vehicles\":[{\"id\":1,\"start\":[2.35044,48.71764],\"end\":[2.35044,48.71764],\"capacity\":[30],\"time_window\":[1600416000,1600430400]}],\"jobs\":[{\"id\":1,\"service\":300,\"location\":[1.98935,48.701]},{\"id\":2,\"service\":300,\"location\":[2.03655,48.61128]},{\"id\":5,\"service\":300,\"location\":[2.28325,48.5958]},{\"id\":6,\"service\":300,\"location\":[2.89357,48.90736]}]}";
        "{'vehicles':[{'id':1,'start':[2.35044,48.71764],'end':[2.35044,48.71764],'capacity':[30],'time_window':[1600416000,1600430400]}],'jobs':[{'id':1,'service':300,'location':[1.98935,48.701]},{'id':2,'service':300,'location':[2.03655,48.61128]},{'id':5,'service':300,'location':[2.28325,48.5958]},{'id':6,'service':300,'location':[2.89357,48.90736]}]}";
    final route = Routing();

    var url = "http://solver.vroom-project.org";

    var header = {
      "Content-Type": "application/json",
      'Accept': 'application/json',
    };

    var body = jsonDecode(jsonBody);

    print(body);

    final response = await http.post(url, headers: header, body: body);

    print(response);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

/*
    List listaResponse = json.decode(response.body);

    for (Map map in listaResponse) {
      Order c = Order.fromJson(map);
      orders.add(c);
    }

    // orders.add(Client(
    //     nome: 'erstóstenes', email: 'era@gmail.com', telefone: '365478945'));
    // orders.add(
    //     Client(nome: 'jânio', email: 'jan@gmail.com', telefone: '364333945'));
    // orders.add(Client(
    //     nome: 'péricles', email: 'per@gmail.com', telefone: '000478945'));
    // orders.add(Client(
    //     nome: 'pitágoras', email: 'pit@gmail.com', telefone: '10999945'));
    // orders.add(Client(
    //     nome: 'manolo', email: 'manolo@gmail.com', telefone: '20999945'));
    // orders.add(
    //     Client(nome: 'jezabel', email: 'jez@gmail.com', telefone: '301111145'));
    // orders.add(
    //     Client(nome: 'natal', email: 'nat@gmail.com', telefone: '111119995'));

    // print('orders>>>>>> $orders');

    */
    return route;
  }
}
